<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<link rel="stylesheet" href="../resources/CSS/header.css">
<link rel="stylesheet" href="../resources/CSS/footer.css">
<link rel="stylesheet" href="../resources/CSS/MyPage.css?ver=1">
<style type="text/css">
	/* 모달 백그라운드 스타일 */
        .modal-background {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* 반투명 검은 배경 */
        }
        /* 모달 내용 스타일 */
        .modal-content {
        	display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            z-index: 1000; /* 모달이 위로 올라오도록 */
        }
        /* 닫기 버튼 스타일 */
        .close-button {
            position: absolute;
            top: 10px;
            right: 10px;
            cursor: pointer;
        }
	
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="entire">
	<div class="title">
	<h1>마이페이지</h1>
	</div>
	<div class="container">
		<div class="content1">
		<h3>회원정보수정</h3>
			<div class="text">
				<p>회원정보 수정을 원하시거나 비밀번호 변경을<br><Br>
				원하실 경우 아래의 버튼을 클릭해 주세요.
				</p>
			</div>
			<div class="Btn">
				<form action="/member_modify" >
				<input type="submit" value="회원정보 수정" class="Btn1">
				</form>
				<form action="/member_modify">
				<input type="submit" value="비밀번호 변경" class="Btn2">
				</form>
			</div>
		</div>
		<div class="content2">
		<h3>회원탈퇴</h3>
			<div class="text">
				<p>회원서비스를 이용하지 않으실 경우<br><Br>
				아래의 버튼을 클릭해 주세요.</p>
			</div>
			<div class="btn">
				<form action="deleteUser" id="deleteUser">
				<input type="submit" value="회원탈퇴" class="Btn3">
				</form>
			</div>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>


<script type="text/javascript">

    document.getElementById("deleteUser").onsubmit = function() {
        alert("회원 탈퇴가 완료되었습니다.");
    };
</script>	
<script type="text/javascript" src="../resources/JS/main.js"></script>
</body>
</html>