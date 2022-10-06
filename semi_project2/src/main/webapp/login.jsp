<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>semi project login</title>
<link rel="stylesheet" href="css/style.css?after">
</head>
<body>
<body>
	<div>
		<h1>
			<img src="png/golfzon.png"
				style="float: left; margin-left: 20px; width: 200px; height: 90px;" />
		</h1>
		<form id="login" action="loginOK.do" method="post">
			<input type="text" name="member_name" placeholder="아이디"
				style="width: 350px; height: 50px; font-size: 20px;" /> <input
				type="password" name="password" placeholder="비밀번호"
				style="width: 350px; height: 50px; font-size: 20px;" />
			<button id="loginBtn"
				style="width: 350px; height: 50px; font-size: 18px; background-color: dodgerblue; border: 0px solid blue;">로그인</button>
			<br />
			<h4 id="join" style="float: left; margin-left: 60px; color: black;">
				<a href="m_insert.do">회원가입</a> <span style="margin-left: 30px; font-size: 16px; color:#D3D3D3;">|</span>
			</h4>
			
			<h4 id="idpw" style="float: right; margin-right: 60px; color: gray;">
				<a style="color: gray;" href="m_insert.do">아이디/비밀번호 찾기</a>
			</h4>
		</form>
	</div>
</body>
</body>
</html>