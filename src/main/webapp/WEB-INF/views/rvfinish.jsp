<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약완료</title>
<link rel="stylesheet" href="../resources/CSS/rvfinish.css?ver=0">
<link rel="stylesheet" href="../resources/CSS/header.css">
<link rel="stylesheet" href="../resources/CSS/footer.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="entire">
		<div class="container">
			<div class="content1">
				<div class="text">
					<p>예약완료 및 확인</p>
				</div>
				<div class="image-container">
					<img src="../resources/img/success.PNG">
				</div>
				<div class="content2">
					<table>
						<tr>
							<th scope="row">예약자</th>
							<td>가나다</td>
							<th scope="row">예약일</th>
							<td>2024-06-14 11:00</td>
						</tr>
						<tr>
							<th scope="row">진료과</th>
							<td>내과(일반)</td>
							<th scope="row">의료진</th>
							<td>나아라</td>
						</tr>
						<tr>
							<th scope="row">연락처</th>
							<td>010-1234-5678</td>
							<th scope="row">이메일주소</th>
							<td>abc123@naver.com</td>
						</tr>
						<tr>
							<th scope="row"></th>
							<td></td>
							<th scope="row"></th>
							<td></td>
						</tr>
					</table>
				</div>
					<div class="button-container">
						<input type="button" value="예약현황조회" class="button1" onclick="rvList()">
						<input type="button" value="예약취소" class="button2" onclick="">
					</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<script type="text/javascript" src="../resources/JS/rvcheck.js?v=1.0.1"></script>
	<script type="text/javascript" src="../resources/JS/main.js"></script>
	
</body>
</html>