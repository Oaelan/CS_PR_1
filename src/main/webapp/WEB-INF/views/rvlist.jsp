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
					<c:forEach var="tName" items="${tName}" varStatus="status">
						<div class="op1">
							<div class="doctor">
								<img src="../resources/img/doctor.PNG">
							</div>
							<div class="op">
								<div class="inform">
									<table>
									
										<tr>
											<th class="exNo">진료 번호</th>
											<td>
												<c:forEach var="no" items="${no}" varStatus="nStatus">
													<c:if test="${status.index == nStatus.index}">
														<c:out value="${no}"/>
													</c:if>
												</c:forEach>
											</td>
										</tr>
										<tr>
											<th class="hos">선생님</th>
											<td>${tName}</td>
										</tr>
										<tr>
											<th>진료일시</th>
											<td class="date">
												<c:forEach var="start" items="${start}" varStatus="sStatus">
													<c:if test="${status.index == sStatus.index}">
														<c:out value="${start}" />
													</c:if>
												</c:forEach>
											</td>
										</tr>
										<tr>
											<th id = "exTy">진료 타입</th>
											<!-- <td class="exType">
												<c:forEach var="examination" items="${examination}" varStatus="eStatus">
														
														<c:if test="${status.index == eStatus.index}">
															<c:choose>
															
																<c:when test="${examination =='blue' }">
																	<c:out value="일반 진료" />
																</c:when>
																
																<c:when test="${examination =='green'}">
																	<c:out value="수술" />
																</c:when>
															</c:choose>
														</c:if>
												</c:forEach>
											<td> -->
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
						<img src="../resources/img/warning.PNG" class="warn">
			</div>
		</div>
	</div>
	<footer>
		<pre>주소 : 03080 서울특별시 종로구 대학로 101(연건동 28)		대표전화 : 1588-5700		홈페이지 의견접수</pre>
		<pre>COPYRIGHT 2024 SEOUL NATIONAL UNIVERSITY HOSPITAL. ALL RIGHTS RESERVED</pre>
	</footer>
	<script type="text/javascript" src="../resources/JS/main.js"></script>
	<script>
	/* 진료 타입 가져오는 ajax */
	let exTypeNo = ${no}
	$.ajax({
        url: '/getExType',
        type: 'get',
        contentType: 'application/json',
        data: {no : exTypeNo},
        success: function(response) {
            console.log('전송 성공:', response);
            let exType = '<td class="exType">';
            response.forEach(function(ex) {
            	var exback = JSON.stringify({
                    backgroundColor: ex.backgroundColor,
                });
            	exType+= '<c:forEach var="examination" items="${examination}" varStatus="eStatus">'
				
	            	+'<c:if test="${status.index == eStatus.index}">'
	            		+'<c:choose>'
						
		            		+'<c:when test="${examination =='blue' }">'
		            			+'<c:out value="일반 진료" />'
		            		+'</c:when>'
								
		            		+'<c:when test="${examination =='green'}">'
		            			+'<c:out value="수술" />'
		            		+'</c:when>'
	            		+'</c:choose>'
	            	+'</c:if>'
            	+'</c:forEach>'
            // 필요에 따라 추가 작업 수행
            });
            exType+='</td>' 
           	$('#exTy').html(exType);
        }
    });
	</script>
</body>
</html>