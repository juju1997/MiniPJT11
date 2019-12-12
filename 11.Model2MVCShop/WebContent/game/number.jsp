<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<HTML>
<HEAD>
<br>
<br>

<table width="100%" height="30%" border="0" cellspacing="0"
	cellpadding="0" align="center">
	<tr>
		<td align="center" valign="middle"><font face="Verdana" size="2"
			color="#FFFFFF"> <!--- Javascript Start Here ---->

				<STYLE>
font {
	color: #ffffff;
	font-size: 10pt;
	font-family: Comic Sans MS;
}

input {
	border-style: solid;
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	color: #00ff00;
	font-family: comic sans ms;
	background: #4682b4;
}
</STYLE> <script LANGUAGE="JavaScript">
	function Title() {
		document.title = "STOP ON 1o0 By  Nolan Gendron";
		window.setTimeout("Title1();", 10);
	}
	function Title1() {
		document.title = "STOP ON 10o By Nolan Gendron";
		window.setTimeout("Title();", 10);
	}
	counter = 0;
	function Counter1() {
		window.status = "Counter: " + counter;
		document.game.number.value = counter;
		counter++;
		Time = window.setTimeout("Counter1();", 10);
		if (counter == 106) {
			counter = 0;
		}
	}
	function Results() {
		window.clearTimeout(Time);
		if (counter == 101) {
			alert("대단하십니다 !  정확히 100에 멈추셧군요.");
		}
		if (counter != 101) {
			counter--;
			alert("오! 이런 ~ 틀리셨군요 선택하신 숫자는 " + counter
					+ " 입니다. \n\n정신을 집중하시고 다시 한번 도전하세요.");
		}
		counter = 0;
		window.status = "Counter: " + counter;
		document.game.number.value = counter;
	}
</script>


				<body bgcolor="#000000" onLoad="Title();" onKeyPress="Results();">
					<form name="game">
						<input type="text" name="number" size="2" VALUE="0"
							onFocus="this.blur();" style="font-size: 200;"><BR>
						<input type="button" VALUE="Start"
							onClick="Counter1(); counter=0;"> <input type="button"
							VALUE="Stop!" onClick="Results(); counter=0;"> <br>

						<br> <b>게임방법 - </b> 시작 버튼을 누르고 숫자가 100이 되는 순간 Stop버튼에 마우스를
						클릭한다.<br> <br> 상단 한 순발력과 집중력을 요하는 게임으로 마우스를 사용시 시간차가 날수
						있음으로<br> <br> 정지 버튼은 스페이스 바 나 숫자 키를 누르면 Stop버튼을 누르면 숫자가
						정지한다.
					</form>

					<!--- Javascript End Here ----></font></td>
	</tr>
</table>
</body>
</html>
