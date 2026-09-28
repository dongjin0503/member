<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script
	src="//t1.kakaocdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>Insert title here</title>
<style>
*{box-sizing : border-size;
}
.container{
	width: 300px;
	height: 800px;
	padding: 30px;
	margin: auto;
	border: 1px solid #ccc;
	border-radius: 5px;
	text-align: center;
}

.signup-title {
	font-size: 20px;
	margin-bottom: 3px;
}
.input-box{
	font-size: 14px;
	font-weight: bold;
	text-align: left;
}

.input-box input {
	height: 20px;
	width: 80%;
	padding: 10px;
	margin-top: 10px;
	border-radius: 5px;
}

.submitBtn{
	width: 30%;
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
.cancelBtn{
	width: 30%;
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
</head>
<body>
<div class=container>
<div class="signup-title"><strong>회원가입</strong></div>
	<form action="/member/signup" method="post">
	<fieldset>
		<legend>계정 정보</legend>
		<div class="input-box">
			아이디 <input type="text" name="id" id="id" placeholder="아이디 입력">
		</div>
		<div class="input-box">
			비밀번호 <input type="text" name="pw" id="pw1" placeholder="영문, 숫자, 특수문자를 포함 8~20자">
		</div>

		<div class="input-box">
			비밀번호 확인 <input type="password" id="pw2" placeholder="비밀번호 재입력">
		</div>
		<div><input type="hidden" id="message"></div>
	</fieldset>

	<fieldset>
		<legend>개인 정보</legend>
		<div class="input-box">
			이름 <input type="text" name="name" id="name" placeholder="이름 입력">
		</div>
		<div class="input-box">
			연락처 <input type="text" name="phone" id="phone" placeholder="'-'제외 숫자만 입력">
		</div>
		<div class="input-box">
			이메일 <input type="text" name="email" id="email"
				placeholder="niceday@naver.com">
		</div>
	</fieldset>

	<fieldset>
		<legend>주소 정보</legend>
		<div class="input-box">
			우편번호 <input type="text" name="zipcode" id="zipcode" placeholder="우편번호(5자리)">
			<button type="button" id="search">우편번호 찾기</button>
		</div>
		<div class="input-box">
			주소1 <input type="text" name="address1" id="address1" placeholder="기본주소">
		</div>
		<div class="input-box">
			주소2 <input type="text" name="address2" placeholder="상세주소">
		</div>
	</fieldset>
		<div class="buttonBox">
				<button type="submit" onclick="return validation()"
					class="submitBtn">가입완료</button>
				<button type="button" onclick="location.href='/'"
					class="cancelBtn">취소</button>
			</div>
	</form>
	</div>
	<script>
		let id = document.getElementById("id");
		let pw1 = document.getElementById("pw1");
		let pw2 = document.getElementById("pw2");
		let name = document.getElementById("name");
		let phone = document.getElementById("phone");
		let email = document.getElementById("email");

		let result = document.getElementById("message");
		pw2.onkeyup = function() {
			if (pw1.value == pw2.value) {
				result.innerHTML = "패스워드가 일치합니다.";
				result.style.color = "blue";
			} else {
				result.innerHTML = "패스워드가 일치하지 않습니다.";
				result.style.color = "red";
			}
		};
		pw1.onkeyup = function() {
			if (pw1.value == pw2.value) {
				result.innerHTML = "패스워드가 일치합니다.";
				result.style.color = "blue";
			} else {
				result.innerHTML = "패스워드가 일치하지 않습니다.";
				result.style.color = "red";
			}
		};
		document.getElementById("search").onclick = function() {
			new kakao.Postcode({
				oncomplete : function(data) {
					let zipcode = document.getElementById("zipcode");
					let address1 = document.getElementById("address1");
					zipcode.value = data.zonecode;
					address1.value = data.roadAddress;
				}
			}).open();
		}
		let idRegex = /^[a-zA-Z0-9]{4,30}$/;
		let pwRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,20}$/;
		let nameRegex = /^[가-힣]{2,5}$/;
		let phoneRegex = /^[0-9]{10,11}$/;
		let emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
		function validation() {
			if (!idRegex.test(id.value)) {
				alert("아이디는 영문과 숫자를 사용하여 4~30자로 입력하세요.");
				id.focus();
				return false;
			}
			
			if (!pwRegex.test(pw1.value)) {
				alert("비밀번호는 영문, 숫자, 특수문자를 포함하여 8~20자로 입력하세요.");
				pw1.focus();
				return false;
			}
			if (pw1.value != pw2.value) {
				alert("비밀번호가 일치하지 않습니다.");
				pw2.focus();
				return false;
			}
			if (!nameRegex.test(name.value)) {
				alert("이름은 한글 2~5자로 입력하세요.");
				name.focus();
				return false;
			}
			if (!phoneRegex.test(phone.value)) {
				alert("연락처는 숫자만 10~11자리로 입력하세요.");
				phone.focus();
				return false;
			}
			if (!emailRegex.test(email.value)) {
				alert("올바른 이메일 형식으로 입력하세요.");
				email.focus();
				return false;
			}
			return true;
		}
		</script>
</body>
</html>