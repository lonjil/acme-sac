implement Getauthinfo;

#
# get and save a certificate from a signer in exchange for a valid secret
#

include "sys.m";
	sys: Sys;
	stdin, stdout, stderr: ref Sys->FD;

include "draw.m";

include "keyring.m";
	kr: Keyring;

include "security.m";
	login: Login;

include "string.m";
	str: String;

Getauthinfo: module
{
	init:	fn(ctxt: ref Draw->Context, argv: list of string);
};

usage()
{
	sys->fprint(stderr, "usage: getauthinfo {net!hostname | default | /file}\n");
	raise "fail:usage";
}

init(nil: ref Draw->Context, argv: list of string)
{
	sys = load Sys Sys->PATH;
	stdin = sys->fildes(0);
	stdout = sys->fildes(1);
	stderr = sys->fildes(2);

	# Disable echoing in RAWON mode
	RAWON_STR = nil;

	argv = tl argv;
	if(argv == nil)
		usage();
	keyname := hd argv;
	if(keyname == nil)
		usage();

	kr = load Keyring Keyring->PATH;
	if(kr == nil)
		nomod(Keyring->PATH);

	str = load String String->PATH;
	if(str == nil)
		nomod(String->PATH);

	login = load Login Login->PATH;
	if(login == nil)
		nomod(Login->PATH);

	user := user();
	path := keyname;
	if(path[0] != '/' || len path < 2 || path[0:2] != "./")
		path = "/usr/" + user + "/keyring/" + keyname;

	signer := defaultsigner();
	if(signer == nil){
		sys->fprint(stderr, "getauthinfo: warning: can't get default signer server name\n");
		signer = "$SIGNER";
	}

	passwd := "";
	save := "yes";
	redo := "yes";
	for(;;) {
		signer = promptstring("use signer", signer, RAWOFF);
		user = promptstring("remote user name", user, RAWOFF);
		passwd = promptstring("password", passwd, RAWON);

		info := logon(user, passwd, signer, path, save);
		if(info != nil)
			break;
	}
}

logon(user, passwd, server, path, save: string): ref Keyring->Authinfo
{
	(err, info) := login->login(user, passwd, "net!"+server+"!inflogin");
	if(err != nil){
		sys->fprint(stderr, "getauthinfo: failed to authenticate: %s\n", err);
		return nil;
	}

	# save the info somewhere for later access
	save = promptstring("save in file", save, RAWOFF);
	if(save[0] != 'y'){
		(dir, file) := str->splitr(path, "/");
		if(sys->bind("#s", dir, Sys->MBEFORE) < 0){
			sys->fprint(stderr, "getauthinfo: can't bind file channel on %s: %r\n", dir);
			return nil;
		}
		filio := sys->file2chan(dir, file);
		if(filio == nil) {
			sys->fprint(stderr, "getauthinfo: can't make file2chan %s: %r\n", path);
			return nil;
		}
		sync := chan of int;
		spawn infofile(filio, sync);
		<-sync;
	}

	if(kr->writeauthinfo(path, info) < 0) {
		sys->fprint(stderr, "getauthinfo: can't write certificate to %s: %r\n", path);
		return nil;
	}

	return info;
}

user(): string
{
	sys = load Sys Sys->PATH;

	fd := sys->open("/dev/user", sys->OREAD);
	if(fd == nil)
		return "";

	buf := array[128] of byte;
	n := sys->read(fd, buf, len buf);
	if(n < 0)
		return "";

	return string buf[0:n];	
}

infofile(fileio: ref Sys->FileIO, sync: chan of int)
{
	infodata := array[0] of byte;

	sys->pctl(Sys->NEWPGRP|Sys->NEWFD, nil);
	sync <-= 1;

	for(;;) alt {
	(off, nbytes, fid, rc) := <-fileio.read =>
		if(rc == nil)
			break;
		if(off > len infodata){
			rc <-= (nil, nil);
		} else {
			if(off + nbytes > len infodata)
				nbytes = len infodata - off;
			rc <-= (infodata[off:off+nbytes], nil);
		}

	(off, data, fid, wc) := <-fileio.write =>
		if(wc == nil)
			break;

		if(off != len infodata){
			wc <-= (0, "cannot be rewritten");
		} else {
			nid := array[len infodata+len data] of byte;
			nid[0:] = infodata;
			nid[len infodata:] = data;
			infodata = nid;
			wc <-= (len data, nil);
		}
		data = nil;
	}
}

# get default signer server name
defaultsigner(): string
{
	return "$SIGNER";
}

nomod(s: string)
{
	sys->fprint(stderr, "getauthinfo: can't load %s: %r\n", s);
	raise "fail:load";
}

RAWON_STR := "*";

RAWON : con 0;
RAWOFF : con 1;

promptstring(prompt, def: string, mode: int): string
{
	if(mode == RAWON || def == nil || def == "")
		sys->fprint(stdout, "%s: ", prompt);
	else
		sys->fprint(stdout, "%s [%s]: ", prompt, def);
	(eof, resp) := readline(stdin, mode);
	if(eof)
		exit;
	if(resp == "")
		resp = def;
	return resp;
}

readline(fd: ref Sys->FD, mode: int): (int, string)
{
	i: int;
	eof: int;
	fdctl: ref Sys->FD;

	eof = 0;
	buf := array[128] of byte;
	tmp := array[128] of byte;
	
	if(mode == RAWON){
		fdctl = sys->open("/dev/consctl", sys->OWRITE);
		if(fdctl == nil || sys->write(fdctl,array of byte "rawon",5) != 5){
			sys->fprint(stderr, "unable to change console mode");
			return (1,nil);
		}
	}

	for(sofar := 0; sofar < 128; sofar += i){
		i = sys->read(fd, tmp, 128 - sofar);
		if(i <= 0){
			eof = 1;
			break;
		}
		if(tmp[i-1] == byte '\n'){
			for(j := 0; j < i-1; j++){
				buf[sofar+j] = tmp[j];
				if(mode == RAWON && RAWON_STR != nil)
				   sys->write(stdout,array of byte RAWON_STR,1);
			}
			sofar += j;
			if(mode == RAWON)
				sys->write(stdout,array of byte "\n",1);
			break;
		}
		else {
			for(j := 0; j < i; j++){
				buf[sofar+j] = tmp[j];
				if(mode == RAWON && RAWON_STR != nil)
				   sys->write(stdout,array of byte RAWON_STR,1);
			}
		}		
	}
	if(mode == RAWON)
		sys->write(fdctl,array of byte "rawoff",6);
	return (eof, string buf[0:sofar]);
}
