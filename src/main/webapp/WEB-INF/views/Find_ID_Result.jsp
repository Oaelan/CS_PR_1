<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기 결과</title>
<link rel="stylesheet" href="../resources/CSS/header.css">
<link rel="stylesheet" href="../resources/CSS/footer.css">
<link rel="stylesheet" href="../resources/CSS/Find_ID_Result.css?ver=1">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="entire">
	<div class="container">
		<div class="title">
		<h1>아이디/비밀번호 찾기</h1>
		</div>
		<div class="content">
			<h2>아이디 찾기가 완료되었습니다.</h2>
			<div class="text">가입된 아이디는 아래와 같습니다.</div>
		</div>
		<div class="content1">
			<div class="radio">
				<label class="radio-container">
	        		<input type="radio" name="radio" checked="checked">
	        		<span class="checkmark"></span>
	    		</label>
	    		<p>회원님의 아이디는 <span>abc123</span> 입니다.</p>
			</div>
		</div>
		<div class="btn">
		<form action="/login">
		<input type="submit" value="로그인 하기" class="btn1">
		</form>
		<form action="">
		<input type="submit" value="비밀번호 찾기" class="btn2">
		</form>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript" src="../resources/JS/main.js"></script>
</body>
</html>