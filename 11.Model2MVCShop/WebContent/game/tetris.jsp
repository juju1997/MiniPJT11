<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<title></title>

<!---- [1단계] 아래 코드를 <HEAD> 와 </HEAD> 태그 사이에 붙여 넣으세요 --->

<script language="JavaScript">
	var t = '';
	t1 = '';
	qul = 0;
	xazi = 0;
	done = 1;
	sackisidone = 1;
	sur = true;
	ldd = false;
	var best = 0;
	dav = false;
	m1 = 0;
	m2 = 0;
	m3 = 0;
	m4 = 0;
	xazidoneze = 10;
	var qulebi = 0;
	n1 = 0;
	n2 = 0;
	n3 = 0;
	n4 = 0;
	strt = false;
	gacherdi = false;
	var i = 0;
	j = 0;
	l = 0;
	shua = 540;
	shuabiji = 50;
	shuavardna = 20;
	var dro, dro2, shemdegi;
	var qvebi = new Array();
	var ferebi = new Array('white', 'magenta', 'red', 'chocolate', 'blue',
			'green', 'gold', 'coral');
	var suruch = ferebi[0];
	var tx = '시작버튼을 누른후\n시작하려면 상하좌우 화살표를 누르세요';
	var txabo = 'Scriptris - Javascript Tetris \n Game idea by Alexey Pajitnov. \n Script by Alex-Soft.net. 2002.';

	function bruni() {
		axali(i1, j1, suruch, 0);
		axali(i2, j2, suruch, 0);
		axali(i3, j3, suruch, 0);
		axali(i4, j4, suruch, 0);
		i1 = m1;
		j1 = n1;
		i2 = m2;
		j2 = n2;
		i3 = m3;
		j3 = n3;
		i4 = m4;
		j4 = n4;
		axali(i1, j1, sur, sh);
		axali(i2, j2, sur, sh);
		axali(i3, j3, sur, sh);
		axali(i4, j4, sur, sh);
	}

	function brunva() {
		if ((strt) && (!gacherdi)) {
			if (sh == 7) {
				sh = 14;
			} else if (sh == 14) {
				sh = 21;
			} else if (sh == 21) {
				sh = 28;
			} else if (sh == 28) {
				sh = 7;
			} else if (sh == 6) {
				m2 = i2 + 1;
				n2 = j2 + 1;
				m1 = i1;
				n1 = j1;
				m3 = i3 - 1;
				n3 = j3 - 1;
				m4 = i4 - 2;
				n4 = j4 - 2;
				if (kiara()) {
					sh = 13;
					bruni();
				}
			} else if (sh == 13) {
				m1 = i1;
				n1 = j1;
				m2 = i2 + 1;
				n2 = j2 - 1;
				m3 = i3 - 1;
				n3 = j3 + 1;
				m4 = i4 - 2;
				n4 = j4 + 2;
				if (kiara()) {
					sh = 20;
					bruni();
				}
			} else if (sh == 20) {
				m1 = i1;
				n1 = j1;
				m2 = i2 - 1;
				n2 = j2 - 1;
				m3 = i3 + 1;
				n3 = j3 + 1;
				m4 = i4 + 2;
				n4 = j4 + 2;
				if (kiara()) {
					sh = 27;
					bruni();
				}
			} else if (sh == 27) {
				m1 = i1;
				n1 = j1;
				m2 = i2 - 1;
				n2 = j2 + 1;
				m3 = i3 + 1;
				n3 = j3 - 1;
				m4 = i4 + 2;
				n4 = j4 - 2;
				if (kiara()) {
					sh = 6;
					bruni();
				}
			} else if (sh == 5) {
				m1 = i1;
				n1 = j1;
				m2 = i2 - 1;
				n2 = j2 + 1;
				m3 = i3;
				n3 = j3 + 2;
				m4 = i2;
				n4 = j2;
				if (kiara()) {
					sh = 12;
					bruni();
				}
			} else if (sh == 12) {
				m1 = i1;
				n1 = j1;
				m2 = i2 + 1;
				n2 = j2 + 1;
				m3 = i3 + 2;
				n3 = j3;
				m4 = i2;
				n4 = j2;
				if (kiara()) {
					sh = 19;
					bruni();
				}
			} else if (sh == 19) {
				m1 = i1;
				n1 = j1;
				m2 = i2 + 1;
				n2 = j2 - 1;
				m3 = i3;
				n3 = j3 - 2;
				m4 = i2;
				n4 = j2;
				if (kiara()) {
					sh = 26;
					bruni();
				}
			} else if (sh == 26) {
				m1 = i1;
				n1 = j1;
				m2 = i2 - 1;
				n2 = j2 - 1;
				m3 = i3 - 2;
				n3 = j3;
				m4 = i2;
				n4 = j2;
				if (kiara()) {
					sh = 5;
					bruni();
				}
			} else if (sh == 4) {
				m1 = i1;
				n1 = j1;
				m2 = i4;
				n2 = j4;
				m3 = i3 + 2;
				n3 = j3;
				m4 = i4 - 1;
				n4 = j4 - 1;
				if (kiara()) {
					sh = 11;
					bruni();
				}
			} else if (sh == 11) {
				m1 = i1;
				n1 = j1;
				m2 = i4;
				n2 = j4;
				m3 = i3;
				n3 = j3 - 2;
				m4 = i4 - 1;
				n4 = j4 + 1;
				if (kiara()) {
					sh = 18;
					bruni();
				}
			} else if (sh == 18) {
				m1 = i1;
				n1 = j1;
				m2 = i4;
				n2 = j4;
				m3 = i3 - 2;
				n3 = j3;
				m4 = i4 + 1;
				n4 = j4 + 1;
				if (kiara()) {
					sh = 25;
					bruni();
				}
			} else if (sh == 25) {
				m1 = i1;
				n1 = j1;
				m2 = i4;
				n2 = j4;
				m3 = i3;
				n3 = j3 + 2;
				m4 = i4 + 1;
				n4 = j4 - 1;
				if (kiara()) {
					sh = 4;
					bruni();
				}
			} else if (sh == 3) {
				m1 = i1;
				n1 = j1;
				m2 = i3;
				n2 = j3;
				m3 = i3 + 1;
				n3 = j3 + 1;
				m4 = i2;
				n4 = j2;
				if (kiara()) {
					sh = 10;
					bruni();
				}
			} else if (sh == 10) {
				m1 = i1;
				n1 = j1;
				m2 = i3;
				n2 = j3;
				m3 = i3 + 1;
				n3 = j3 - 1;
				m4 = i2;
				n4 = j2;
				if (kiara()) {
					sh = 17;
					bruni();
				}
			} else if (sh == 17) {
				m1 = i1;
				n1 = j1;
				m2 = i3;
				n2 = j3;
				m3 = i3 - 1;
				n3 = j3 - 1;
				m4 = i2;
				n4 = j2;
				if (kiara()) {
					sh = 24;
					bruni();
				}
			} else if (sh == 24) {
				m1 = i1;
				n1 = j1;
				m2 = i3;
				n2 = j3;
				m3 = i3 - 1;
				n3 = j3 + 1;
				m4 = i2;
				n4 = j2;
				if (kiara()) {
					sh = 3;
					bruni();
				}
			} else if (sh == 2) {
				m1 = i1;
				n1 = j1;
				m2 = i2 - 1;
				n2 = j2 + 1;
				m3 = i2;
				n3 = j2;
				m4 = i4 - 2;
				n4 = j4 - 2;
				if (kiara()) {
					sh = 9;
					bruni();
				}
			} else if (sh == 9) {
				m1 = i1;
				n1 = j1;
				m2 = i2 + 1;
				n2 = j2 + 1;
				m3 = i2;
				n3 = j2;
				m4 = i4 - 2;
				n4 = j4 + 2;
				if (kiara()) {
					sh = 16;
					bruni();
				}
			} else if (sh == 16) {
				m1 = i1;
				n1 = j1;
				m2 = i2 + 1;
				n2 = j2 - 1;
				m3 = i2;
				n3 = j2;
				m4 = i4 + 2;
				n4 = j4 + 2;
				if (kiara()) {
					sh = 23;
					bruni();
				}
			} else if (sh == 23) {
				m1 = i1;
				n1 = j1;
				m2 = i2 - 1;
				n2 = j2 - 1;
				m3 = i2;
				n3 = j2;
				m4 = i4 + 2;
				n4 = j4 - 2;
				if (kiara()) {
					sh = 2;
					bruni();
				}
			} else if (sh == 1) {
				m1 = i1;
				n1 = j1;
				m2 = i3;
				n2 = j3;
				m3 = i3 - 1;
				n3 = j3 - 1;
				m4 = i4 - 2;
				n4 = j4 - 2;
				if (kiara()) {
					sh = 8;
					bruni();
				}
			} else if (sh == 8) {
				m1 = i1;
				n1 = j1;
				m2 = i3;
				n2 = j3;
				m3 = i3 - 1;
				n3 = j3 + 1;
				m4 = i4 - 2;
				n4 = j4 + 2;
				if (kiara()) {
					sh = 15;
					bruni();
				}
			} else if (sh == 15) {
				m1 = i1;
				n1 = j1;
				m2 = i3;
				n2 = j3;
				m3 = i3 + 1;
				n3 = j3 + 1;
				m4 = i4 + 2;
				n4 = j4 + 2;
				if (kiara()) {
					sh = 22;
					bruni();
				}
			} else if (sh == 22) {
				m1 = i1;
				n1 = j1;
				m2 = i3;
				n2 = j3;
				m3 = i3 + 1;
				n3 = j3 - 1;
				m4 = i4 + 2;
				n4 = j4 - 2;
				if (kiara()) {
					sh = 1;
					bruni();
				}
			}
		}
	}

	function marcxniv() {
		if ((strt) && (!gacherdi)) {
			if ((j1 > 1) && (j2 > 1) && (j3 > 1) && (j4 > 1)
					&& (qvebi[(i1 - 1) * j10 + j1 - 1] != 29)
					&& (qvebi[(i2 - 1) * j10 + j2 - 1] != 29)
					&& (qvebi[(i3 - 1) * j10 + j3 - 1] != 29)
					&& (qvebi[(i4 - 1) * j10 + j4 - 1] != 29)) {
				axali(i1, j1, suruch, 0);
				axali(i2, j2, suruch, 0);
				axali(i3, j3, suruch, 0);
				axali(i4, j4, suruch, 0);
				j1--;
				j2--;
				j3--;
				j4--;
				axali(i1, j1, sur, sh);
				axali(i2, j2, sur, sh);
				axali(i3, j3, sur, sh);
				axali(i4, j4, sur, sh);
			}
		}
	}

	function marjvniv() {
		if ((strt) && (!gacherdi)) {
			if ((j1 < j10) && (j2 < j10) && (j3 < j10) && (j4 < j10)
					&& (qvebi[(i1 - 1) * j10 + j1 + 1] != 29)
					&& (qvebi[(i2 - 1) * j10 + j2 + 1] != 29)
					&& (qvebi[(i3 - 1) * j10 + j3 + 1] != 29)
					&& (qvebi[(i4 - 1) * j10 + j4 + 1] != 29)) {
				axali(i1, j1, suruch, 0);
				axali(i2, j2, suruch, 0);
				axali(i3, j3, suruch, 0);
				axali(i4, j4, suruch, 0);
				j1++;
				j2++;
				j3++;
				j4++;
				axali(i1, j1, sur, sh);
				axali(i2, j2, sur, sh);
				axali(i3, j3, sur, sh);
				axali(i4, j4, sur, sh);
			}
		}
	}

	function chavardes() {
		shua = shuavardna;
	}

	function extract(val) {
		if ((endOfCookie = document.cookie.indexOf(';', val)) == -1) {
			endOfCookie = document.cookie.length;
		}
		return unescape(document.cookie.substring(val, endOfCookie));
	}

	function read(names) {
		var number = document.cookie.length;
		var len = names.length;
		var u = 0;
		var v;
		while (u <= number) {
			v = u + len;
			if (document.cookie.substring(u, v) == names)
				return (extract(v));
			u = document.cookie.indexOf(' ', u) + 1;
			if (u == 0)
				break;
		}
		return (null);
	}

	shuadidi = shua;

	coo = read('robest=');
	if (coo == null) {
		i20 = 22
	} else {
		i20 = parseInt(coo)
	};

	coo = read('cobest=');
	if (coo == null) {
		j10 = 11
	} else {
		j10 = parseInt(coo)
	};

	i19 = i20 - 1;
	j9 = j10 - 1;
	ij200 = i20 * j10;

	for (l = 1; l <= ij200; l++) {
		qvebi[l] = 0;
	}

	if (dro != null)
		clearTimeout(dro);
	if (dro2 != null)
		clearTimeout(dro2);

	function daicke() {
		if ((strt == false) && (ldd)) {
			sackisidone = 1;
			done = 1;
			for (i = 0; i <= 9; i++) {
				if (document.forms[0].elements['doneairchie'].options[i].selected) {
					sackisidone = document.forms[0].elements['doneairchie'].options[i].text;
					done = sackisidone;
					qulebi = 0;
					for (j = 1; j <= done; j++) {
						qulebi = qulebi + j * j * xazidoneze;
					}
					document.forms[0].elements[2].value = ' ' + done;
					break;
				}
			}
			var coo;
			ricxvi();
			achveneshemdegi();
			for (l = 1; l <= ij200; l++) {
				qvebi[l] = 0;
				l1 = l - 1;
				document.all['d' + l1].style.backgroundColor = suruch;
			}
			strt = true;
			gacherdi = false;
			qul = 0;
			xazi = 0;
			cooknam = 'best2001' + i20 + j10 + '=';
			coo = read(cooknam);
			if (coo == null) {
				best = 0;
				nam = sax;
				st = '0'
			} else {
				k1 = coo.indexOf('[');
				k3 = k1 + 1;
				k4 = coo.indexOf(']') - k1 - 1;
				k6 = coo.length;
				st = coo.substring(k3, k6);
				st = st.substring(0, k4);
				best = parseInt(st);
				nam = coo.substring(0, k1);
			}
			shua = shuadidi - shuabiji * done;
			if (best == 0)
				document.forms[0].elements[0].value = ''
			else
				document.forms[0].elements[0].value = ' Score: 0.  ' + nam
						+ ': ' + best;
			axaliqva();
			if (dro != null)
				clearTimeout(dro);
			rocadroa();
		}
	}

	function ricxvi() {
		a = 7 * Math.random();
		shemdegi = Math.ceil(a);
	}

	function bolos() {
		var cook;
		var todayDate = new Date();
		strt = false;
		with (document) {
			if (qul > best) {
				best = qul;
				todayDate.setDate(todayDate.getDate() + 30);
				st2 = prompt('Congratulations! Enter Your Name:', nam);
				nam = st2;
				cooknam = 'best2001' + i20 + j10 + '=';
				cookie = cooknam + nam + '[' + best + ']' + '; expires='
						+ todayDate.toGMTString() + ';';
				forms[0].elements[0].value = 'Congratulations ' + nam + '!';
			} else {
				forms[0].elements[0].value = 'Result: ' + qul + '. ' + nam
						+ ': ' + best;
			}
			with (document) {
				val = 3 * j10 - 1;
				for (i = 0; i <= val; i++) {
					all['p' + i].style.backgroundColor = suruch;
				}
			}
		}
		document.forms[1].elements[0].focus();
	}

	function rowsclick() {
		for (i = 0; i <= 3; i++) {
			if (document.forms[0].elements['rowsairchie'].options[i].selected) {
				i20 = document.forms[0].elements['rowsairchie'].options[i].text;
				todayDate = new Date();
				todayDate.setDate(todayDate.getDate() + 30);
				document.cookie = 'robest=' + i20 + '; expires='
						+ todayDate.toGMTString() + ';';
				break;
			}
		}
		document.location = document.location.href;
	}

	function columnsclick() {
		for (i = 0; i <= 3; i++) {
			if (document.forms[0].elements['columnsairchie'].options[i].selected) {
				j10 = document.forms[0].elements['columnsairchie'].options[i].text;
				todayDate = new Date();
				todayDate.setDate(todayDate.getDate() + 30);
				document.cookie = 'cobest=' + j10 + '; expires='
						+ todayDate.toGMTString() + ';';
				break;
			}
		}
		document.location = document.location.href;
	}

	function axaliqva() {
		shua = shuadidi - shuabiji * done;
		sh = shemdegi;
		sur = ferebi[sh];
		if (sh == 1) {
			i1 = 1;
			j1 = 5;
			i2 = 1;
			j2 = 6;
			i3 = 2;
			j3 = 5;
			i4 = 3;
			j4 = 5;
		} else if (sh == 2) {
			i1 = 1;
			j1 = 5;
			i2 = 1;
			j2 = 4;
			i3 = 2;
			j3 = 5;
			i4 = 3;
			j4 = 5;
		} else if (sh == 3) {
			i1 = 2;
			j1 = 6;
			i2 = 1;
			j2 = 6;
			i3 = 2;
			j3 = 7;
			i4 = 2;
			j4 = 5;
			sh = 10;
		} else if (sh == 4) {
			i1 = 2;
			j1 = 5;
			i2 = 2;
			j2 = 6;
			i3 = 1;
			j3 = 6;
			i4 = 3;
			j4 = 5;
		} else if (sh == 5) {
			i1 = 2;
			j1 = 5;
			i2 = 2;
			j2 = 4;
			i3 = 1;
			j3 = 4;
			i4 = 3;
			j4 = 5;
		} else if (sh == 6) {
			i1 = 1;
			j1 = 5;
			i2 = 1;
			j2 = 4;
			i3 = 1;
			j3 = 6;
			i4 = 1;
			j4 = 7;
			sh = 27;
		} else if (sh == 7) {
			i1 = 2;
			j1 = 5;
			i2 = 2;
			j2 = 6;
			i3 = 1;
			j3 = 6;
			i4 = 1;
			j4 = 5;
		}
		;
		if ((qvebi[i1, j1] == 29) || (qvebi[i2, j2] == 29)
				|| (qvebi[i3, j3] == 29) || (qvebi[i4, j4] == 29)) {
			bolos();
		} else {
			axali(i1, j1, sur, sh);
			axali(i2, j2, sur, sh);
			axali(i3, j3, sur, sh);
			axali(i4, j4, sur, sh);
		}
	}

	function axalish(ii, jj, ff) {
		l = (ii - 1) * j10 + jj;
		l1 = l - 1;
		document.all['p' + l1].style.backgroundColor = ferebi[ff];
	}

	function axali(ii, jj, fil, ss) {
		l = (ii - 1) * j10 + jj;
		if (qvebi[l] != ss) {
			qvebi[l] = ss;
			l1 = l - 1;
			document.all['d' + l1].style.backgroundColor = fil;
		}
	}

	function davardna() {
		dav = false;
		for (k = 1; k <= 4; k++) {
			for (i = i20; i >= 1; i--) {
				n1 = 0;
				for (j = 1; j <= j10; j++) {
					l = (i - 1) * j10 + j;
					if (qvebi[l] == 29)
						n1++
				}
				if (n1 == j10) {
					for (i1 = i; i1 >= 2; i1--) {
						for (j1 = 1; j1 <= j10; j1++) {
							l = (i1 - 1) * j10 + j1;
							if (qvebi[l] != qvebi[l - j10]) {
								l1 = l - 1;
								qvebi[l] = qvebi[l - j10];
								lj = l1 - j10;
								document.all['d' + l1].style.backgroundColor = document.all['d'
										+ lj].style.backgroundColor;
							}
						}
					}
					dav = true;
					xazi++
					qul = qul + done * done;
					if ((qul >= qulebi) && (done < 10)) {
						xazi = 0;
						done++;
						qulebi = 0;
						for (i = 1; i <= done; i++) {
							qulebi = qulebi + i * i * xazidoneze;
						}
					}
					document.forms[0].elements[2].value = ' ' + done;
					document.forms[0].elements[0].value = 'Score: ' + qul
							+ '.  ' + nam + ': ' + best + '.';
				}
				if (n1 == j10)
					break;
			}
			if (n1 != j10)
				break;
		}
	}

	function achveneshemdegi() {
		val = 3 * j10 - 1;
		for (i = 0; i <= val; i++)
			document.all['p' + i].style.backgroundColor = suruch;
		val = shemdegi;
		if (val == 1) {
			i1s = 1;
			j1s = 5;
			i2s = 1;
			j2s = 6;
			i3s = 2;
			j3s = 5;
			i4s = 3;
			j4s = 5;
		} else if (val == 2) {
			i1s = 1;
			j1s = 5;
			i2s = 1;
			j2s = 4;
			i3s = 2;
			j3s = 5;
			i4s = 3;
			j4s = 5;
		} else if (val == 3) {
			i1s = 3;
			j1s = 6;
			i2s = 2;
			j2s = 6;
			i3s = 3;
			j3s = 7;
			i4s = 3;
			j4s = 5;
		} else if (val == 4) {
			i1s = 2;
			j1s = 5;
			i2s = 2;
			j2s = 6;
			i3s = 1;
			j3s = 6;
			i4s = 3;
			j4s = 5;
		} else if (val == 5) {
			i1s = 2;
			j1s = 5;
			i2s = 2;
			j2s = 4;
			i3s = 1;
			j3s = 4;
			i4s = 3;
			j4s = 5;
		} else if (val == 6) {
			i1s = 2;
			j1s = 5;
			i2s = 2;
			j2s = 4;
			i3s = 2;
			j3s = 6;
			i4s = 2;
			j4s = 7;
		} else if (val == 7) {
			i1s = 2;
			j1s = 5;
			i2s = 2;
			j2s = 6;
			i3s = 1;
			j3s = 6;
			i4s = 1;
			j4s = 5;
		}
		axalish(i1s, j1s, val);
		axalish(i2s, j2s, val);
		axalish(i3s, j3s, val);
		axalish(i4s, j4s, val);
	}

	function rocadroa() {
		if ((strt == true) && (gacherdi == false)) {
			if ((i1 > i19) || (i2 > i19) || (i3 > i19) || (i4 > i19)
					|| (qvebi[(i1) * j10 + j1] == 29)
					|| (qvebi[(i2) * j10 + j2] == 29)
					|| (qvebi[(i3) * j10 + j3] == 29)
					|| (qvebi[(i4) * j10 + j4] == 29)) {
				qvebi[(i1 - 1) * j10 + j1] = 29;
				qvebi[(i2 - 1) * j10 + j2] = 29;
				qvebi[(i3 - 1) * j10 + j3] = 29;
				qvebi[(i4 - 1) * j10 + j4] = 29;
				davardna();
				axaliqva();
				if (strt) {
					ricxvi();
					achveneshemdegi();
				}
			} else {
				if (i1 > 2) {
					if (qvebi[(i1 - 2) * j10 + j1] != sh)
						axali(i1, j1, suruch, 0);
					if (qvebi[(i2 - 2) * j10 + j2] != sh)
						axali(i2, j2, suruch, 0);
					if (qvebi[(i3 - 2) * j10 + j3] != sh)
						axali(i3, j3, suruch, 0);
					if (qvebi[(i4 - 2) * j10 + j4] != sh)
						axali(i4, j4, suruch, 0);
				} else {
					axali(i1, j1, suruch, 0);
					axali(i2, j2, suruch, 0);
					axali(i3, j3, suruch, 0);
					axali(i4, j4, suruch, 0);
				}
				i1++;
				i2++;
				i3++;
				i4++;
				axali(i1, j1, sur, sh);
				axali(i2, j2, sur, sh);
				axali(i3, j3, sur, sh);
				axali(i4, j4, sur, sh);
			}
			dro = setTimeout('rocadroa()', shua);
			return true;
		}
	}

	function kiara() {
		vali = true;
		if ((n1 < 1) || (n2 < 1) || (n3 < 1) || (n4 < 1))
			vali = false;
		if ((n1 > j10) || (n2 > j10) || (n3 > j10) || (n4 > j10))
			vali = false;
		if (vali) {
			if ((m1 < 1) || (m2 < 1) || (m3 < 1) || (m4 < 1))
				vali = false;
			if ((m1 > i20) || (m2 > i20) || (m3 > i20) || (m4 > i20))
				vali = false;
		}
		if (vali) {
			if ((qvebi[(m1 - 1) * j10 + n1] == 29)
					|| (qvebi[(m2 - 1) * j10 + n2] == 29))
				vali = false;
			if ((qvebi[(m3 - 1) * j10 + n3] == 29)
					|| (qvebi[(m4 - 1) * j10 + n4] == 29))
				vali = false;
		}
		return vali;
	}

	function zemot() {
		self.focus();
		document.forms[0].elements[0].value = ' 시작버튼을 누르세요';
		i = Math.round((i20 - 18) / 2);
		document.forms[0].elements['rowsairchie'].options[i].selected = true;
		j = j10 - 9;
		document.forms[0].elements['columnsairchie'].options[j].selected = true;
		cooknam = 'best2001' + i20 + j10 + '=';
		coo = read(cooknam);
		ldd = true;
		sax = read('abest=');
		if (sax == null)
			sax = '';
		nam = '';
		document.forms[1].elements[0].focus();
	}

	document.onkeydown = keyDown;

	function keyDown(DnEvents) {
		k = window.event.keyCode;
		if (k == 39) {
			marjvniv()
		} else if (k == 37) {
			marcxniv()
		} else if (k == 38) {
			brunva()
		} else if (k == 40) {
			chavardes()
		}
		;
	}

	function gachereba() {
		if (strt) {
			if (gacherdi == false) {
				gacherdi = true;
				document.forms[1].elements[1].value = '^Pause ';
				if (dro != null)
					clearTimeout(dro);
			} else {
				gacherdi = false;
				document.forms[1].elements[1].value = ' Pause ';
				dro = setTimeout('rocadroa()', shua);
			}
		}
	}

	function chacera(mc) {
		if (mc == 3) {
			aso = 'p'
		} else {
			aso = 'd'
		}
		;
		document.write('<TABLE Border=0 CellPadding=0 CellSpacing=0>');
		for (i = 1; i <= mc; i++) {
			with (document) {
				write("<TR>");
				for (j = 0; j <= j9; j++) {
					l = (i - 1) * j10 + j;
					write("<TD align=center bgcolor="+suruch+" width=15 height=15 id='"+aso+l+"'></TD>")
				}
				write("</TR>");
			}
		}
		document.write('</TABLE>');
	}

	

	function hlp() {
		alert(tx);
	}

	function abo() {
		alert(txabo);
	}
//-->
</script>

<!------------------------- 여기까지 ------------------------------------>

</head>

<!---- [2단계] 아래 코드를 <BODY> 태그 안에 붙여 넣으세요 --->

<body onLoad="zemot()">

	<!------------------------- 여기까지 ------------------------------------>

	<!---- [2단계] 아래의 방법으로 <BODY> 와 </BODY> 태그 사이에 붙여 넣으세요 --->

	<CENTER>
		<TABLE CellPadding=6 CellSpacing=0 border=5 bgcolor=gray>
			<TR>
				<TD Align=center valign=top><script language="JavaScript">
					chacera(3);
				</script>

					<FORM>
						<TABLE border=0 width='100%'>
							<TR>
								<TD align=center colspan=2><INPUT TYPE='text' SIZE=29
									VALUE='잠시 기다려 주세용'></TD>
							</TR>

							<TR>
								<TD><INPUT TYPE='text' SIZE=14 VALUE='레벨'></TD>
								<TD align=right><INPUT TYPE='text' SIZE=8 VALUE=''>
								</TD>
							</TR>

							<TR>
								<TD><INPUT TYPE='text' SIZE=14 VALUE='시작레벨'></TD>
								<TD align=right><SELECT NAME='doneairchie'
									style="color: black; font: 10pt verdana; width: 75; background: white"
									onmouseOver="javascript: this.style.color='gray'"
									onmouseOut="javascript: this.style.color='black'">
										<OPTION>1
										<OPTION>2
										<OPTION SELECTED>3
										<OPTION>4
										<OPTION>5
										<OPTION>6
										<OPTION>7
										<OPTION>8
										<OPTION>9
										<OPTION>10
								</SELECT></TD>
							</TR>

							<TR>
								<TD><INPUT TYPE='text' SIZE=14 VALUE='세로'></TD>
								<TD align=right><SELECT NAME='rowsairchie'
									style="color: black; font: 10pt verdana; width: 75; background: white"
									onchange='rowsclick()'
									onmouseOver="javascript: this.style.color='gray'"
									onmouseOut="javascript: this.style.color='black'">
										<OPTION>18
										<OPTION>20
										<OPTION SELECTED>22
										<OPTION>24
								</SELECT></TD>
							</TR>

							<TR>
								<TD><INPUT TYPE='text' SIZE=14 VALUE='가로'></TD>
								<TD align=right><SELECT NAME='columnsairchie'
									style="color: black; font: 10pt verdana; width: 75; background: white"
									onchange='columnsclick()'
									onmouseOver="javascript: this.style.color='gray'"
									onmouseOut="javascript: this.style.color='black'">
										<OPTION>9
										<OPTION>10
										<OPTION SELECTED>11
										<OPTION>12
								</SELECT></TD>
							</TR>
						</TABLE>
					</FORM>

					<FORM>
						<TABLE Border=0 width='100%'>
							<TR>
								<TD><Input Type='Button' Value=' 게임시작 ' onClick='daicke()'
									style="color: black; font: 10pt verdana; width: 75; background: white"
									onmouseOver="javascript: this.style.color='gray'"
									onmouseOut="javascript: this.style.color='black'"></TD>
								<TD Align='Right'><INPUT type='button' VALUE=' 일시중지 '
									ONCLICK='gachereba()'
									style="color: black; font: 10pt verdana; width: 75; background: white"
									onmouseOver="javascript: this.style.color='gray'"
									onmouseOut="javascript: this.style.color='black'"></TD>
							</TR>
							<TR>
								<TD><INPUT type='button' VALUE='도움말' ONCLICK='hlp()'
									style="color: black; font: 10pt verdana; width: 75; background: white"
									onmouseOver="javascript: this.style.color='gray'"
									onmouseOut="javascript: this.style.color='black'"></TD>
								<TD Align='Right'></TD>
							</TR>
						</TABLE>
					</FORM></TD>
				<TD align=center><script language="JavaScript">
					chacera(i20);
				</script>
				</TD>
			</TR>
		</TABLE>
	</CENTER>

	<!------------------------- 여기까지 ------------------------------------>

</body>
</html>
