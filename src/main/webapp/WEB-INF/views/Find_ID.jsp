<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<link rel="stylesheet" href="../resources/CSS/header.css">
<link rel="stylesheet" href="../resources/CSS/footer.css">
<link rel="stylesheet" href="../resources/CSS/Find_ID.css?ver=1">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="entire">
	<div class="container">
		<div class="title">
		<h1>아이디/비밀번호 찾기</h1>
		</div>
		<div class="content1">
			<table>
				<tr>
					<th>이름</th>
					<td><input type="text" class="name"></td>
				</tr>
				<tr>
					<th>이메일 주소</th>
					<td><input type="text" class="email"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="text" class="birth" placeholder="예) 2000-01-01"></td>
				</tr>
			</table>		
		</div>
			<form action="/Find_ID_Result">
			<input type="submit" value="찾기" class="find">
			</form>	
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript" src="../resources/JS/find.js"></script>
<script type="text/javascript" src="../resources/JS/main.js"></script>
</body>
</html>