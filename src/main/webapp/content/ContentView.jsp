<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>콘텐츠 상세 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
	crossorigin="anonymous"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css"
	rel="stylesheet" />
<style>
@font-face {
	font-family: 'DungGeunMo';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/DungGeunMo.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@media screen and (max-width: 576px) { 
	.ott_icon {padding:15px; border-top:1px solid grey;}

	#basic_info{max-width:fit-content; word-break:keep-all;}
	.title>p{word-break:keep-all;margin:15px;}
 } 
 
 @media all and (max-width: 991px) { 
	.ott_icon {col}
 } 
 

.title>p{margin:15px;}

* { 
	box-sizing: border-box;
}

body {
	background-color: #03001e;
	color: white;
}
.container{
	font-family: 'DungGeunMo';
	background-color: #03001e;
	color: white;
}
/* background:linear-gradient(#03001e,50%,#7303c0,#ec38bc,#fdeff9);  border:1px solid grey;*/
#logo {
	background-color: #7303c0,;
	text-align:left;
	height:100px;
}
 #titleimg{height:100px;}

 
.poster {
	height: fit-content;

}

.poster>img {
	max-height:500px;}

.header-title{padding:20px;}

 
.info{overflow:hidden;}


.overview{height:100%;}

#ov_text{
height:100px; 
overflow-y:auto;
 -ms-overflow-style: none;
}

#ov_text::-webkit-scrollbar{
  display:none;
}
  

.ott_icon {
	margin-bottom:25px;
	max-height: 50px;
}

.ott_icon>a>img {
	padding:5px;
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

#titleimg:hover {
	cursor: pointer;
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

#searchbtn{
color:white;
}
.menuicon {
	text-align: center;
}

#menuicon {
	position: relative;
	top: 8%;
	color:white;
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

.menulink:hover, #searchbtn:hover {
	color: #c4c4c4;
	cursor: pointer;
}

#colsebtn {
	border: none;
	color: white;
	background-color: #03001e;
}
#linksec{
    padding-top: 50px;;
    padding-bottom: 50px;;
}
#logoutsec{
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
		<div class="row header">
			<div class="col-12 col-md-7 col-lg-8" id="logo">
				<img src="/img/title.png" id="titleimg">
			</div>
			<div class="col-8 col-md-4 col-lg-3 searchbox">
				<input type="text" class="searchboxin" id="searchtext"
					onkeyup="enterkey()" name="searchtext" /> 
					<i class="fa-solid fa-magnifying-glass searchboxin" id="searchbtn"></i></a>
			</div>
			<script>
			$("#titleimg").on("click",function(){
				location.href="/main";
			})
			
			$("#searchbtn").on("click",function(){
				location.href="/search.content?searchtext="+ $("#searchtext").val();;
			})
			
			function enterkey() { //검색창에 마우스 올린 후 엔터 누르면 바로 넘어가게 만드는 함수
					if (window.event.keyCode == 13) {
						location.href = "/search.content?searchtext="+ $("#searchtext").val();
					}
				}
		
			</script>

			<div class="col-4 col-md-1 col-lg-1 menuicon">
				<i class="fas fa-bars fa-2x" id="menuicon"
					data-bs-toggle="offcanvas"
					data-bs-target="#offcanvasWithBothOptions"
					aria-controls="offcanvasWithBothOptions"></i>
			</div>
		</div>

		<c:choose>
			<c:when test="${not empty mv_detail}">
				<div class="row p-5">
					<div class="poster col-md-3 p-2">
						<img src="${mv_detail.getMv_poster_path()}" class="img-fluid"
							alt="...">
					</div>
					

					<div class="col-md-9">
						<div class="header-title row">
							<div class="title col-12 col-lg-7">
								<p class="fs-3">${mv_detail.getMv_title()}</p>
							</div>
							
							<div class="ott_icon col-12 col-lg-5">
							
                      <!-- OTT아이콘 출력 -->
                        <c:if test="${mv_detail.getMv_ottNF() eq 'Y'.charAt(0)}">
                           <a href="https://www.netflix.com/kr/"><img src="/img/neticon.png" style="width: 70px; height: 70px;"></a>
                        </c:if>
                        <c:if test="${mv_detail.getMv_ottDZ() eq 'Y'.charAt(0)}">
                           <a href="https://www.disneyplus.com/ko-kr/home"><img src="/img/disicon.png" style="width: 50px; height: 50px;"></a>
                        </c:if>
                        <c:if test="${mv_detail.getMv_ottWV() eq 'Y'.charAt(0)}">
                           <a href="https://www.wavve.com/"><img src="/img/wavicon.png" style="width: 45px; height: 45px;"></a>
                        </c:if>
                        <c:if test="${mv_detail.getMv_ottWC() eq 'Y'.charAt(0)}">
                           <a href="https://watcha.com/"><img src="/img/waticon.png" style="width: 55px; height: 55px;"></a>
                        </c:if>
							</div>

							<div class="info col-12">
							<hr>
							<p id="basic_title">기본정보</p>
							<hr>
								<div id="basic_info">
									<span>장르:</span> <span>${mv_detail.getMv_genre()}</span>
								
									<span>/ 개봉일자:</span> <span>${mv_detail.getMv_release_date()}</span>
								
									<span>/ 상영시간:</span> <span>${mv_detail.getMv_runtime()}</span>
								
									<span>/ 평점:</span> <span>${mv_detail.getMv_vote_average()}</span>
								</div>
							</div>
						
							<div class="overview col-12">
							<hr>
								<p id="ov_title">줄거리</p>
								<hr>
								<p id="ov_text">${mv_detail.getMv_overview()}</p>
							</div>
						</div>
				</div>
			
			</c:when>
			<c:otherwise>
			
				<!-- 드라마 정보 출력 -->
				<div class="row p-5">
					<div class="poster col-sm-3 p-2">
						<img src="${dr_detail.getDr_poster_path()}" class="img-fluid"
							alt="...">
					</div>

					<div class="col-sm-9">
						<div class="header-title row p-2">
							<div class="title col-12 col-sm-7">
								<p class="fs-3">${dr_detail.getDr_title()}</p>
							</div>
							<div class="ott_icon col-12 col-sm-5">

                       <!-- OTT아이콘 출력 -->
                        <c:if test="${dr_detail.getDr_ottNF() eq 'Y'.charAt(0)}">
                           <a href="https://www.netflix.com/kr/"><img src="/img/neticon.png" style="width: 70px; height: 70px;"></a>
                        </c:if>
                        <c:if test="${dr_detail.getDr_ottDZ() eq 'Y'.charAt(0)}">
                           <a href="https://www.disneyplus.com/ko-kr/home"><img src="/img/disicon.png" style="width: 50px; height: 50px;"></a>
                        </c:if>
                        <c:if test="${dr_detail.getDr_ottWV() eq 'Y'.charAt(0)}">
                           <a href="https://www.wavve.com/"><img src="/img/wavicon.png" style="width: 45px; height: 45px;"></a>
                        </c:if>
                        <c:if test="${dr_detail.getDr_ottWC() eq 'Y'.charAt(0)}">
                           <a href="https://watcha.com/"><img src="/img/waticon.png" style="width: 55px; height: 55px;"></a>
                        </c:if>
							</div>
								<hr>
							<div class="info col-12">
							<p id="basic_title">기본정보</p>
							<hr>
								<div id="basic_info">
									<span>장르:</span> <span>${dr_detail.getDr_genre()}</span>
							
									<span>/ 방영날짜:</span> <span>${dr_detail.getDr_first_air_date()}</span>
								
									<span>/ 평점:</span> <span>${dr_detail.getDr_vote_average()}</span>
								</div>
							</div>
							<div class="overview col-12">
									<hr>
								<p id="ov_title">줄거리</p>
									<hr>
								<p id="ov_text">${dr_detail.getDr_overview()}</p>
							</div>
						</div>
			</c:otherwise>
		</c:choose>
			<!-- <div><button id="back">이전</button></div>-->
			</div>
         

 	
		<div class="row footer">
			<hr class="hr">
			<div class="col-12 footerAtag">
				<a href="#">회사소개</a> &nbsp&nbsp <a href="#">고객센터</a> &nbsp&nbsp <a
					href="#">이용약관</a> &nbsp&nbsp&nbsp <a href="#">개인정보 처리방침</a>
			</div>
			<div class="col-12 footerImpormation">(주)퍼플무드 | 대표이사 : 성태조</div>
			<div class="col-12 footerImpormation">이메일 주소 :
				purpleMood@purplemood.com</div>
			<div class="col-12 footerImpormation">사업자등록번호 : 000-00-000</div>
			<div class="col-12 footerImpormation">통신판매업 신고번호 : 제
				2022-서울중구-301e호</div>
			<div class="col-12 footerImpormation">주소 : 대한민국 서울특별시 중구 남대문로
				120, 대일빌딩 3층</div>
			<div class="col-12 footerIcon">
				<span class="snsIcon"><i
					class="fa-brands fa-instagram fa-2xl"></i></span> <span class="snsIcon"><i
					class="fa-brands fa-twitter fa-2xl"></i></span> <span class="snsIcon">
					<i class="fa-brands fa-facebook fa-2xl"></i>
				</span>
			</div>
		</div>
			
      <!--   <script> 
        $("#back").on("click", function(){
        	window.history.back();
        	
        })

      </script>--> 
      
      <c:choose>
		<c:when test="${loginID!=null && loginID!='admin123'}">
			<!-- 로그인 -->
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
						<a href="/member/mypage.jsp">
							<button>마이페이지</button>
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
						<a href="#">
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
        </a></div>
				</div>
				<script>
					$(".noLoginMenu").on("click",function(){
						alert("로그인을 해주세요");
					})
				</script>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>