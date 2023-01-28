<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 메인 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" rel="stylesheet" />
</head>
<style>
@font-face {
	font-family: 'DungGeunMo';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/DungGeunMo.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
*{box-sizing: border-box;}

.container {
	font-family: 'DungGeunMo';
}

body {
	background-color: #03001e;
	color: white;
}

.list_title {
	padding: 10px;
}

.searchbar {
	background-color: grey;
}

#searchtext {
	width: 100%
}

;
#searchbtn {
	width: 100%
}

input [type="submit"] {
	font-family: FontAwesome;
	style: none;
}


.list_title {
	text-align: left;
}


.poster {
	overflow: hidden;
}

/* 헤더 */
#header{
	padding-top:50px;
	padding-bottom:50px;
}

.header{
	height:150px;
}

.titleimg{
	height:100%;
	width:40%;
}

@media(max-width:750px){
	.titleimg{
		width:60%;
	}
}

.searchbtn{
padding-bottom:60px;
}



a {
	text-decoration: none;
	color: white;
}


#searchbtn:hover {
	cursor: pointer;
}

span>img {
	width: 45px;
	position: relative;
	bottom: 60%;
	left: 80%; . mv_reaech >img{ width : 200px;
	height: 280px;
}

}
.card {
	width: 200px;
	height: 300px;
	background-color: #03001e;
	
}
.card :hover{ color: inherit;color: #ec38bc;}


.card-text{height:fit-content;  
	overflow:hidden;
      text-overflow:ellipsis;
      white-space:nowrap;}

.card-text:hover{
	color: #ec38bc;
}

.poster>img {
	border-radius: 5px;
	width: 200px;
	height: 280px;
	transition: all 0.2s linear;
}

.poster>img:hover {
	transform: scale(1.2);
	border-radius:5px;
}


</style>
<body>
	<div class="container w-xl text-center">

		<!--form으로 검색결과 넘겨주기-->
		<form action="/search.content">
			<div class="row" id="header">
				<div class="col-sm-12 header">
					<a href="/main"><img src="/img/title.png" class="titleimg"
						id="titleimg"></a>
				</div>
			</div>

			<div class="row" id="searchbar">
				<div class="col-10 col-md-10 col-lg-11">
					<input type="text" id="searchtext" name="searchtext" placeholder="검색어를 입력해주세요.">
				</div>
				<div class="col-2 col-md-2 col-lg-1 searchbtn">
					<i class="fa-solid fa-magnifying-glass searchboxin" id="searchbtn"></i>
				</div>
		</form>
		<script>
			function enterkey() { //검색창에 마우스 올린 후 엔터 누르면 바로 넘어가게 만드는 함수
				if (window.event.keyCode == 13) {
					location.href = "/search.content?searchtext="
							+ $("#searchtext").val();
				}
			};

			$("#searchbtn").on(
					"click",
					function() {
						location.href = "/search.content?searchtext="
								+ $("#searchtext").val();

					});
		</script>
		<!--검색 결과 출력-->
		<c:choose>
			<c:when test="${not empty mv_list}">
				<div class="row" id="movie_bar">

					<div class="list_title pt-2">
						영화 검색 결과 <span> ${mv_list.size()}개</span>
					</div>
					<hr>

					<div class="row row-cols-2 row-cols-md-6 g-4 m-auto p-3">
						<c:set var="i" value="0" />
						<c:set var="j" value="1" />
						<c:forEach var="m" items="${mv_list}">
							<c:if test="${i%j == 0 }">
								<div class="col">
							</c:if>

							<div class="card">
								<a href="/detailMv.content?mv_id=${m.mv_id}">

									<div class="poster">
										<img src="${m.mv_poster_path}" class="card-img-top" alt="...">
									</div>
									<p class="card-text">${m.mv_title}</p>
								</a>
							</div>
							<c:if test="${i%j == j-1 }">
					</div>
					</c:if>
					<c:set var="i" value="${i+1 }" />
					</c:forEach>
				</div>
	</div>
	</c:when>
	<c:otherwise>

		<div class="list_title pt-2">영화</div>
		<hr>
		<div>검색 결과가 없습니다.</div>
	</c:otherwise>
	</c:choose>
	</div>

	<c:choose>
		<c:when test="${not empty dr_list}">
			<div class="row p-3" id="drama_bar">
				<hr>
				<div class="list_title">
					드라마 검색 결과<span> ${dr_list.size()}개</span>
				</div>
				<hr>

				<div class="row row-cols-2 row-cols-md-6 g-4 m-auto p-3">
					<c:set var="i" value="0" />
					<c:set var="j" value="1" />
					<c:forEach var="d" items="${dr_list}">
						<c:if test="${i%j == 0 }">
							<div class="col">
						</c:if>

						<div class="card">
							<a href="/detailDr.content?dr_id=${d.dr_id}">

								<div class="poster">
									<img src="${d.dr_poster_path}" class="card-img-top" alt="...">
								</div>
								<p class="card-text">${d.dr_title}</p>
							</a>
						</div>
						<c:if test="${i%j == j-1 }">
				</div>
				</c:if>
				<c:set var="i" value="${i+1 }" />
				</c:forEach>
			</div>
			</div>
		</c:when>
		<c:otherwise>
			<hr>
			<div class="list_title">드라마</div>
			<hr>
			<div>검색 결과가 없습니다.</div>
		</c:otherwise>
	</c:choose>

	</div>

	<script>
		$(function() {

			console.log($(".mv_search").length);

		});
	</script>
</body>
</html>