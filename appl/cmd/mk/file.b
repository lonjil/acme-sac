#
#	initially generated by c2l
#

#  table-driven version in bootes dump of 12/31/96 
timeof(name: array of byte, force: int): int
{
	if(libc0->strchr(name, '(') != nil)
		return atimeof(force, name);	#  archive 
	if(force)
		return mtime(name);
	return filetime(name);
}

touch(name: array of byte)
{
	bout.puts(sys->sprint("touch(%s)\n", libc0->ab2s(name)));
	if(nflag)
		return;
	if(libc0->strchr(name, '(') != nil)
		atouch(name);	#  archive 
	else if(chgtime(name) < 0){
		perror(name);
		Exit();
	}
}

delete(name: array of byte)
{
	if(libc0->strchr(name, '(') == nil){	#  file 
		if(sys->remove(libc0->ab2s(name)) < 0)
			perror(name);
	}
	else
		sys->fprint(sys->fildes(2), "hoon off; mk can'tdelete archive members\n");
}

timeinit(s: array of byte)
{
	t: int;
	cp: array of byte;
	r: int;
	c, n: int;

	t = daytime->now();
	while(int s[0]){
		cp = s;
		do{
			(r, n, nil) = sys->byte2char(s, 0);
			if(r == ' ' || r == ',' || r == '\n')
				break;
			s = s[n: ];
		}while(int s[0]);
		c = int s[0];
		s[0] = byte 0;
		symlooki(libc0->strdup(cp), S_TIME, t).ivalue = t;
		if(c){
			s[0] = byte c;
			s = s[1: ];
		}
		while(int s[0]){
			(r, n, nil) = sys->byte2char(s, 0);
			if(r != ' ' && r != ',' && r != '\n')
				break;
			s = s[n: ];
		}
	}
}
