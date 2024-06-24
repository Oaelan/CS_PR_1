<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약확인</title>
<link rel="stylesheet" href="../resources/CSS/header.css">
<link rel="stylesheet" href="../resources/CSS/footer.css">
<link rel="stylesheet" href="../resources/CSS/rvlist.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="entire">
		<header>
			<img id="hspt" src="../resources/img/hospital.PNG" onclick="main()">
			<div>
				<ul>
					<li><a href="/login">로그인</a></li>
					<li><a href="/sign">회원가입</a></li>
				</ul>
			</div>
		</header>
		<nav>
			<div class="menu">
				<ul>
					<li><a href="/hospital">홈</a></li>
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
                <p>진료예약확인</p>
            </div>
            <div class="box3">
                <c:forEach var="data" items="${reservations}" varStatus="status">
                    <div class="op1">
                        <div class="doctor">
                            <img src="../resources/img/doctor.PNG" alt="Doctor Image">
                        </div>
                        <div class="op">
                            <div class="inform">
                                <table>
                                    <tr>
                                        <th class="exNo">진료 번호</th>
                                        <td>${data.no}</td>
                                    </tr>
                                    <tr>
                                        <th class="hos">선생님</th>
                                        <td>${data.tName}</td>
                                    </tr>
                                    <tr>
                                        <th>진료일시</th>
                                        <td class="date">${data.start}</td>
                                    </tr>
                                    <tr>
                                        <th id="exTy">진료 타입</th>
                                        <td class="exType">
                                            <c:choose>
                                                
                                                <c:when test="${data.backgroundColor == 'blue'}">
                                                    <span id="hiddenBG">일반 진료</span>
                                                </c:when>
                                                <c:when test="${data.backgroundColor == 'green'}">
                                                    수술
                                                </c:when>
                                                <c:otherwise>
                                                    Unknown
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="button-container">
                            <input type="button" value="취소" class="button1" onclick="">
                            <input type="button" value="변경" class="button2" onclick="">
                        </div>
                    </div>
                </c:forEach>
            </div>
            <img src="../resources/img/warning.PNG" class="warn" alt="Warning Image">
        </div>
    </div>
	</div>
	<footer>
		<pre>주소 : 03080 서울특별시 종로구 대학로 101(연건동 28)		대표전화 : 1588-5700		홈페이지 의견접수</pre>
		<pre>COPYRIGHT 2024 SEOUL NATIONAL UNIVERSITY HOSPITAL. ALL RIGHTS RESERVED</pre>
	</footer>
	<script type="text/javascript" src="../resources/JS/main.js"></script>
	
</body>
</html>