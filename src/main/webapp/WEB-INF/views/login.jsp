<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
</style>
<link rel="stylesheet" href="../resources/CSS/header.css">
<link rel="stylesheet" href="../resources/CSS/footer.css">
<link rel="stylesheet" href="../resources/CSS/login.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="entire">
		<form id="log" action="login" method="post">
			<div id="box">
				<table id="id">
					<tr>
						<td id="user">아이디</td>
					</tr>
					<tr>
						<td><input type="text" id="box1" name = "id" placeholder="아이디"></td>
					</tr>
				</table>
	
				<table id="pw">
					<tr>
						<td id="ps">비밀번호</td>
					</tr>
					<tr>
						<td><input id="box2" name = "password" type="password" placeholder="비밀번호"></td>
					</tr>
				</table>
				<input type = "submit" id="login" value = "로그인">
				<p>아직 계정이 없으신가요?</p>
				<a href="patient_join" id="link">환자 회원가입</a>
				<a href="doctor_join" id="link">의사 회원가입</a>
			</div>
		</form>
	</div>
		<jsp:include page="footer.jsp"></jsp:include>
		<script type="text/javascript" src="../resources/JS/main.js"></script>
</body>
</html>