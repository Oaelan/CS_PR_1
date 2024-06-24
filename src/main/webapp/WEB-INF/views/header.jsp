<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<header>
		<img id="hspt" src="../resources/img/hospital.PNG" onclick="main()">
		<div>
		<ul>
			<li><a href="login">로그인</a></li>
			<li><a href="login">회원가입</a></li>
		</ul>
		</div>
	</header>
	<nav>
		<div class="menu">
		<ul>
			<li>
				<form method="post" action="/">
					<button type="submit">홈</button>
				</form>
			</li>
			<!-- <li><a href="/">홈</a></li> -->
			<li><a href="">진료안내</a></li>
			<li><a href="">이용안내</a></li>
			<li><a href="">병원소개</a></li>
			<li><a href="">문의</a></li>
		</ul>
		</div>
	</nav>
	<script type="text/javascript" src="../resources/JS/main.js"></script>
