<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>OTT 플랫폼</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
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

.container {
	font-family: 'DungGeunMo';
}


.logo {
	text-align: left;
	height: 100px;
}

#titleimg {
	height: 100px;
}

.ott_logo>a>img {
	width: 250px;
	margin: 30px;
}

.ott_logo>img {
	width: 250px;
	margin: 30px;
}

.postimg {
	border-radius: 5px;
	width: 200px;
}

.list_title {
	font-weight: bold;
}

body {
	background-color: #03001e;
	color: white;
}

/* header */
.header {
	height: 100px;
	background-color: #03001e;
	padding-bottom: 20px;
}

#logo, #titleimg {
	height: 100%;
}

#titleimg {
	position: relative;
	left: -38%;
}

#titleimg:hover {
	cursor: pointer;
}


.carousel-item>a>img{width:200px;height: 280px;}

.carousel-control-prev {
	margin: 5px;
	width: 60px;
}

.carousel-control-next {
	margin: 5px;
	width: 60px;
}

@media ( max-width :767px) {
	#logo {
		height: 60%;
	}
	#titleimg {
		height: 100%;
	}
}

.searchbox {
	text-align: right;
}

.searchboxin {
	position: relative;
	top: 10%;
}

#searchtext {
	width: 90%;
}

.menuicon {
	text-align: center;
}

#menuicon {
	position: relative;
	top: 8%;
}

#menuicon:hover {
	cursor: pointer;
}

/* menu */
.offcanvas {
	height: 800px;
	background-color: #03001e;
}

.offcanvas-body {
	color: white;
	text-align: center;
}

.profilebox {
	width: 170px;
	height: 150px;
	overflow: hidden;
	position: relative;
	left: 30%;
	margin-bottom: 20px;
	margin-top: 30px;
}

.profile {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

#profileimg {
	height: 100%;
}

.profiletext {
	font-size: larger;
	margin-bottom: 10px;
	font-family: 'DungGeunMo';
}

#logoutBtn {
	font-size: larger;
	font-family: 'DungGeunMo';
}

.menulink {
	font-size: x-large;
	margin-bottom: 50px;
	margin-top: 50px;
	font-family: 'DungGeunMo';
}

.menulink:hover, .searchbtn:hover {
   color: #c4c4c4;
   cursor:pointer;
}

#colsebtn {
	border: none;
	color: white;
	background-color: #03001e;
}

#linksec {
	padding-top: 50px;;
	padding-bottom: 50px;;
}

#logoutsec {
	padding-top: 50px;;
	padding-bottom: 50px;;
}

#linksec {
	padding-top: 50px;;
	padding-bottom: 50px;;
}

#logoutsec {
	padding-top: 50px;;
	padding-bottom: 50px;;
}

a {
	color: white;
	text-decoration: none;
}

button {
	border: none;
	border-radius: 5px;
}

/* footer */
.footer {
	text-align: left;
	padding-top: 50px;
	padding-bottom: 50px;
	padding-left: 20px;
	background-color: #03001e;
	color: white;
}

.footerAtag {
	padding-top: 30px;
	padding-bottom: 20px;
}

.footerAtag>a {
	font-family: 'DungGeunMo';
	font-size: large;
}

.footerAtag>a:hover {
	color: #ec38bc;
}

.footerImpormation {
	font-size: smaller;
}

.footerIcon {
	padding-top: 10px;
	height: 50px;
	line-height: 50px;
}

.fa-brands:hover {
	cursor: pointer;
}

.snsIcon {
	padding-right: 20px;
	padding-left: 10px;
}
</style>

</head>
<body>
	<div class="container w-xl text-center">

     <c:choose>
      <c:when test="${not empty dr_date_n or not empty mv_date_n}">
      
   <form action="/n_search.content">  
        <div class="row header">
         <div class="col-12 col-md-6 col-lg-7" id="logo">
            <a href="/main"><img src="/img/title.png" class="titleimg" id="titleimg"></a>
         </div>
         <div class="col-9 col-md-5 col-lg-4 searchbox">
            <input type="text" class="searchboxin" id="n_searchtext"
                name="n_searchtext" placeholder="넷플릭스 내 검색"> <i
               class="fa-solid fa-magnifying-glass searchboxin searchbtn" id="n_searchbtn"></i>
         </div>
         <div class="col-3 col-md-1 col-lg-1 menuicon">
            <i class="fas fa-bars fa-2x" id="menuicon"
               data-bs-toggle="offcanvas"
               data-bs-target="#offcanvasWithBothOptions"
               aria-controls="offcanvasWithBothOptions"></i>
         </div>
      </div>
        </form>
        
        <div class="ott_logo col-12">
           <a href="/netflix.content"><img src="/img/netbf.png"></a>
        </div>
       </c:when>
        </c:choose>

		<c:choose>
			<c:when test="${not empty mv_date_n}">
			       <hr>
				<div class="list_title pt-2">
					영화
					<!-- <span> ${mv_date_n.size()}개</span>-->
				</div>
				<hr>

				<!-- 영화 캐러셀 -->
				<div class="poster1">
					<div class="col-12 fs-3 titlename">최신작</div>
					<hr>
					<div>
						<div id="carouselExampleControls1" class="carousel slide" data-bs-ride="false">
							<div class="carousel-inner">
								<div class="carousel-item imgbox active">
									<c:forEach var="m" items="${mv_date_n}" begin="0" end="5" step="1">
										<a href="/detailMv.content?mv_id=${m.mv_id }"><img src="${m.mv_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
								<div class="carousel-item imgbox">
									<c:forEach var="m" items="${mv_date_n}" begin="6" end="11" step="1">
										<a href="/detailMv.content?mv_id=${m.mv_id }"><img src="${m.mv_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
								<div class="carousel-item imgbox">
									<c:forEach var="m" items="${mv_date_n}" begin="12" end="17" step="1">
										<a href="/detailMv.content?mv_id=${m.mv_id }"><img src="${m.mv_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
							</div>
							<button class="carousel-control-prev postLRbtn" type="button" data-bs-target="#carouselExampleControls1" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next postLRbtn" type="button" data-bs-target="#carouselExampleControls1" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden ">Next</span>
							</button>
						</div>
					</div>
				</div>

				<div class="poster2">
					<hr>
					<div class="col-12 fs-3 titlename">인기순</div>
					<hr>
					<div>
						<div id="carouselExampleControls2" class="carousel slide" data-bs-ride="false">
							<div class="carousel-inner">
								<div class="carousel-item imgbox active">
									<c:forEach var="m" items="${mv_avg_n}" begin="0" end="5" step="1">
										<a href="/detailMv.content?mv_id=${m.mv_id }"><img src="${m.mv_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
								<div class="carousel-item imgbox">
									<c:forEach var="m" items="${mv_avg_n}" begin="6" end="11" step="1">
										<a href="/detailMv.content?mv_id=${m.mv_id }"><img src="${m.mv_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
								<div class="carousel-item imgbox">
									<c:forEach var="m" items="${mv_avg_n}" begin="12" end="17" step="1">
										<a href="/detailMv.content?mv_id=${m.mv_id }"><img src="${m.mv_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
							</div>
							<button class="carousel-control-prev postLRbtn" type="button" data-bs-target="#carouselExampleControls2" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next postLRbtn" type="button" data-bs-target="#carouselExampleControls2" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden ">Next</span>
							</button>
						</div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<c:if test="${empty mv_date_n and mv_avg_n} ">
					<div class="list_title pt-2">영화</div>
					<hr>
					<div>
						출력할 콘텐츠가 없습니다.
						<div>
				</c:if>
			</c:otherwise>
		</c:choose>


		<!-- 드라마 리스트 -->
		<c:choose>
			<c:when test="${not empty dr_date_n}">

				<hr>
				<div class="list_title">
					드라마
					<!-- <span> ${dr_date_n.size()}개</span>-->
				</div>
				<hr>

				<!-- 드라마 캐러셀 -->
				<div class="poster3">
					<div class="col-12 fs-3 titlename">최신작</div>
					<hr>
					<div>
						<div id="carouselExampleControls3" class="carousel slide" data-bs-ride="false">
							<div class="carousel-inner">
								<div class="carousel-item imgbox active">
									<c:forEach var="d" items="${dr_date_n}" begin="0" end="5" step="1">
										<a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
								<div class="carousel-item imgbox">
									<c:forEach var="d" items="${dr_date_n}" begin="6" end="11" step="1">
										<a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
								<div class="carousel-item imgbox">
									<c:forEach var="d" items="${dr_date_n}" begin="12" end="17" step="1">
										<a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
							</div>
							<button class="carousel-control-prev postLRbtn" type="button" data-bs-target="#carouselExampleControls3" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next postLRbtn" type="button" data-bs-target="#carouselExampleControls3" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden ">Next</span>
							</button>
						</div>
					</div>
				</div>

				<div class="poster4">
					<hr>
					<div class="col-12 fs-3 titlename">인기순</div>
					<hr>
					<div>
						<div id="carouselExampleControls4" class="carousel slide" data-bs-ride="false">
							<div class="carousel-inner">
								<div class="carousel-item imgbox active">
									<c:forEach var="d" items="${dr_avg_n}" begin="0" end="5" step="1">
										<a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
								<div class="carousel-item imgbox">
									<c:forEach var="d" items="${dr_avg_n}" begin="6" end="11" step="1">
										<a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
								<div class="carousel-item imgbox">
									<c:forEach var="d" items="${dr_avg_n}" begin="12" end="17" step="1">
										<a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
							</div>
							<button class="carousel-control-prev postLRbtn" type="button" data-bs-target="#carouselExampleControls4" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next postLRbtn" type="button" data-bs-target="#carouselExampleControls4" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden ">Next</span>
							</button>
						</div>
					</div>
				</div>
				<div class="row footer">
					<div class="col-12 footerAtag">
						 <a href="#">회사소개</a>&nbsp&nbsp<a href="#">고객센터</a> &nbsp&nbsp<a href="#">이용약관</a> &nbsp&nbsp<a href="#">개인정보 처리방침</a>
					</div>
					<div class="col-12 footerImpormation">(주)퍼플무드 | 대표이사 : 성태조</div>
					<div class="col-12 footerImpormation">이메일 주소 : purpleMood@purplemood.com</div>
					<div class="col-12 footerImpormation">사업자등록번호 : 000-00-000</div>
					<div class="col-12 footerImpormation">통신판매업 신고번호 : 제 2022-서울중구-301e호</div>
					<div class="col-12 footerImpormation">주소 : 대한민국 서울특별시 중구 남대문로 120, 대일빌딩 3층</div>
					<div class="col-12 footerIcon">
						<span class="snsIcon"><i class="fa-brands fa-instagram fa-2xl"></i></span> <span class="snsIcon"><i class="fa-brands fa-twitter fa-2xl"></i></span> <span class="snsIcon"> <i class="fa-brands fa-facebook fa-2xl"></i>
						</span>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<c:if test="${empty dr_date_n and dr_avg_n} ">
					<div class="list_title pt-2">드라마</div>
					<hr>
					<div>
						출력할 콘텐츠가 없습니다.
						<div>
				</c:if>
			</c:otherwise>
		</c:choose>



		<!-- 디즈니 플러스 -->
		<c:choose>
			<c:when test="${not empty dr_date_d or not empty mv_date_d}">

				<form action="/d_search.content">
					<div class="row header">
 						<div class="col-12 col-md-6 col-lg-7" id="logo">
							<a href="/main"><img src="/img/title.png" class="titleimg" id="titleimg"></a>
						</div>
						<div class="col-9 col-md-5 col-lg-4 searchbox">
							<input type="text" class="searchboxin" id="d_searchtext" name="d_searchtext" placeholder="디즈니플러스 내 검색"> <i class="fa-solid fa-magnifying-glass searchboxin searchbtn" id="d_searchbtn"></i>
						</div>
						<div class="col-3 col-md-1 col-lg-1 menuicon">
							<i class="fas fa-bars fa-2x" id="menuicon" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBothOptions" aria-controls="offcanvasWithBothOptions"></i>
						</div>
					</div>
				</form>

				<div class="ott_logo col-12">
					<a href="/disney.content"><img src="/img/disbf.png"></a>
				</div>
				<hr>
			</c:when>
		</c:choose>

		<c:choose>
			<c:when test="${not empty mv_date_d}">
				<div class="list_title pt-2">
					영화
					<!-- <span> ${mv_date_d.size()}개</span>-->
				</div>
				<hr>
				<div class="poster1">
					<div class="col-12 fs-3 titlename">최신작</div>
					<hr>
					<div>
						<div id="carouselExampleControls1" class="carousel slide" data-bs-ride="false">
							<div class="carousel-inner">
								<div class="carousel-item imgbox active">
									<c:forEach var="m" items="${mv_date_d}" begin="0" end="5" step="1">
										<a href="/detailMv.content?mv_id=${m.mv_id}"><img src="${m.mv_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
								<div class="carousel-item imgbox">
									<c:forEach var="m" items="${mv_date_d}" begin="6" end="11" step="1">
										<a href="/detailMv.content?mv_id=${m.mv_id}"><img src="${m.mv_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
								<div class="carousel-item imgbox">
									<c:forEach var="m" items="${mv_date_d}" begin="12" end="17" step="1">
										<a href="/detailMv.content?mv_id=${m.mv_id}"><img src="${m.mv_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
							</div>
							<button class="carousel-control-prev postLRbtn" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next postLRbtn" type="button" data-bs-target="#carouselExampleControls1" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden ">Next</span>
							</button>
						</div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<c:if test="${empty mv_date_d and mv_avg_d} ">
					<div class="list_title pt-2">영화</div>
					<hr>
					<div>
						출력할 콘텐츠가 없습니다.
						<div>
				</c:if>
			</c:otherwise>
		</c:choose>

		<c:choose>
			<c:when test="${not empty mv_avg_d}">
				<div class="poster2">
					<hr>
					<div class="col-12 fs-3 titlename">인기순</div>
					<hr>
					<div>
						<div id="carouselExampleControls2" class="carousel slide" data-bs-ride="false">
							<div class="carousel-inner">
								<div class="carousel-item imgbox active">
									<c:forEach var="m" items="${mv_avg_d}" begin="0" end="5" step="1">
										<a href="/detailMv.content?mv_id=${m.mv_id}"><img src="${m.mv_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
								<div class="carousel-item imgbox">
									<c:forEach var="m" items="${mv_avg_d}" begin="6" end="11" step="1">
										<a href="/detailMv.content?mv_id=${m.mv_id}"><img src="${m.mv_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
								<div class="carousel-item imgbox">
									<c:forEach var="m" items="${mv_avg_d}" begin="12" end="17" step="1">
										<a href="/detailMv.content?mv_id=${m.mv_id}"><img src="${m.mv_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
							</div>
							<button class="carousel-control-prev postLRbtn" type="button" data-bs-target="#carouselExampleControls2" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next postLRbtn" type="button" data-bs-target="#carouselExampleControls2" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden ">Next</span>
							</button>
						</div>
					</div>
				</div>

			</c:when>
		</c:choose>



		<!-- 드라마 리스트 -->
		<c:choose>
			<c:when test="${not empty dr_date_d}">
				<hr>
				<div class="list_title">
					드라마
					<!--  <span> ${dr_date_d.size()}개</span>-->
				</div>
				<hr>

				<!-- 드라마 캐러셀 -->
				<div class="poster3">
					<div class="col-12 fs-3 titlename">최신작</div>
					<hr>
					<div>
						<div id="carouselExampleControls3" class="carousel slide" data-bs-ride="false">
							<div class="carousel-inner">
								<div class="carousel-item imgbox active">
									<c:forEach var="d" items="${dr_date_d}" begin="0" end="5" step="1">
										<a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
								<div class="carousel-item imgbox">
									<c:forEach var="d" items="${dr_date_d}" begin="6" end="11" step="1">
										<a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
								<div class="carousel-item imgbox">
									<c:forEach var="d" items="${dr_date_d}" begin="12" end="17" step="1">
										<a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
							</div>
							<button class="carousel-control-prev postLRbtn" type="button" data-bs-target="#carouselExampleControls3" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next postLRbtn" type="button" data-bs-target="#carouselExampleControls3" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden ">Next</span>
							</button>
						</div>
					</div>
				</div>

				<div class="poster54">
					<hr>
					<div class="col-12 fs-3 titlename">인기순</div>
					<hr>
					<div>
						<div id="carouselExampleControls4" class="carousel slide" data-bs-ride="false">
							<div class="carousel-inner">
								<div class="carousel-item imgbox active">
									<c:forEach var="d" items="${dr_avg_d}" begin="0" end="5" step="1">
										<a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
								<div class="carousel-item imgbox">
									<c:forEach var="d" items="${dr_avg_d}" begin="6" end="11" step="1">
										<a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
								<div class="carousel-item imgbox">
									<c:forEach var="d" items="${dr_avg_d}" begin="12" end="17" step="1">
										<a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
							</div>
							<button class="carousel-control-prev postLRbtn" type="button" data-bs-target="#carouselExampleControls4" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next postLRbtn" type="button" data-bs-target="#carouselExampleControls4" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden ">Next</span>
							</button>
						</div>
					</div>
				</div>
				<div class="row footer">
					<div class="col-12 footerAtag">
						 <a href="#">회사소개</a>&nbsp&nbsp<a href="#">고객센터</a> &nbsp&nbsp<a href="#">이용약관</a> &nbsp&nbsp<a href="#">개인정보 처리방침</a>
					</div>
					<div class="col-12 footerImpormation">(주)퍼플무드 | 대표이사 : 성태조</div>
					<div class="col-12 footerImpormation">이메일 주소 : purpleMood@purplemood.com</div>
					<div class="col-12 footerImpormation">사업자등록번호 : 000-00-000</div>
					<div class="col-12 footerImpormation">통신판매업 신고번호 : 제 2022-서울중구-301e호</div>
					<div class="col-12 footerImpormation">주소 : 대한민국 서울특별시 중구 남대문로 120, 대일빌딩 3층</div>
					<div class="col-12 footerIcon">
						<span class="snsIcon"><i class="fa-brands fa-instagram fa-2xl"></i></span> <span class="snsIcon"><i class="fa-brands fa-twitter fa-2xl"></i></span> <span class="snsIcon"> <i class="fa-brands fa-facebook fa-2xl"></i>
						</span>
					</div>

				</div>
			</c:when>
			<c:otherwise>
				<c:if test="${empty dr_date_d and dr_avg_d} ">
					<div class="list_title pt-2">드라마</div>
					<hr>
					<div>
						출력할 콘텐츠가 없습니다.
						<div>
				</c:if>
			</c:otherwise>
		</c:choose>


		<!-- 웨이브 -->

		<c:choose>
			<c:when test="${not empty dr_date_wv and not empty mv_date_wv}">

				<form action="/wv_search.content">
					<div class="row header">
						 <div class="col-12 col-md-6 col-lg-7" id="logo">
							<a href="/main"><img src="/img/title.png" class="titleimg" id="titleimg"></a>
						</div>
						<div class="col-9 col-md-5 col-lg-4 searchbox">
							<input type="text" class="searchboxin" id="wv_searchtext" name="wv_searchtext" placeholder="웨이브 내 검색"> <i class="fa-solid fa-magnifying-glass searchboxin searchbtn" id="wv_searchbtn"></i>
						</div>
						<div class="col-3 col-md-1 col-lg-1 menuicon">
							<i class="fas fa-bars fa-2x" id="menuicon" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBothOptions" aria-controls="offcanvasWithBothOptions"></i>
						</div>
					</div>
				</form>
				<div class="ott_logo col-12">
					<a href="/wavve.content"><img src="/img/wavbf.png"></a>
				</div>
				<hr>
			</c:when>
		</c:choose>

		<c:choose>
			<c:when test="${not empty mv_date_wv}">

				<div class="list_title pt-2">
					영화
					<!--  <span> ${mv_date_wv.size()}개</span>-->
				</div>
				<hr>

				<div class="poster1">
					<div class="col-12 fs-3 titlename">최신작</div>
					<hr>
					<div>
						<div id="carouselExampleControls1" class="carousel slide" data-bs-ride="false">
							<div class="carousel-inner">
								<div class="carousel-item imgbox active">
									<c:forEach var="m" items="${mv_date_wv}" begin="0" end="5" step="1">
										<a href="/detailMv.content?mv_id=${m.mv_id}"><img src="${m.mv_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
								<div class="carousel-item imgbox">
									<c:forEach var="m" items="${mv_date_wv}" begin="6" end="11" step="1">
										<a href="/detailMv.content?mv_id=${m.mv_id}"><img src="${m.mv_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
								<div class="carousel-item imgbox">
									<c:forEach var="m" items="${mv_date_wv}" begin="12" end="17" step="1">
										<a href="/detailMv.content?mv_id=${m.mv_id}"><img src="${m.mv_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
							</div>
							<button class="carousel-control-prev postLRbtn" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next postLRbtn" type="button" data-bs-target="#carouselExampleControls1" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden ">Next</span>
							</button>
						</div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<c:if test="${empty mv_date_wv and mv_avg_wv} ">
					<div class="list_title pt-2">영화</div>
					<hr>
					<div>
						출력할 콘텐츠가 없습니다.
						<div>
				</c:if>
			</c:otherwise>
		</c:choose>

		<c:choose>
			<c:when test="${not empty mv_avg_wv}">
				<div class="poster2">
					<hr>
					<div class="col-12 fs-3 titlename">인기순</div>
					<hr>
					<div>
						<div id="carouselExampleControls2" class="carousel slide" data-bs-ride="false">
							<div class="carousel-inner">
								<div class="carousel-item imgbox active">
									<c:forEach var="m" items="${mv_avg_wv}" begin="0" end="5" step="1">
										<a href="/detailMv.content?mv_id=${m.mv_id}"><img src="${m.mv_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
								<div class="carousel-item imgbox">
									<c:forEach var="m" items="${mv_avg_wv}" begin="6" end="11" step="1">
										<a href="/detailMv.content?mv_id=${m.mv_id}"><img src="${m.mv_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
								<div class="carousel-item imgbox">
									<c:forEach var="m" items="${mv_avg_wv}" begin="12" end="17" step="1">
										<a href="/detailMv.content?mv_id=${m.mv_id}"><img src="${m.mv_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
							</div>
							<button class="carousel-control-prev postLRbtn" type="button" data-bs-target="#carouselExampleControls2" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next postLRbtn" type="button" data-bs-target="#carouselExampleControls2" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden ">Next</span>
							</button>
						</div>
					</div>
				</div>

			</c:when>
			<c:otherwise>
				<c:if test="${empty dr_date_wv and dr_avg_wv} ">
					<div class="list_title pt-2">영화</div>
					<hr>
					<div>
						출력할 콘텐츠가 없습니다.
						<div>
				</c:if>
			</c:otherwise>
		</c:choose>

		<c:choose>
			<c:when test="${not empty dr_date_wv}">
				<hr>
				<div class="list_title">
					드라마
					<!--  <span> ${dr_date_wv.size()}개</span>-->
				</div>
				<hr>

				<div class="poster3">
					<div class="col-12 fs-3 titlename">최신작</div>
					<hr>
					<div>
						<div id="carouselExampleControls3" class="carousel slide" data-bs-ride="false">
							<div class="carousel-inner">
								<div class="carousel-item imgbox active">
									<c:forEach var="d" items="${dr_date_wv}" begin="0" end="5" step="1">
										<a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
								<div class="carousel-item imgbox">
									<c:forEach var="d" items="${dr_date_wv}" begin="6" end="11" step="1">
										<a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
								<div class="carousel-item imgbox">
									<c:forEach var="d" items="${dr_date_wv}" begin="12" end="17" step="1">
										<a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
							</div>
							<button class="carousel-control-prev postLRbtn" type="button" data-bs-target="#carouselExampleControls3" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next postLRbtn" type="button" data-bs-target="#carouselExampleControls3" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden ">Next</span>
							</button>
						</div>
					</div>
				</div>

				<div class="poster4">
					<hr>
					<div class="col-12 fs-3 titlename">인기순</div>
					<hr>
					<div>
						<div id="carouselExampleControls4" class="carousel slide" data-bs-ride="false">
							<div class="carousel-inner">
								<div class="carousel-item imgbox active">
									<c:forEach var="d" items="${dr_avg_wv}" begin="0" end="5" step="1">
										<a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
								<div class="carousel-item imgbox">
									<c:forEach var="d" items="${dr_avg_wv}" begin="6" end="11" step="1">
										<a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
								<div class="carousel-item imgbox">
									<c:forEach var="d" items="${dr_avg_wv}" begin="12" end="17" step="1">
										<a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
							</div>
							<button class="carousel-control-prev postLRbtn" type="button" data-bs-target="#carouselExampleControls4" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next postLRbtn" type="button" data-bs-target="#carouselExampleControls4" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden ">Next</span>
							</button>
						</div>
					</div>
				</div>
				<div class="row footer">
					<div class="col-12 footerAtag">
					 <a href="#">회사소개</a>&nbsp&nbsp<a href="#">고객센터</a> &nbsp&nbsp<a href="#">이용약관</a> &nbsp&nbsp<a href="#">개인정보 처리방침</a>
					</div>
					<div class="col-12 footerImpormation">(주)퍼플무드 | 대표이사 : 성태조</div>
					<div class="col-12 footerImpormation">이메일 주소 : purpleMood@purplemood.com</div>
					<div class="col-12 footerImpormation">사업자등록번호 : 000-00-000</div>
					<div class="col-12 footerImpormation">통신판매업 신고번호 : 제 2022-서울중구-301e호</div>
					<div class="col-12 footerImpormation">주소 : 대한민국 서울특별시 중구 남대문로 120, 대일빌딩 3층</div>
					<div class="col-12 footerIcon">
						<span class="snsIcon"><i class="fa-brands fa-instagram fa-2xl"></i></span> <span class="snsIcon"><i class="fa-brands fa-twitter fa-2xl"></i></span> <span class="snsIcon"> <i class="fa-brands fa-facebook fa-2xl"></i>
						</span>
					</div>

				</div>
			</c:when>
			<c:otherwise>
				<c:if test="${empty dr_date_n and dr_avg_n} ">
					<div class="list_title pt-2">드라마</div>
					<hr>
					<div>
						출력할 콘텐츠가 없습니다.
						<div>
				</c:if>
			</c:otherwise>
		</c:choose>


		<!-- 왓챠 -->
		<c:choose>
			<c:when test="${not empty dr_date_wc and not empty mv_date_wc}">

				<form action="/wc_search.content">
					<div class="row header">
						 <div class="col-12 col-md-6 col-lg-7" id="logo">
							<a href="/main"><img src="/img/title.png" class="titleimg" id="titleimg"></a>
						</div>
						<div class="col-9 col-md-5 col-lg-4 searchbox">
							<input type="text" class="searchboxin" id="wc_searchtext" name="wc_searchtext" placeholder="왓챠 내 검색"> <i class="fa-solid fa-magnifying-glass searchboxin searchbtn" id="wc_searchbtn"></i>
						</div>
						<div class="col-3 col-md-1 col-lg-1 menuicon">
							<i class="fas fa-bars fa-2x" id="menuicon" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBothOptions" aria-controls="offcanvasWithBothOptions"></i>
						</div>
					</div>
				</form>

				<div class="ott_logo col-12">
					<a href="/watcha.content"><img src="/img/watbf.png"></a>
				</div>
				<hr>
			</c:when>
		</c:choose>

		<c:choose>
			<c:when test="${not empty mv_date_wc}">

				<div class="list_title pt-2">
					영화
					<!-- <span> ${mv_date_wc.size()}개</span>-->
				</div>
				<hr>

				<div class="poster1">
					<div class="col-12 fs-3 titlename">최신작</div>
					<hr>
					<div>
						<div id="carouselExampleControls1" class="carousel slide" data-bs-ride="false">
							<div class="carousel-inner">
								<div class="carousel-item imgbox active">
									<c:forEach var="m" items="${mv_date_wc}" begin="0" end="5" step="1">
										<a href="/detailMv.content?mv_id=${m.mv_id }"><img src="${m.mv_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
								<div class="carousel-item imgbox">
									<c:forEach var="m" items="${mv_date_wc}" begin="6" end="11" step="1">
										<a href="/detailMv.content?mv_id=${m.mv_id }"><img src="${m.mv_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
								<div class="carousel-item imgbox">
									<c:forEach var="m" items="${mv_date_wc}" begin="12" end="17" step="1">
										<a href="/detailMv.content?mv_id=${m.mv_id }"><img src="${m.mv_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
							</div>
							<button class="carousel-control-prev postLRbtn" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next postLRbtn" type="button" data-bs-target="#carouselExampleControls1" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden ">Next</span>
							</button>
						</div>
					</div>
				</div>

				<div class="poster2">
					<hr>
					<div class="col-12 fs-3 titlename">인기순</div>
					<hr>
					<div>
						<div id="carouselExampleControls2" class="carousel slide" data-bs-ride="false">
							<div class="carousel-inner">
								<div class="carousel-item imgbox active">
									<c:forEach var="m" items="${mv_avg_wc}" begin="0" end="5" step="1">
										<a href="/detailMv.content?mv_id=${m.mv_id }"><img src="${m.mv_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
								<div class="carousel-item imgbox">
									<c:forEach var="m" items="${mv_avg_wc}" begin="6" end="11" step="1">
										<a href="/detailMv.content?mv_id=${m.mv_id }"><img src="${m.mv_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
								<div class="carousel-item imgbox">
									<c:forEach var="m" items="${mv_avg_wc}" begin="12" end="17" step="1">
										<a href="/detailMv.content?mv_id=${m.mv_id }"><img src="${m.mv_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
							</div>
							<button class="carousel-control-prev postLRbtn" type="button" data-bs-target="#carouselExampleControls2" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next postLRbtn" type="button" data-bs-target="#carouselExampleControls2" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden ">Next</span>
							</button>
						</div>
					</div>
				</div>

			</c:when>
			<c:otherwise>
				<c:if test="${empty mv_date_wc and mv_avg_wc} ">
					<div class="list_title pt-2">영화</div>
					<hr>
					<div>
						출력할 콘텐츠가 없습니다.
						<div>
				</c:if>
			</c:otherwise>
		</c:choose>

		<c:choose>
			<c:when test="${not empty dr_date_wc}">
				<hr>
				<div class="list_title">
					드라마
					<!-- <span> ${dr_date_wc.size()}개</span>-->
				</div>
				<hr>

				<div class="poster3">
					<div class="col-12 fs-3 titlename">최신작</div>
					<hr>
					<div>
						<div id="carouselExampleControls3" class="carousel slide" data-bs-ride="false">
							<div class="carousel-inner">
								<div class="carousel-item imgbox active">
									<c:forEach var="d" items="${dr_date_wc}" begin="0" end="5" step="1">
										<a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
								<div class="carousel-item imgbox">
									<c:forEach var="d" items="${dr_date_wc}" begin="6" end="11" step="1">
										<a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
								<div class="carousel-item imgbox">
									<c:forEach var="d" items="${dr_date_wc}" begin="12" end="17" step="1">
										<a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
							</div>
							<button class="carousel-control-prev postLRbtn" type="button" data-bs-target="#carouselExampleControls3" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next postLRbtn" type="button" data-bs-target="#carouselExampleControls3" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden ">Next</span>
							</button>
						</div>
					</div>
				</div>

				<div class="poster4">
					<hr>
					<div class="col-12 fs-3 titlename">인기순</div>
					<hr>
					<div>
						<div id="carouselExampleControls4" class="carousel slide" data-bs-ride="false">
							<div class="carousel-inner">
								<div class="carousel-item imgbox active">
									<c:forEach var="d" items="${dr_avg_wc}" begin="0" end="5" step="1">
										<a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
								<div class="carousel-item imgbox">
									<c:forEach var="d" items="${dr_avg_wc}" begin="6" end="11" step="1">
										<a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
								<div class="carousel-item imgbox">
									<c:forEach var="d" items="${dr_avg_wc}" begin="12" end="17" step="1">
										<a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
									</c:forEach>
								</div>
							</div>
							<button class="carousel-control-prev postLRbtn" type="button" data-bs-target="#carouselExampleControls4" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next postLRbtn" type="button" data-bs-target="#carouselExampleControls4" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden ">Next</span>
							</button>
						</div>
					</div>
				</div>
				<div class="row footer">
					<div class="col-12 footerAtag">
						 <a href="#">회사소개</a>&nbsp&nbsp<a href="#">고객센터</a> &nbsp&nbsp<a href="#">이용약관</a> &nbsp&nbsp<a href="#">개인정보 처리방침</a>
					</div>
					<div class="col-12 footerImpormation">(주)퍼플무드 | 대표이사 : 성태조</div>
					<div class="col-12 footerImpormation">이메일 주소 : purpleMood@purplemood.com</div>
					<div class="col-12 footerImpormation">사업자등록번호 : 000-00-000</div>
					<div class="col-12 footerImpormation">통신판매업 신고번호 : 제 2022-서울중구-301e호</div>
					<div class="col-12 footerImpormation">주소 : 대한민국 서울특별시 중구 남대문로 120, 대일빌딩 3층</div>
					<div class="col-12 footerIcon">
						<span class="snsIcon"><i class="fa-brands fa-instagram fa-2xl"></i></span> <span class="snsIcon"><i class="fa-brands fa-twitter fa-2xl"></i></span> <span class="snsIcon"> <i class="fa-brands fa-facebook fa-2xl"></i>
						</span>
					</div>

				</div>

			</c:when>
			<c:otherwise>
				<c:if test="${empty dr_date_wc and dr_avg_wc} ">
					<div class="list_title pt-2">드라마</div>
					<hr>
					<div>
						출력할 콘텐츠가 없습니다.
						<div>
				</c:if>
			</c:otherwise>
		</c:choose>

	</div>

	<c:choose>
		<c:when test="${loginID!=null && loginID!='admin123'}">
			<!-- 로그인 -->
			<div class="offcanvas offcanvas-end" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions" aria-labelledby="offcanvasWithBothOptionsLabel">
				<div class="offcanvas-header">
					<button type="button" data-bs-dismiss="offcanvas" id="colsebtn" aria-label="Close">
						<i class="fa-solid fa-xmark fa-xl"></i>
					</button>
				</div>
				<div class="offcanvas-body">
					<div class="profilebox" id="Btn" style="background: #BDBDBD;">
						<img src="/img/logo.png" id="profileimg">
					</div>
					<div class="profiletext">${loginNickname }</div>
					<div class="profiletext">
						<a href="/member/mypage.jsp">
							<button>마이페이지</button>
						</a>
					</div>
					<div id="linksec">

						<a href="/boardList.board?cpage=1">
							<div class="menulink">영화 드라마 게시판</div>
						</a>
					</div>
					<div id="logoutsec">
						<button type="button" id="logoutBtn">로그아웃</button>
					</div>



				</div>
				<script>
					$("#logoutBtn").on("click", function() {
						location.href = "/logout.member";
					})
				</script>
			</div>
		</c:when>
		<c:when test="${loginID!=null && loginID == 'admin123'}">
			<!-- 관리자 -->
			<div class="offcanvas offcanvas-end" data-bs-scroll="true"
				tabindex="-1" id="offcanvasWithBothOptions"
				aria-labelledby="offcanvasWithBothOptionsLabel">
				<div class="offcanvas-header">
					<button type="button" data-bs-dismiss="offcanvas" id="colsebtn"
						aria-label="Close">
						<i class="fa-solid fa-xmark fa-xl"></i>
					</button>
				</div>
				<div class="offcanvas-body">
					<div class="profilebox" id="Btn" style="background: #BDBDBD;">
						<img src="/img/logo.png" id="profileimg">
					</div>
					<div class="profiletext">${loginNickname }</div>
					<div class="profiletext">
						<a href="/memberOutput.manager">
							<button>관리자페이지</button>
						</a>
					</div>
					<div id="linksec">
        <a href="/boardList.board?cpage=1">
            <div class="menulink">영화 드라마 게시판</div>
        </a></div> 
					 <div id="logoutsec"><button type="button" id="logoutBtn">로그아웃</button></div>
				</div>
				<script>
					$("#logoutBtn").on("click", function() {
						location.href = "/logout.member";
					})
				</script>
			</div>
		</c:when>
<c:otherwise>
			<!-- 비로그인  -->
			<div class="offcanvas offcanvas-end" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions" aria-labelledby="offcanvasWithBothOptionsLabel">
				<div class="offcanvas-header">
					<button type="button" data-bs-dismiss="offcanvas" id="colsebtn" aria-label="Close">
						<i class="fa-solid fa-xmark fa-xl"></i>
					</button>
				</div>
				<div class="offcanvas-body">
					<div class="profilebox" style="background: #BDBDBD;">
						<img src="/img/logo.png" id="profileimg">
					</div>
					<div class="profiletext">익명의 누군가</div>
					<div class="profiletext">
						<a href="/member/signin.jsp">
							<button id="signinBtn">로그인</button>
						</a>
					</div>
					<div id="linksec">
						<a href="#">
							<div class="menulink noLoginMenu">영화 드라마 게시판</div>
						</a>
					</div>
				</div>
				<script>
					$(".noLoginMenu").on("click",function(){
						alert("로그인을 해주세요");
					})		
				</script>
			</div>
		</c:otherwise>
	</c:choose>
         <script>
		function enterkey() { //검색창에 마우스 올린 후 엔터 누르면 바로 넘어가게 만드는 함수
			if (window.event.keyCode == 13) {
		location.href="/search.content?searchtext="+$("#searchtext").val(); 
    			}
		};
		

		$("#n_searchbtn").on("click", function(){
				location.href="/n_search.content?n_searchtext="+$("#n_searchtext").val();
				
			});
		
		$("#d_searchbtn").on("click", function(){
			location.href="/d_search.content?d_searchtext="+$("#d_searchtext").val();
			
		});
		
		$("#wv_searchbtn").on("click", function(){
			location.href="/wv_search.content?wv_searchtext="+$("#wv_searchtext").val();
			
		});
		
		$("#wc_searchbtn").on("click", function(){
			location.href="/wc_search.content?wc_searchtext="+$("#wc_searchtext").val();
			
		});
		</script>

</body>
</html>