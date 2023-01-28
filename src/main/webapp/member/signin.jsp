<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignIn</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" rel="stylesheet">
<style>
* {
	box-sizing: border-box;
}

body {
	background-color: #03001e;
}

/* div {
            border: 1px solid black;
        } */
.container {
	border-top: 7px solid #7303c0;
	border-bottom: 7px solid #7303c0;
	border-radius: 5px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	padding: 50px;
	background-color: white;
}

.logo {
	margin-bottom: 31px;
}

#logoimg {
	width: 200px;
	position: relative;
	left: 50%;
	transform: translateX(-50%);
}

#logoimg:hover {
	cursor: pointer;
}

.logintextbox {
	padding: 0px;
	text-align: center;
}

.idtextbox, .pwtextbox {
	height: 50px;
	border: 1px solid #c4c4c4;
	border-radius: 5px;
}

.idicon, .pwicon {
	color: #c4c4c4;
}

.idtext, .pwtext {
	width: 92%;
	height: 100%;
	border: none;
}

.loginbtn {
	height: 80px;
	text-align: center;
	color: red;
	font-size: 14.5px;
}

.loginboxtext {
	height: 45.5px;
}

.signupbox {
	height: 50px;
	text-align: center;
}

#loginbtn {
	width: 250px;
	height: 40px;
	background-color: #03001e;
	color: white;
}

.signupbox, .loginbtnbox, .loginbox {
	margin-top: 10px;
}

.signup {
	line-height: 50px;
}

.signup:hover, .findInfo:hover {
	color: black;
}

a {
	text-decoration: none;
	color: black;
}

button {
	border: none;
	border-radius: 5px;
}

input:focus {
	outline: none;
}
</style>
</head>
<body>
	<c:choose>
		<c:when test="${result==false }">
			<form action="/signin.member" method="post">
				<div class="container w-50" style="min-width: 350px; max-width: 400px;">
					<div class="logo row">
						<img src="/img/logo.png" id="logoimg">
					</div>
					<div class="loginbox row">
						<div class="logintextbox col-12">
							<div class="col-12 idtextbox">
								<i class="fa-solid fa-user idicon"></i> <input type="text" name="id" class="idtext" placeholder="아이디" value="${id }">
							</div>
							<div class="col-12 pwtextbox">
								<i class="fa-solid fa-unlock-keyhole pwicon"></i>
								<input type="password" name="pw" class="pwtext" id="loginpwtext"
									placeholder="비밀번호">
							</div>
						</div>
					</div>
					<div class="row loginbtnbox">
						<div class="loginbtn col-12">
							<div class="loginboxtext">
								아이디나 비밀번호를 잘못 입력했습니다.<br> 다시 입력하세요.
							</div>
							<button id="loginbtn">로그인</button>
						</div>
					</div>
			</form>
			<div class="signupbox row">
				<div class="col-12">
					<a href="/member/signup.jsp" class="signup">회원가입</a>
				</div>
			</div>
			</div>
			<script>
				$(function() {
					$("#loginpwtext").focus();
				});
			</script>
		</c:when>
		<c:otherwise>
			<form action="/signin.member" method="post">
				<div class="container w-50" style="min-width: 350px; max-width: 400px;">
					<div class="logo row">
						<img src="/img/logo.png" id="logoimg">
					</div>
					<div class="loginbox row">
						<div class="logintextbox col-12">
							<div class="col-12 idtextbox">
								<i class="fa-solid fa-user idicon"></i> <input type="text" name="id" class="idtext" placeholder="아이디">
							</div>
							<div class="col-12 pwtextbox">
								<span><i class="fa-solid fa-unlock-keyhole pwicon"></i></span>
								<input type="password" name="pw" class="pwtext" placeholder="비밀번호">
							</div>
						</div>
					</div>
					<div class="row loginbtnbox">
						<div class="loginbtn col-12">
							<div class="loginboxtext"></div>
							<button id="loginbtn">로그인</button>
						</div>
					</div>
			</form>
			<div class="signupbox row">
				<div class="col-12">
					<a href="/member/signup.jsp" class="signup">회원가입</a>
				</div>
			</div>
			</div>
		</c:otherwise>
	</c:choose>
	<script>
		$(".idtext").on("focus", function() {
			$(".idtextbox").css("border", "2px solid black");
			$(".idicon").css("color", "black");
		})
		$(".idtext").on("focusout", function() {
			$(".idtextbox").css("border", "1px solid #c4c4c4");
			$(".idicon").css("color", "#c4c4c4");
		})
		$(".pwtext").on("focus", function() {
			$(".pwtextbox").css("border", "2px solid black");
			$(".pwicon").css("color", "black");
		})
		$(".pwtext").on("focusout", function() {
			$(".pwtextbox").css("border", "1px solid #c4c4c4");
			$(".pwicon").css("color", "#c4c4c4");
		})
		$("#logoimg").on("click",function(){
			location.href="/main";
		})
	</script>
</body>
</html>