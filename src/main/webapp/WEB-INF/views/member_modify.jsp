<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link rel="stylesheet" href="../resources/CSS/header.css">
<link rel="stylesheet" href="../resources/CSS/footer.css">
<link rel="stylesheet" href="../resources/CSS/member_modify.css?ver=1">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="entire">
	<div class="container">
		<div class="title">
		<h1>회원정보 수정</h1>
		</div>
		<div class="content1">
			<table>
				<tr>
					<th>이름</th><td>홍길동</td>
				</tr>
				<tr>
					<th>아이디</th><td>bbb222</td>
				</tr>
				<tr>
					<th>현재 비밀번호</th>
					<td><input type="password" class="pw"></td>
				</tr>
				<tr>
					<th>새 비밀번호</th>
					<td><input type="password" class="pw1"></td>
				</tr>
				<tr>
					<th>새 비밀번호 확인</th>
					<td><input type="password" class="pw2"></td>
				</tr>
				<tr>
					<th>생년월일</th><td>2000-01-01</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" class="phone" placeholder="-를 포함하여 작성해주세요" value="010-1234-5678"></td>
				</tr>
				<tr>
					<th class="row">이메일</th>
					<td><input type="text" class="email" value="abc123@gmail.com"></td>
				</tr>
				<tr>
					<th></th>
					<td></td>
				</tr>
			</table>
		</div>
		<input type="submit" value="저장" class="modify">		
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript" src="../resources/JS/main.js"></script>
</body>
</html>