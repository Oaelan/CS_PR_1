<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서울대학교병원</title>
<link rel="stylesheet" href="../resources/CSS/hospital.css">
<link rel="stylesheet" href="../resources/CSS/header.css">
<link rel="stylesheet" href="../resources/CSS/LoginSuccess.css">  <!-- ?ver=1 붙이면 css 적용 빨라짐  -->
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="entire">
		<div id="main">
			<div id="main1">
				<div class="slider">
					<div class="slides">
						<img src="../resources/img/adv.PNG" class="slide">
						<img src="../resources/img/adv1.PNG" class="slide">
						<img src="../resources/img/adv2.PNG" class="slide">
						
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div id="content1">
				<div id="wrap1">
					<h3 id="inform">진료예약</h3>
					<p id="one">
						빠르고 쉽게 진료예약을 <br> 하실 수 있습니다.
					</p>
					<br>
					<div id="rv">
						<ul id="rv1">
							<li><a href="/reservation" role="button">진료예약</a></li>
							<li>
								<a href="/rvlist" role="button">
									<input type = "hidden" name = "title" value = "${title}"> 
									<input type = "hidden" name = "birth" value = "${birth}">
									예약확인</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div id="content2">
				<div id="wrap2">
					<h3 id="inform" class="down">진료과/센터</h3>
					<p id="two">
						병원의 진료과 / 센터를<br>상세히 확인할 수 있습니다.
					</p>
					<br>
					<div id="rv">
						<ul id="rv2">
							<li><a href="" role="button">본원</a></li>
							<li><a href="" role="button">어린이병원</a></li>
							<li><a href="" role="button">암병원</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div id="content3">
				<div id="wrap3">
					<h3 id="inform">진료안내</h3>
					<p id="three">
						대표전화 <strong id="tel1">1588-5700</strong>
					</p>
					<p id="three1">
						암환자 상담 <strong id="tel2">02-2072-0707</strong><br>
						<Br>
					<div id="rv">
						<ul id="rv3">
							<li><a href="" role="button">외래진료안내</a></li>
							<li><a href="" role="button">진료시간표</a></li>
						</ul>
					</div>
				</div>
			</div>
			
			
		<div id="content4">
			
			<c:if test="${id != null}" >
				<div id="wrap4">
					<strong>${name}</strong>
					<a href="logout">로그아웃</a><Br><br>
					오늘도 좋은 하루 보내시고<br>
					<strong>건강을 기원</strong>합니다.<br><br>
					<div id="rv">
					<ul id="rv4">
							<li><a href="/rvlist" role="button">예약확인/취소</a></li>
							<li><a href="" role="button">진료이력조회</a></li>
					</ul>
					</div>
				</div>
			</c:if>
				
			<c:if test="${id == null}">
				<div id="wrap4">
					<ul id="sign">
						<li id="log"><a
							href="login.html">
								로그인&nbsp;&nbsp;&nbsp;</a></li>
						<li><a
							href="sign.html">&nbsp;&nbsp;&nbsp;회원가입</a></li>
					</ul>
				</div>
				<form action="login" method="post">
					<div id="box">
						<input type="text" name="id" placeholder="아이디"><br> 
						<input type="password" name="password" placeholder="비밀번호"><br>
						<ul id="forgot">
							<li><a href="#">아이디/비밀번호 찾기</a></li>
						</ul>
						<input type="submit" id="loginBtn" value="로그인">
					</div>
				</form>
			</c:if>
			
		</div>
			
			
			
			
		</div>
		<div class="container1">

			<div id="content5">
				<div id="wrap5"></div>
			</div>
			<div id="content6">
				<div id="wrap6"></div>
			</div>

		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<script type="text/javascript" src="../resources/JS/main.js"></script>
	<script type="text/javascript" src="../resources/JS/slide.js"></script>
</body>
</html>
