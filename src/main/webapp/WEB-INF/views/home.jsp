<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<style>
*{
box-sizing : border-box;
}
.login-container{
}
.welcome{
}
.btn-area{
}
#board-btn{
}
#mypage-btn{
}
#logout-btn{
}
#delete-btn{
}
.logout-container {
font-size : 14px;
}
.login-title {
}
.input-box {
}
#login-btn{
}
#signup-btn{
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
<div class="btn-area">
<form action="/member/mypage">
<button type="submit" id="mypage-btn">마이페이지</button>
</form>
<button type="button" id="logout-btn" onclick="location.href='/member/logout'">로그아웃</button>
<form action="/member/delete" method="post">
<button type="submit" id="delete-btn" onclick="retun confirm('정말로 탈퇴하시겠습니까?')">회원탈퇴</button>
</form>
</div>
</div>
</c:when>
<c:otherwise>
<div class="logout-container">
<div class="login-title"><strong>로그인</strong></div>
<br>
<form action="/member/login" method="post">
<div class="input-box">아이디 <br>
<input name="id" type="text" placeholder="아이디를 입력하세요."></div>
<br>
<div class="input-box">비밀번호 <br>
<input name="pw" type="text" placeholder="비밀번호를 입력하세요."></div>
<button type="submit" id="login-btn">로그인</button></form>
<form action="/member/signup">
<button type="submit" id="signup-btn">회원가입</button></form>
</div>
</c:otherwise>
</c:choose>
</body>
</html>
