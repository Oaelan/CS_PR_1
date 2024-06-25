<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의사 회원가입 페이지</title>
<style>

.back {
	background-color: #f3f3f3;
}
.container {
    display: flex;
    justify-content: center;
    align-items: center; /* 아이템들을 상단에 정렬 */
    gap: 50px; /* 선택 사항: 두 박스 사이에 간격 추가 */
    margin: 20px; /* 선택 사항: 컨테이너 주변에 여백 추가 */
	height: 1300px;
}

.Go {
    position: relative;
    bottom: 7px;
    left: 220px;
    display: flex;
    align-items: flex-start;
    justify-content: center;
}

.dcBtn {
	color: #2263bb;
	border: none;
	background-color: #f3f3f3;
	font-size: 20px;
	font-family: 나눔고딕;
	height: 50px;
}

.dcForm {
	padding: 0px;
}

#box {
	border-radius: 20px;
	border: 1px solid #BDBDBD;
	width: 610px;
	height: 1200px;
	position: relative;
	background-color: white;
	bottom: 50px;
	
}

.wrap {
	display: flex;
    justify-content: center;
    align-items: center;
    position: relative;
    top: 75px;
    right: 220px;
}

.doctor {
    
    display: flex;
    align-items: flex-start;
    justify-content: center;
}

.doctor{
    font-family: 나눔고딕;
    font-size: 24px;
    font-weight: bold;
    text-align: center;
    color: #2263bb;
}

form {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 5%;
}

#text{
	position: absolute;
	left: 45px;
	margin-top: 10px;
	font-family: 나눔고딕;
}
input, select {
	width: 500px;
	height: 40px;
	border: 1px solid #BDBDBD;
	border-radius: 5px;
	margin: 40px;
	margin-bottom: 20px;
	position: relative;
	padding-left: 10px;
}

select {
	width: 512px;
	height: 45px;
	 appearance: none; /* 기본 스타일 제거 (일부 브라우저에서 필요) */
  -webkit-appearance: none; /* Safari, Chrome 등에서 필요 */
  -moz-appearance: none; /* Firefox에서 필요 */
  
}

#select {
	width: 522px;
}

label{
	position: relative;
	left: 45px;
	bottom: 25px;
	font-size: 12px;
	font-family: 나눔고딕;
}	

#btn {
	background-color: #2263bb;
	border-radius: 5px;
	color: white;
	font-size: 17px;
	width: 515px;
	height: 50px;
}

.btn {
	display: flex;
	flex-direction: column;
}

input:focus {
	outline: none; /* 기본 브라우저 스타일 제거 */
}

select:focus {
	outline: none; /* 기본 브라우저 스타일 제거 */
}

#userType::-ms-expand {
  display: none;
}

</style>
<link rel="stylesheet" href="../resources/CSS/header.css">
<link rel="stylesheet" href="../resources/CSS/footer.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="back">
	<div class="wrap">
	<div class="doctor">의사 회원가입</div>
	</div>
	<form action="/patient_join" class="dcForm">
	<div class="Go">
		<input type="submit" value="환자 회원가입 하러가기  >>>" class="dcBtn"> 
	</div>
	</form>
	<div class="container">
	<form id = "join" action = "/doctor_join" method = "post">
		<div id="box">
			<p></p>
			<table>
				<tr>
					<td id="text">아이디</td>
				</tr>
				<tr>
					<td><input type="text" id="userId" placeholder="아이디" name = "id"></td>
				</tr>
				<tr>
					<td><label id="userIdLabel"></label></td>
				</tr>
			</table>
			<table>
				<tr>
					<td id="text">비밀번호</td>
				</tr>
				<tr>
					<td><input type="password" id="pw" placeholder="비밀번호" name = "password"></td>
				</tr>
				<tr>
					<td><label id="passwordLabel"></label></td>
				</tr>

			</table>
			<table>
				<tr>
					<td id="text">비밀번호 확인</td>
				</tr>
				<tr>
					<td><input type="password" placeholder="비밀번호 확인" id="pwcheck"></td>
				</tr>
				<tr><td><label id="confirmLabel"></label></td></tr>
			</table>
			<table>
				<tr>
					<td id="text">이름</td>
				</tr>
				<tr>
					<td><input type="text" placeholder="이름" id="name" name = "name"></td>
				</tr>
				<tr><td><label id="nameLabel"></label></td></tr>
			</table>
			<table>
				<tr>
					<td id="text">생년월일</td>
				</tr>
				<tr>
					<td><input type="date" id="birth" name = "birth"></td>
				</tr>
				<tr><td><label id="birthLabel"></label></td></tr>
			</table>
			<table>
				<tr>
					<td id="text">전화번호</td>
				</tr>
				<tr>
					<td><input type="text" placeholder="-를 같이 입력해주세요" id="phone" name = "phone"></td>
				</tr>
				<tr><td><label id="PhoneLabel"></label></td></tr>
			</table>
			<table>
				<tr>
					<td id="text">이메일</td>
				</tr>
				<tr>
					<td><input type="text" placeholder="이메일" id="email" name = "email"></td>
				</tr>
				<tr><td><label id="emailLabel"></label></td></tr>
			</table>
			
			<table>
				<tr>
					<td id="select">
                	<select id="userType" name="userType">
	                    <option value="">전공 분야 선택</option>
	                    <option value="2">호흡기내과</option>
	                    <option value="3">순환기내과</option>
	                    <option value="4">소화기내과</option>
	                    <option value="5">혈액종양내과</option>
	                    <option value="6">내분비대사내과</option>
	                    <option value="7">알레르기내과</option>
	                    <option value="8">신장내과</option>
	                    <option value="9">감염내과</option>
	                    <option value="10">류마티스내과</option>
	                    <option value="11">내과(일반)</option>
	                    <option value="12">내과</option>
	                    <option value="13">외과</option>
                	</select>
            		</td>
				</tr>
			</table>
			<table>
			<tr>
			<td><input type="submit" value="회원가입" id="btn"></td>
			</tr>
			</table>
		</div>
	</form>
	</div>
	</div>
	<script type="text/javascript" src="../resources/JS/login.js"></script>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>