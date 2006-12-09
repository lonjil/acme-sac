implement ktrans;

include "sys.m";
include "draw.m";
include "libc0.m";
include "libc.m";

minc: con '\t';
maxc: con 'z';

anjal:= array[] of {
	("zuu",	""),
	("zu",	""),
	("zoo",	""),
	("zo",	""),
	("zii",	""),
	("zi",	""),
	("zhuu",	""),
	("zhu",	""),
	("zhoo",	""),
	("zho",	""),
	("zhii",	""),
	("zhi",	""),
	("zhee",	""),
	("zhe",	""),
	("zhau",	""),
	("zhai",	""),
	("zhaa",	""),
	("zha",	""),
	("zhU",	""),
	("zhO",	""),
	("zhI",	""),
	("zhE",	""),
	("zhA",	""),
	("zh",	""),
	("zee",	""),
	("ze",	""),
	("zau",	""),
	("zai",	""),
	("zaa",	""),
	("za",	""),
	("zU",	""),
	("zO",	""),
	("zI",	""),
	("zE",	""),
	("zA",	""),
	("z",	""),
	("yuu",	""),
	("yu",	""),
	("yoo",	""),
	("yo",	""),
	("yii",	""),
	("yi",	""),
	("yee",	""),
	("ye",	""),
	("yau",	""),
	("yai",	""),
	("yaa",	""),
	("ya",	""),
	("yU",	""),
	("yO",	""),
	("yI",	""),
	("yE",	""),
	("yA",	""),
	("y",	""),
	("xuu",	""),
	("xu",	""),
	("xoo",	""),
	("xo",	""),
	("xii",	""),
	("xi",	""),
	("xee",	""),
	("xe",	""),
	("xau",	""),
	("xai",	""),
	("xaa",	""),
	("xa",	""),
	("xU",	""),
	("xO",	""),
	("xI",	""),
	("xE",	""),
	("xA",	""),
	("x",	""),
	("wuu",	""),
	("wu",	""),
	("woo",	""),
	("wo",	""),
	("wii",	""),
	("wi",	""),
	("wee",	""),
	("we",	""),
	("wau",	""),
	("wai",	""),
	("waa",	""),
	("wa",	""),
	("wU",	""),
	("wO",	""),
	("wI",	""),
	("wE",	""),
	("wA",	""),
	("w",	""),
	("vuu",	""),
	("vu",	""),
	("voo",	""),
	("vo",	""),
	("vii",	""),
	("vi",	""),
	("vee",	""),
	("ve",	""),
	("vau",	""),
	("vai",	""),
	("vaa",	""),
	("va",	""),
	("vU",	""),
	("vO",	""),
	("vI",	""),
	("vE",	""),
	("vA",	""),
	("v",	""),
	("uu",		""),
	("u",		""),
	("tuu",	""),
	("tu",	""),
	("tthuu",	""),
	("tthu",	""),
	("tthoo",	""),
	("ttho",	""),
	("tthii",	""),
	("tthi",	""),
	("tthee",	""),
	("tthe",	""),
	("tthau",	""),
	("tthai",	""),
	("tthaa",	""),
	("ttha",	""),
	("tthU",	""),
	("tthO",	""),
	("tthI",	""),
	("tthE",	""),
	("tthA",	""),
	("tth",	""),
	("truu",	""),
	("tru",	""),
	("troo",	""),
	("tro",	""),
	("trii",	""),
	("tri",	""),
	("tree",	""),
	("tre",	""),
	("trau",	""),
	("trai",	""),
	("traa",	""),
	("tra",	""),
	("trU",	""),
	("trO",	""),
	("trI",	""),
	("trE",	""),
	("trA",	""),
	("tr",	""),
	("too",	""),
	("to",	""),
	("tii",	""),
	("ti",	""),
	("thuu",	""),
	("thu",	""),
	("thoo",	""),
	("tho",	""),
	("thii",	""),
	("thi",	""),
	("thee",	""),
	("the",	""),
	("thau",	""),
	("thai",	""),
	("thaa",	""),
	("tha",	""),
	("thU",	""),
	("thO",	""),
	("thI",	""),
	("thE",	""),
	("thA",	""),
	("th",	""),
	("tee",	""),
	("te",	""),
	("tau",	""),
	("tai",	""),
	("taa",	""),
	("ta",	""),
	("tU",	""),
	("tO",	""),
	("tI",	""),
	("tE",	""),
	("tA",	""),
	("t",	""),
	("suu",	""),
	("su",	""),
	("sri",	""),
	("soo",	""),
	("so",	""),
	("sii",	""),
	("si",	""),
	("shuu",	""),
	("shu",	""),
	("shoo",	""),
	("sho",	""),
	("shii",	""),
	("shi",	""),
	("shee",	""),
	("she",	""),
	("shau",	""),
	("shai",	""),
	("shaa",	""),
	("sha",	""),
	("shU",	""),
	("shO",	""),
	("shI",	""),
	("shE",	""),
	("shA",	""),
	("sh",	""),
	("see",	""),
	("se",	""),
	("sau",	""),
	("sai",	""),
	("saa",	""),
	("sa",	""),
	("sU",	""),
	("sO",	""),
	("sI",	""),
	("sE",	""),
	("sA",	""),
	("s",	""),
	("ruu",	""),
	("ru",	""),
	("roo",	""),
	("ro",	""),
	("rii",	""),
	("ri",	""),
	("ree",	""),
	("re",	""),
	("rau",	""),
	("rai",	""),
	("raa",	""),
	("ra",	""),
	("rU",	""),
	("rO",	""),
	("rI",	""),
	("rE",	""),
	("rA",	""),
	("r",	""),
	("q",		""),
	("puu",	""),
	("pu",	""),
	("poo",	""),
	("po",	""),
	("pii",	""),
	("pi",	""),
	("pee",	""),
	("pe",	""),
	("pau",	""),
	("pai",	""),
	("paa",	""),
	("pa",	""),
	("pU",	""),
	("pO",	""),
	("pI",	""),
	("pE",	""),
	("pA",	""),
	("p",	""),
	("oo",		""),
	("o",		""),
	("nuu",	""),
	("nu",	""),
	("nthuu",	""),
	("nthu",	""),
	("nthoo",	""),
	("ntho",	""),
	("nthii",	""),
	("nthi",	""),
	("nthee",	""),
	("nthe",	""),
	("nthau",	""),
	("nthai",	""),
	("nthaa",	""),
	("ntha",	""),
	("nthU",	""),
	("nthO",	""),
	("nthI",	""),
	("nthE",	""),
	("nthA",	""),
	("nth",	""),
	("noo",	""),
	("no",	""),
	("njuu",	""),
	("nju",	""),
	("njoo",	""),
	("njo",	""),
	("njjuu",	""),
	("njju",	""),
	("njjoo",	""),
	("njjo",	""),
	("njjii",	""),
	("njji",	""),
	("njjee",	""),
	("njje",	""),
	("njjau",	""),
	("njjai",	""),
	("njjaa",	""),
	("njja",	""),
	("njjU",	""),
	("njjO",	""),
	("njjI",	""),
	("njjE",	""),
	("njjA",	""),
	("njj",	""),
	("njii",	""),
	("nji",	""),
	("njee",	""),
	("nje",	""),
	("njau",	""),
	("njai",	""),
	("njaa",	""),
	("nja",	""),
	("njU",	""),
	("njO",	""),
	("njI",	""),
	("njE",	""),
	("njA",	""),
	("nj",	""),
	("nii",	""),
	("ni",	""),
	("nguu",	""),
	("ngu",	""),
	("ngoo",	""),
	("ngo",	""),
	("ngii",	""),
	("ngi",	""),
	("ngee",	""),
	("nge",	""),
	("ngau",	""),
	("ngai",	""),
	("ngaa",	""),
	("nga",	""),
	("ngU",	""),
	("ngO",	""),
	("ngI",	""),
	("ngE",	""),
	("ngA",	""),
	("ng",	""),
	("nee",	""),
	("ne",	""),
	("nduu",	""),
	("ndu",	""),
	("ndruu",	""),
	("ndru",	""),
	("ndroo",	""),
	("ndro",	""),
	("ndrii",	""),
	("ndri",	""),
	("ndree",	""),
	("ndre",	""),
	("ndrau",	""),
	("ndrai",	""),
	("ndraa",	""),
	("ndra",	""),
	("ndrU",	""),
	("ndrO",	""),
	("ndrI",	""),
	("ndrE",	""),
	("ndrA",	""),
	("ndr",	""),
	("ndoo",	""),
	("ndo",	""),
	("ndii",	""),
	("ndi",	""),
	("ndee",	""),
	("nde",	""),
	("ndau",	""),
	("ndai",	""),
	("ndaa",	""),
	("nda",	""),
	("ndU",	""),
	("ndO",	""),
	("ndI",	""),
	("ndE",	""),
	("ndA",	""),
	("nd",	""),
	("nau",	""),
	("nai",	""),
	("naa",	""),
	("na",	""),
	("nU",	""),
	("nO",	""),
	("nI",	""),
	("nE",	""),
	("nA",	""),
	("n-uu",	""),
	("n-u",	""),
	("n-oo",	""),
	("n-o",	""),
	("n-ii",	""),
	("n-i",	""),
	("n-ee",	""),
	("n-e",	""),
	("n-au",	""),
	("n-ai",	""),
	("n-aa",	""),
	("n-a",	""),
	("n-U",	""),
	("n-O",	""),
	("n-I",	""),
	("n-E",	""),
	("n-A",	""),
	("n-",	""),
	("n",	""),
	("muu",	""),
	("mu",	""),
	("moo",	""),
	("mo",	""),
	("mii",	""),
	("mi",	""),
	("mee",	""),
	("me",	""),
	("mau",	""),
	("mai",	""),
	("maa",	""),
	("ma",	""),
	("mU",	""),
	("mO",	""),
	("mI",	""),
	("mE",	""),
	("mA",	""),
	("m",	""),
	("luu",	""),
	("lu",	""),
	("loo",	""),
	("lo",	""),
	("lii",	""),
	("li",	""),
	("lee",	""),
	("le",	""),
	("lau",	""),
	("lai",	""),
	("laa",	""),
	("la",	""),
	("lU",	""),
	("lO",	""),
	("lI",	""),
	("lE",	""),
	("lA",	""),
	("l",	""),
	("kuu",	""),
	("ku",	""),
	("koo",	""),
	("ko",	""),
	("kii",	""),
	("ki",	""),
	("kee",	""),
	("ke",	""),
	("kau",	""),
	("kai",	""),
	("kaa",	""),
	("ka",	""),
	("kU",	""),
	("kO",	""),
	("kI",	""),
	("kE",	""),
	("kA",	""),
	("k",	""),
	("juu",	""),
	("ju",	""),
	("joo",	""),
	("jo",	""),
	("jii",	""),
	("ji",	""),
	("jee",	""),
	("je",	""),
	("jau",	""),
	("jai",	""),
	("jaa",	""),
	("ja",	""),
	("jU",	""),
	("jO",	""),
	("jI",	""),
	("jE",	""),
	("jA",	""),
	("j",	""),
	("ii",		""),
	("i",		""),
	("huu",	""),
	("hu",	""),
	("hoo",	""),
	("ho",	""),
	("hii",	""),
	("hi",	""),
	("hee",	""),
	("he",	""),
	("hau",	""),
	("hai",	""),
	("haa",	""),
	("ha",	""),
	("hU",	""),
	("hO",	""),
	("hI",	""),
	("hE",	""),
	("hA",	""),
	("h",	""),
	("guu",	""),
	("gu",	""),
	("goo",	""),
	("go",	""),
	("gii",	""),
	("gi",	""),
	("gee",	""),
	("ge",	""),
	("gau",	""),
	("gai",	""),
	("gaa",	""),
	("ga",	""),
	("gU",	""),
	("gO",	""),
	("gI",	""),
	("gE",	""),
	("gA",	""),
	("g",	""),
	("ee",		""),
	("e",		""),
	("duu",	""),
	("du",	""),
	("doo",	""),
	("do",	""),
	("dii",	""),
	("di",	""),
	("dhuu",	""),
	("dhu",	""),
	("dhoo",	""),
	("dho",	""),
	("dhii",	""),
	("dhi",	""),
	("dhee",	""),
	("dhe",	""),
	("dhau",	""),
	("dhai",	""),
	("dhaa",	""),
	("dha",	""),
	("dhU",	""),
	("dhO",	""),
	("dhI",	""),
	("dhE",	""),
	("dhA",	""),
	("dh",	""),
	("dee",	""),
	("de",	""),
	("dau",	""),
	("dai",	""),
	("daa",	""),
	("da",	""),
	("dU",	""),
	("dO",	""),
	("dI",	""),
	("dE",	""),
	("dA",	""),
	("d",	""),
	("chuu",	""),
	("chu",	""),
	("choo",	""),
	("cho",	""),
	("chii",	""),
	("chi",	""),
	("chee",	""),
	("che",	""),
	("chau",	""),
	("chai",	""),
	("chaa",	""),
	("cha",	""),
	("chU",	""),
	("chO",	""),
	("chI",	""),
	("chE",	""),
	("chA",	""),
	("ch",	""),
	("buu",	""),
	("bu",	""),
	("boo",	""),
	("bo",	""),
	("bii",	""),
	("bi",	""),
	("bee",	""),
	("be",	""),
	("bau",	""),
	("bai",	""),
	("baa",	""),
	("ba",	""),
	("bU",	""),
	("bO",	""),
	("bI",	""),
	("bE",	""),
	("bA",	""),
	("b",	""),
	("au",	""),
	("ai",		""),
	("aa",		""),
	("a",		""),
	("\tnuu",	"\t"),
	("\tnu",	"\t"),
	("\tnoo",	"\t"),
	("\tno",	"\t"),
	("\tnii",	"\t"),
	("\tni",	"\t"),
	("\tnee",	"\t"),
	("\tne",	"\t"),
	("\tnau",	"\t"),
	("\tnai",	"\t"),
	("\tnaa",	"\t"),
	("\tna",	"\t"),
	("\tnU",	"\t"),
	("\tnO",	"\t"),
	("\tnI",	"\t"),
	("\tnE",	"\t"),
	("\tnA",	"\t"),
	("\tn",	"\t"),
	("\t",		"\t"),
	("\nnuu",	"\n"),
	("\nnu",	"\n"),
	("\nnoo",	"\n"),
	("\nno",	"\n"),
	("\nnii",	"\n"),
	("\nni",	"\n"),
	("\nnee",	"\n"),
	("\nne",	"\n"),
	("\nnau",	"\n"),
	("\nnai",	"\n"),
	("\nnaa",	"\n"),
	("\nna",	"\n"),
	("\nnU",	"\n"),
	("\nnO",	"\n"),
	("\nnI",	"\n"),
	("\nnE",	"\n"),
	("\nnA",	"\n"),
	("\nn",	"\n"),
	("\n",		"\n"),
	("U",		""),
	("Suu",	""),
	("Su",	""),
	("Soo",	""),
	("So",	""),
	("Sii",	""),
	("Si",	""),
	("See",	""),
	("Se",	""),
	("Sau",	""),
	("Sai",	""),
	("Saa",	""),
	("Sa",	""),
	("SU",	""),
	("SO",	""),
	("SI",	""),
	("SE",	""),
	("SA",	""),
	("S",	""),
	("Ruu",	""),
	("Ru",	""),
	("Roo",	""),
	("Ro",	""),
	("Rii",	""),
	("Ri",	""),
	("Ree",	""),
	("Re",	""),
	("Rau",	""),
	("Rai",	""),
	("Raa",	""),
	("Ra",	""),
	("RU",	""),
	("RO",	""),
	("RI",	""),
	("RE",	""),
	("RA",	""),
	("R",	""),
	("O",		""),
	("Nuu",	""),
	("Nu",	""),
	("Noo",	""),
	("No",	""),
	("Nii",	""),
	("Ni",	""),
	("Nee",	""),
	("Ne",	""),
	("Nau",	""),
	("Nai",	""),
	("Naa",	""),
	("Na",	""),
	("NU",	""),
	("NO",	""),
	("NI",	""),
	("NE",	""),
	("NA",	""),
	("N",	""),
	("Luu",	""),
	("Lu",	""),
	("Loo",	""),
	("Lo",	""),
	("Lii",	""),
	("Li",	""),
	("Lee",	""),
	("Le",	""),
	("Lau",	""),
	("Lai",	""),
	("Laa",	""),
	("La",	""),
	("LU",	""),
	("LO",	""),
	("LI",	""),
	("LE",	""),
	("LA",	""),
	("L",	""),
	("I",		""),
	("E",		""),
	("A",		""),
	(" nuu",	" "),
	(" nu",	" "),
	(" noo",	" "),
	(" no",	" "),
	(" nii",	" "),
	(" ni",	" "),
	(" nee",	" "),
	(" ne",	" "),
	(" nau",	" "),
	(" nai",	" "),
	(" naa",	" "),
	(" na",	" "),
	(" nU",	" "),
	(" nO",	" "),
	(" nI",	" "),
	(" nE",	" "),
	(" nA",	" "),
	(" n",	" "),
	(" ",		" "),
};

sys: Sys;
libc0: Libc0;
libc: Libc;
natural: int;
in, out, err: ref Sys->FD;
hashtab: array of list of (string, string);

ktrans: module
{
	init: fn(nil: ref Draw->Context, nil: list of string);
};

init(nil: ref Draw->Context, nil: list of string)
{
	buf:= array[128] of byte;
	bi, ei: int;
	nchar, wantmore, partsent: int;
	mstr: string;
	
	sys = load Sys Sys->PATH;
	if((libc0 = load Libc0 Libc0->PATH) == nil)
		fatal("can't load " + Libc0->PATH);
	if((libc = load Libc Libc->PATH) == nil)
		fatal("can't load " + Libc->PATH);
	
	in = sys->fildes(0);
	out = sys->fildes(1);
	err = sys->fildes(2);
	bi = ei = 0;
	wantmore = partsent = 0;
	natural = 1;
	
	inithash();
	
	for(;;){
		if(bi >= ei)
			bi = ei = 0;
		else if(wantmore && ei == len buf - 1){
			buf[0:] = buf[bi:ei];
			bi = ei = 0;
		}
		n := sys->read(in, buf[ei:], len buf - ei - 1);
		if(n <= 0){
			if(!partsent && bi < ei)
				send(buf[bi:], ei-bi);
			exit;
		}
		ei += n;
		buf[ei] = byte '\0';
		wantmore = 0;
		while(bi < ei){
			if(sys->utfbytes(buf[bi:], ei-bi) == 0){
				wantmore = 1;
				break;
			}
			if(changelang(buf[bi])){
				bi++;
				continue;
			}
			if(natural || buf[bi]<byte minc || buf[bi]>byte maxc){
				(nil, clen, nil) := sys->byte2char(buf, bi);
				send(buf[bi:], clen);
				bi += clen;
				continue;
			}
			(mstr, nchar) = match(buf[bi:]);
			if(mstr != nil){
				if(partsent){
					send(array[] of {byte '\b', byte '\b'}, partsent);
					partsent = 0;
				}
				send(array of byte mstr, len array of byte mstr);
				if(nchar == 0){
					wantmore = 1;
					partsent = len mstr;
					break;
				}
				bi += nchar;
			}else{
				if(nchar){
					wantmore = 1;
					break;
					# bug: partsent not considered ("sr<eof>")
				}
				send(buf[bi:], 1);
				bi++;
			}
		}
	}
}

inithash()
{
	hashtab = array[maxc-minc+1] of list of (string, string);
	for(j:=len anjal-1; j >= 0; j--){
		k := anjal[j].t0[0]-minc;
		hashtab[k] = anjal[j] :: hashtab[k];
	}
	anjal = nil;
}

match(buf: array of byte): (string, int)
{
	h: list of (string, string);
	lb, flag, nc: int;
	
	h = hashtab[int buf[0]-minc];
	lb = libc0->strlen(buf);
	nc = flag = 0;
	for(; h != nil; h=tl h){
		m := hd h;
		lr := len m.t0;
		length := libc->min(lr, lb);
		if(strncmp(m.t0, string buf, length) == 0){
			if(length < lr)
				flag = 1;
			else{
				if(!flag)
					nc = len m.t0;
				return (m.t1, nc);
			}
		}
	}
	return (nil, flag);
}

strncmp(s1: string, s2: string, n: int): int
{
	for(i := 0; i < n; i++){
		if(s1[i] != s2[i])
			return s1[i]-int s2[i];
		if(s1[i] == 0)
			break;
	}
	return 0;
}

send(buf: array of byte, n: int)
{
	if(sys->write(out, buf, n) != n)
		fatal("write error");
}

changelang(c: byte): int
{
	if(c == byte ''){	# control-k
		natural = !natural;
		return 1;
	}
	return 0;
}

fatal(s: string)
{
	sys->fprint(err, "ktrans: %s: %r\n", s);
	exit;
}
