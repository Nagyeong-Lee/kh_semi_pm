<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>넷플릭스</title>
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
body {
	background-color: #03001e;
	color: white;
}
.ott_logo>img {
	width: 250px;
	margin: 30px;
}

.postimg {
	width: 200px;
}
.list_title {
	text-align: left;
}
.card {
	width: 200px;
	height: 300px;
	background-color: #03001e;
}
.poster {
	overflow: hidden;
}

#ntbtn:hover{
cursor: pointer;
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
.card-text {
		overflow:hidden;
      text-overflow:ellipsis;
      white-space:nowrap;
	height: fit-content;
}
.card-text:hover {
	color: #7303c0
}

.card :hover{ color: inherit;color: #7303c0;}

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
.poster>img {
	border-radius: 5px;
	width: 200px;
	height: 280px;
	transition: all 0.2s linear;
}
.poster>img:hover {
	transform: scale(1.2);
}
</style>
<body>
	<div class="container w-xl text-center">

		<!-- ott별로 출력하는 페이지 -->

		<form action="/n_search.content">
			<div class="row header">
				<div class="col-12 col-md-6 col-lg-7" id="logo">
					<a href="/main"><img src="/img/title.png" class="titleimg"
						id="titleimg"></a>
				</div>
				<div class="col-9 col-md-5 col-lg-4 searchbox">
					<input type="text" class="searchboxin" id="searchtext"
						name="n_searchtext" placeholder="넷플릭스 내 검색"> <i
						class="fa-solid fa-magnifying-glass searchboxin" id="searchbtn"></i>
				</div>
				<div class="col-3 col-md-1 col-lg-1 menuicon">
					<i class="fas fa-bars fa-2x" id="menuicon"
						data-bs-toggle="offcanvas"
						data-bs-target="#offcanvasWithBothOptions"
						aria-controls="offcanvasWithBothOptions"></i>
				</div>
				<script>
				$("#searchbtn").on("click", function(){
					location.href="/n_search.content?n_searchtext="+$("#searchtext").val();
					
				});
				</script>
			</div>
		</form>

		<div class="ott_logo col-12">

			<img src="/img/netbf.png" id="ntbtn">
			<script>
				$("#ntbtn").on("click",function(){
					location.href="/netflix.content";
				})
			</script>

		</div>
		<hr>

		<!-- 넷플릭스 영화 검색 결과 출력 -->
		<c:choose>
			<c:when test="${not empty n_mv_list}">

				<div class="list_title">
					영화 검색 결과<span> ${n_mv_list.size()}개</span>
				</div>
				<hr>

				<div class="row row-cols-2 row-cols-md-6 g-4 m-auto p-3">
					<c:set var="i" value="0" />
					<c:set var="j" value="1" />
					<c:forEach var="n" items="${n_mv_list}">
						<c:if test="${i%j == 0 }">
							<div class="col">
						</c:if>

						<div class="card">
							<a href="/detailMv.content?mv_id=${n.mv_id}">

								<div class="poster">
									<img src="${n.mv_poster_path}" class="card-img-top" alt="...">
								</div>
								<p class="card-text">${n.mv_title}</p>
							</a>
						</div>
						<c:if test="${i%j == j-1 }">
				</div>
				</c:if>
				<c:set var="i" value="${i+1 }" />
				</c:forEach>
	</div>
	</c:when>
	<c:otherwise>
		<div class="list_title pt-2">영화</div>
		<hr>
		<div>검색 결과가 없습니다.</div>
	</c:otherwise>
	</c:choose>

	<!-- 넷플릭스 드라마 검색 결과 출력 -->
	
	<c:choose>
		<c:when test="${not empty n_dr_list}">
			<hr>
			<div class="list_title">
				드라마 검색 결과<span> ${n_dr_list.size()}개</span>
			</div>
			<hr>

			<div class="row row-cols-2 row-cols-md-6 g-4 m-auto p-3">
				<c:set var="i" value="0" />
				<c:set var="j" value="1" />
				<c:forEach var="n" items="${n_dr_list}">
					<c:if test="${i%j == 0 }">
						<div class="col">
					</c:if>
					<div class="card">
						<a href="/detailDr.content?dr_id=${n.dr_id}">

							<div class="poster">
								<img src="${n.dr_poster_path}" class="card-img-top" alt="...">
							</div>
							<p class="card-text">${n.dr_title}</p>
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
			<div class="list_title pt-2">드라마</div>
			<hr>
			<div>검색 결과가 없습니다.</div>
		</c:otherwise>
			</c:choose>
	
	
	<div class="row footer">
			<div class="col-12 footerAtag">
 				<a href="#">회사소개</a>&nbsp&nbsp<a href="#">고객센터</a> &nbsp&nbsp<a href="#">이용약관</a> &nbsp&nbsp<a href="#">개인정보 처리방침</a>
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
</div>
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