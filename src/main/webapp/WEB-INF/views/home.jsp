<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
</head>
<style>
* {
	box-sizing: border-box;
}

.login-container {
	width: 300px;
	height: 380px;
	padding: 30px;
	margin: auto;
	border: 1px solid #ccc;
	border-radius: 5px;
	text-align: center;
}

.welcome {
	font-size: 20px;
	font-wight: bold;
	margin-bottom: 3px;
}

#board-btn {
	width: 100%;
	height: 40px;
	padding: 10px;
	margin-top: 20px;
	background-color: #101820;
	border: 1px solid #ccc;
	color: white;
	border-radius: 5px;
	font-size: 14px;
	font-weight: bold;
}

#mypage-btn {
	width: 25%;
	height: 40px;
	padding: 10px;
	margin-top: 10px;
	background-color: white;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 14px;
	font-weight: bold;
}

#logout-btn {
	width: 25%;
	height: 40px;
	padding: 10px;
	margin-top: 10px;
	background-color: white;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 14px;
	font-weight: bold;
}

#delete-btn {
	width: 25%;
	height: 40px;
	padding: 10px;
	margin-top: 10px;
	background-color: white;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 14px;
	font-weight: bold;
	
}

.logout-container {
	width: 300px;
	height: 380px;
	padding: 30px;
	margin: auto;
	border: 1px solid #ccc;
	border-radius: 5px;
	text-align: center;
}

.login-title {
	font-size: 20px;
	margin-bottom: 3px;
}

.input-box {
	font-size: 14px;
	font-weight: bold;
	text-align: left;
}

.input-box input {
	height: 30px;
	width: 100%;
	padding: 10px;
	margin-top: 10px;
	border-radius: 5px;
}

#login-btn {
	width: 100%;
	height: 40px;
	padding: 10px;
	margin-top: 20px;
	background-color: #101820;
	border: 1px solid #ccc;
	color: white;
	border-radius: 5px;
	font-size: 14px;
	font-weight: bold;
}

#signup-btn {
	width: 100%;
	height: 40px;
	padding: 10px;
	margin-top: 10px;
	background-color: white;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 14px;
	font-weight: bold;
}
</style>
<body>
	<c:choose>
		<c:when test="${ loginId != null}">
			<div class="login-container">
				<div class="welcome">${loginId}님환영합니다.</div>
				<div>
					<form action="">
						<button type="submit" id="board-btn">게시판</button>
					</form>
				</div>
				<br>
				<div>
					<form action="/member/mypage">
						<button type="submit" id="mypage-btn">마이페이지</button>
					</form>
					<button type="button" id="logout-btn"
						onclick="location.href='/member/logout'">로그아웃</button>
					<form action="/member/delete" method="post">
						<button type="submit" id="delete-btn"
							onclick="return confirm('정말로 탈퇴하시겠습니까?')">회원탈퇴</button>
					</form>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="logout-container">
				<div class="login-title">
					<strong>로그인</strong>
				</div>
				<br>
				<form action="/member/login" method="post">
					<div class="input-box">
						아이디 <br> <input name="id" type="text"
							placeholder="아이디를 입력하세요.">
					</div>
					<br>
					<div class="input-box">
						비밀번호 <br> <input name="pw" type="text"
							placeholder="비밀번호를 입력하세요.">
					</div>
					<button type="submit" id="login-btn">로그인</button>
				</form>
				<form action="/member/signup">
					<button type="submit" id="signup-btn">회원가입</button>
				</form>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>
