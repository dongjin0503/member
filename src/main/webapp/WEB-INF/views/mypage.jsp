<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="//t1.kakaocdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
* {
	box-sizing: border-box;
}

.container {
	margin: 40px auto;
	width: 700px;
	height: 800px;
	border: 1px solid #ccc;
	border-radius: 10px;
	padding: 20px;
}

#title {
	width: 100%;
	height: 10%;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 24px;
}

fieldset {
	width: 90%;
	height: 27%;
	margin: 20px auto;
	border: 1px solid #ccc;
	border-radius: 8px;
}

legend {
	font-weight: bold;
	padding: 0 8px;
}

input {
	width: 220px;
	height: 32px;
	border: 1px solid #bbb;
	border-radius: 5px;
	padding: 5px 8px;
}

.btn {
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 10px;
	border: none;
}

#btn1,
#btn2 {
	border: none;
	border-radius: 5px;
	margin-top: 10px;
	width: 150px;
	height: 30px;
	cursor: pointer;
}

#btn1 {
	background-color: black;
	color: white;
}

#btn2 {
	background-color: #eee;
	color: #333;
}

.label {
	display: inline-block;
	width: 220px;
}

#searchZip {
	display: none;
	width: 120px;
	height: 32px;
	margin-left: 5px;
	border: none;
	border-radius: 5px;
	background-color: #555;
	color: white;
	cursor: pointer;
}

a {
	text-decoration: none;
	color: inherit;
}
</style>
</head>

<body>

	<div class="container">

		<div id="title">
			<b>마이페이지</b>
		</div>

		<form action="/member/update" id = "updateForm" method ="post">

			<fieldset>
				<legend>계정정보</legend>

				<span class="label">아이디</span>
				<span class="label">이름</span>
				<br>

				<input name ="id" id="id" type="text" value="${dto.id}" readonly>
				<input name="name" class="edit" id="name" type="text"
					value="${dto.name }" readonly>
				<br>

				<span class="label">연락처</span>
				<span class="label">이메일</span>
				<br>

				<input class ="edit" name="phone" id="phone" type="text"
					value="${dto.phone }" readonly>
				<input class = "edit" name="email" id="email" type="text"
					value="${dto.email}" readonly>
				<br>

				<span class="label">비밀번호</span>
				<span class="label">가입일자</span>
				<br>

				<input id="pw" class="label" type="password" readonly>
				<input class="label" type="text"
					value="${dto.regdate }" readonly>
			</fieldset>

			<fieldset>
				<legend>주소정보</legend>

				<span class="label">우편번호</span>
				<br>

				<input id="zipcode" name="zipcode" class="edit" type="text"
					value="${dto.zipcode }" readonly>
				
				<button type="button" id="searchZip">우편번호 찾기</button>
				<br>

				<span class="label">주소</span>
				<br>

				<input id="address1" name="address1" class="edit" type="text"
					value="${dto.address1 }" readonly>
				<br>

				<span class="label">상세주소</span>
				<br>

				<input id="address2" name="address2" class="edit" type="text"
					value="${dto.address2 }" readonly>
			</fieldset>

			<div class="btn">
				<button type="button" id="btn1">수정</button>
				<button type="button" id="btn2">홈으로</button>
			</div>

		</form>
	</div>

	<script>
		let edit = false;

		let name;
		let phone;
		let email;
		let zipcode;
		let address1;
		let address2;

		$("#btn1").on("click", function() {

			if (edit == false) {

				name = $("#name").val();
				phone = $("#phone").val();
				email = $("#email").val();
				zipcode = $("#zipcode").val();
				address1 = $("#address1").val();
				address2 = $("#address2").val();

				$(".edit").prop("readonly", false);

				$("#searchZip").show();

				$("#btn1").text("수정완료");
				$("#btn2").text("취소");

				edit = true;

			} else {

				$("#updateForm").submit();

			}

		});

		$("#btn2").on("click", function() {

			if (edit == true) {

				$("#name").val(name);
				$("#phone").val(phone);
				$("#email").val(email);
				$("#zipcode").val(zipcode);
				$("#address1").val(address1);
				$("#address2").val(address2);

				$(".edit").prop("readonly", true);

				$("#searchZip").hide();

				$("#btn1").text("수정");
				$("#btn2").text("홈으로");

				edit = false;

			} else {

				location.href = "/";

			}

		});

		$("#searchZip").on("click", function() {

			new daum.Postcode({

				oncomplete : function(data) {

					$("#zipcode").val(data.zonecode);

					$("#address1").val(data.roadAddress);

					$("#address2").focus();

				}

			}).open();

		});
	</script>

</body>
</html>

