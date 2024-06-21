<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약완료</title>
<link rel="stylesheet" href="../CSS/rvcheck.css">
<link rel="stylesheet" href="../CSS/header.css">
<link rel="stylesheet" href="../CSS/footer.css">
</head>
<body>
	<div class="entire">
		<header>
			<img id="hspt" src="../img/hospital.PNG" onclick="main()">
			<div>
				<ul>
					<li><a href="login.html">로그인</a></li>
					<li><a href="sign.html">회원가입</a></li>
				</ul>
			</div>
		</header>
		<nav>
			<div class="menu">
				<ul>
					<li><a href="hospital.html">홈</a></li>
					<li><a href="">진료안내</a></li>
					<li><a href="">이용안내</a></li>
					<li><a href="">병원소개</a></li>
					<li><a href="">문의</a></li>
				</ul>
			</div>
		</nav>

		<div class="container">
			<div class="content1">
				<div class="text">
					<p>예약완료 및 확인</p>
				</div>
				<div class="image-container">
					<img src="../img/success.PNG">
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
	<footer>
		<pre>주소 : 03080 서울특별시 종로구 대학로 101(연건동 28)		대표전화 : 1588-5700		홈페이지 의견접수</pre>
		<pre>COPYRIGHT 2024 SEOUL NATIONAL UNIVERSITY HOSPITAL. ALL RIGHTS RESERVED</pre>
	</footer>
	<script type="text/javascript" src="../JS/rvcheck.js"></script>
	
</body>
</html>