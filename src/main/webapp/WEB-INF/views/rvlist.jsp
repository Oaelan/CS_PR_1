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
		<jsp:include page="header.jsp"></jsp:include>
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
                                        <td class="date">${(data.start).substring(0, 16)}</td>
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
	<script type="text/javascript" src="../resources/JS/main.js"></script>
	
</body>
</html>