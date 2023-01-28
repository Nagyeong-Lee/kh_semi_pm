<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퍼플무드</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" rel="stylesheet" />
<style>
* {
   box-sizing: border-box;
}

body {
   background-color: #03001e;
}

.containers {
   overflow: hidden;
   color: white;
}

@font-face {
   font-family: 'DungGeunMo';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/DungGeunMo.woff')
      format('woff');
   font-weight: normal;
   font-style: normal;
}
/* div {
   border: 1px solid black;
} */

/* header */
.header {
   height: 100px;
   background-color: #03001e;
   margin-bottom: 20px;
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
/* content */
.bannerslide {
   position: relatvie;
   left: 30%;
}

.bannerimg {
   width: 95%;
}
/* ott버튼 */
.ottboxsec {
   margin-top: 50px;
   margin-bottom: 50px;
   text-align: center;
}

#watchabtn {
   display: inline-block;
   padding: 25px 30px;
   margin: 40px 0;
   transition: 0.5s;
   margin-right: 50px;
}

#watchabtn:hover {
   background: #ff0559;
   box-shadow: 0 0 5px #ff0559, 0 0 25px #ff0559, 0 0 50px #ff0559, 0 0
      200px #ff0559;
   -webkit-box-reflect: below 1px linear-gradient(transparent, #0005);
}

#wavvebtn {
   display: inline-block;
   padding: 25px 30px;
   margin: 40px 0;
   transition: 0.5s;
   margin-right: 50px;
}

#wavvebtn:hover {
   background: #022ca4;
   box-shadow: 0 0 5px #022ca4, 0 0 25px #022ca4, 0 0 50px #022ca4, 0 0
      200px #022ca4;
   -webkit-box-reflect: below 1px linear-gradient(transparent, #0005);
}

#netbtn {
   display: inline-block;
   padding: 25px 30px;
   margin: 40px 0;
   transition: 0.5s;
   margin-right: 50px;
}

#netbtn:hover {
   background: #ed1c24;
   box-shadow: 0 0 5px #ed1c24, 0 0 25px #ed1c24, 0 0 50px #ed1c24, 0 0
      200px #ed1c24;
   -webkit-box-reflect: below 1px linear-gradient(transparent, #0005);
}

#disneybtn {
   display: inline-block;
   padding: 25px 30px;
   margin: 40px 0;
   transition: 0.5s;
   margin-right: 50px;
}

#disneybtn:hover {
   background: #3bdce4;
   box-shadow: 0 0 5px #3bdce4, 0 0 25px #3bdce4, 0 0 50px #3bdce4, 0 0
      200px #3bdce4;
   -webkit-box-reflect: below 1px linear-gradient(transparent, #0005);
}

.ottimg {
   width: 200px;
   height: 60px;
}

@media ( max-width : 600px) {
   .ottimg {
      width: 150px;
      height: 50px;
   }
}
/* 영화 포스터 */
.titlename {
   padding-left: 3%;
   font-family: 'DungGeunMo';
}

.imgbox {
   text-align: center;
}

.postimg {
   width: 15%;
   border-radius: 5px;
}

.postimg:hover {
   transform: scale(1.01);
}

#carouselExampleControls, #carouselExampleControls2,
   #carouselExampleControls3, #carouselExampleControls4 {
   padding-top: 20px;
   padding-bottom: 50px;
}

.postLRbtn {
   width: 50px;
   height: 90%
}

/* footer */
.footer {
   padding-top: 50px;
   padding-bottom: 50px;
   position: relative;
   left: 5%;
   padding-bottom: 50px;
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

/* menu */
.offcanvas {
   height: 800px;
   background-color: #03001e;
}

.offcanvas-body {
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

.profiletext {
   font-size: larger;
   margin-bottom: 10px;
   color: white;
   font-family: 'DungGeunMo';
}

#profileimg {
   height: 100%;
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

hr.hr {
   width: 90%
}

</style>

</head>
<body>
   <div class="containers">
      <div class="row header fixed-top">
         <div class="col-12 col-md-7 col-lg-8" id="logo">
            <img src="/img/title.png" id="titleimg">
         </div>
         <div class="col-8 col-md-4 col-lg-3 searchbox">
            <input type="text" class="searchboxin" id="searchtext"
               onkeyup="enterkey()" name="searchtext"/> 
               <i class="fa-solid fa-magnifying-glass searchboxin" id="searchbtn"></i>
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
            <i class="fas fa-bars fa-2x" id="menuicon" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBothOptions" aria-controls="offcanvasWithBothOptions"></i>
         </div>
      </div>
      <div class="row header"></div>

      <div class="row content">
         <div class="bannersec">
            <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
               <div class="carousel-indicators col-12 d-none d-md-block bannerslide">
                  <button type="button" data-bs-target="#carouselExampleFade" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                  <button type="button" data-bs-target="#carouselExampleFade" data-bs-slide-to="1" aria-label="Slide 2"></button>
                  <button type="button" data-bs-target="#carouselExampleFade" data-bs-slide-to="2" aria-label="Slide 3"></button>
               </div>
               <div class="carousel-inner">
                  <div class="carousel-item active">
                     <img src="/img/banner1.png" class="d-block m-auto bannerimg">
                  </div>
                  <div class="carousel-item">
                     <img src="/img/banner2.png" class="d-block m-auto bannerimg">
                  </div>
                  <div class="carousel-item">
                     <img src="/img/banner3.png" class="d-block m-auto bannerimg">
                  </div>
               </div>
               <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
               </button>
               <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
               </button>
            </div>
         </div>
         <div class="ottboxsec">
            <div class="row ">
               <div class="col-6 col-lg-3">

                  <a href="/disney.content" id="disneybtn"> <img src="/img/disbf.png" id="disney" class="ottimg">
                  </a>
               </div>
               <div class="col-6 col-lg-3">
                  <a href="/wavve.content" id="wavvebtn"> <img src="/img/wavbf.png" id="wavve" class="ottimg">
                  </a>
               </div>
               <div class="col-6 col-lg-3">
                  <a href="/netflix.content" id="netbtn"> <img src="/img/netbf.png" id="netflix" class="ottimg">
                  </a>
               </div>
               <div class="col-6 col-lg-3">
                  <a href="/watcha.content" id="watchabtn"> <img src="/img/watbf.png" id="watcha" class="ottimg">

                  </a>
               </div>
               <script>
                  $("#watchabtn").on("mouseover", function() {
                     $("#watcha").attr("src", "/img/watat.png");
                  });
                  $("#watchabtn").on("mouseout", function() {
                     $("#watcha").attr("src", "/img/watbf.png");
                  });
                  $("#wavvebtn").on("mouseover", function() {
                     $("#wavve").attr("src", "/img/wavat.png");
                  });
                  $("#wavvebtn").on("mouseout", function() {
                     $("#wavve").attr("src", "/img/wavbf.png");
                  });
                  $("#netbtn").on("mouseover", function() {
                     $("#netflix").attr("src", "/img/netat.png");
                  });
                  $("#netbtn").on("mouseout", function() {
                     $("#netflix").attr("src", "/img/netbf.png");
                  });
                  $("#disneybtn").on("mouseover", function() {
                     $("#disney").attr("src", "/img/disat.png");
                  });
                  $("#disneybtn").on("mouseout", function() {
                     $("#disney").attr("src", "/img/disbf.png");
                  });
               </script>
            </div>
         </div>
         <div class="poster1">
            <div class="col-12 fs-3 titlename">인기 영화</div>
            <div>
               <div id="carouselExampleControls" class="carousel slide" data-bs-ride="false">
                  <div class="carousel-inner">
                     <div class="carousel-item imgbox active">
                        <c:forEach var="i" items="${mv_list_a }" begin="0" end="5" step="1">
                           <a href="/detailMv.content?mv_id=${i.mv_id }"><img src=${i.mv_poster_path } class="postimg"></a>
                        </c:forEach>
                     </div>
                     <div class="carousel-item imgbox">
                        <c:forEach var="i" items="${mv_list_a }" begin="6" end="11" step="1">
                           <a href="/detailMv.content?mv_id=${i.mv_id }"><img src=${i.mv_poster_path } class="postimg"></a>
                        </c:forEach>
                     </div>
                     <div class="carousel-item imgbox">
                        <c:forEach var="i" items="${mv_list_a}" begin="12" end="17" step="1">
                           <a href="/detailMv.content?mv_id=${i.mv_id }"><img src=${i.mv_poster_path } class="postimg"></a>
                        </c:forEach>
                     </div>
                  </div>
                  <button class="carousel-control-prev postLRbtn" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                     <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
                  </button>
                  <button class="carousel-control-next postLRbtn" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                     <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden ">Next</span>
                  </button>
               </div>
            </div>
         </div>
         <div class="poster2">
            <div class="col-12 fs-3 titlename">최신 영화</div>
            <div>
               <div id="carouselExampleControls2" class="carousel slide" data-bs-ride="false">
                  <div class="carousel-inner">
                     <div class="carousel-item imgbox active">
                        <c:forEach var="i" items="${mv_list_d }" begin="0" end="5" step="1">
                           <a href="/detailMv.content?mv_id=${i.mv_id }"><img src=${i.mv_poster_path } class="postimg"></a>
                        </c:forEach>
                     </div>
                     <div class="carousel-item imgbox">
                        <c:forEach var="i" items="${mv_list_d }" begin="6" end="11" step="1">
                           <a href="/detailMv.content?mv_id=${i.mv_id }"><img src=${i.mv_poster_path } class="postimg"></a>
                        </c:forEach>
                     </div>
                     <div class="carousel-item imgbox">
                        <c:forEach var="i" items="${mv_list_d }" begin="12" end="17" step="1">
                           <a href="/detailMv.content?mv_id=${i.mv_id }"><img src=${i.mv_poster_path } class="postimg"></a>
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
         <div class="poster3">
            <div class="col-12 fs-3 titlename">인기 드라마</div>
            <div>
               <div id="carouselExampleControls3" class="carousel slide" data-bs-ride="false">
                  <div class="carousel-inner">
                     <div class="carousel-item imgbox active">
                        <c:forEach var="i" items="${dr_list_a }" begin="0" end="5" step="1">
                           <a href="/detailDr.content?dr_id=${i.dr_id }"><img src=${i.dr_poster_path } class="postimg"></a>
                        </c:forEach>
                     </div>
                     <div class="carousel-item imgbox">
                        <c:forEach var="i" items="${dr_list_a }" begin="6" end="11" step="1">
                           <a href="/detailDr.content?dr_id=${i.dr_id }"><img src=${i.dr_poster_path } class="postimg"></a>
                        </c:forEach>
                     </div>
                     <div class="carousel-item imgbox">
                        <c:forEach var="i" items="${dr_list_a }" begin="12" end="17" step="1">
                           <a href="/detailDr.content?dr_id=${i.dr_id }"><img src=${i.dr_poster_path } class="postimg"></a>
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
            <div class="col-12 fs-3 titlename">최신 드라마</div>
            <div>
               <div id="carouselExampleControls4" class="carousel slide" data-bs-ride="false">
                  <div class="carousel-inner">
                     <div class="carousel-item imgbox active">
                        <c:forEach var="i" items="${dr_list_d }" begin="0" end="5" step="1">
                           <a href="/detailDr.content?dr_id=${i.dr_id }"><img src=${i.dr_poster_path } class="postimg"></a>
                        </c:forEach>
                     </div>
                     <div class="carousel-item imgbox">
                        <c:forEach var="i" items="${dr_list_d }" begin="6" end="11" step="1">
                           <a href="/detailDr.content?dr_id=${i.dr_id }"><img src=${i.dr_poster_path } class="postimg"></a>
                        </c:forEach>
                     </div>
                     <div class="carousel-item imgbox">
                        <c:forEach var="i" items="${dr_list_d }" begin="12" end="17" step="1">
                           <a href="/detailDr.content?dr_id=${i.dr_id }"><img src=${i.dr_poster_path } class="postimg"></a>
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
      </div>
      <div class="row footer">
         <hr class="hr">
         <div class="col-12 footerAtag">
            <a href="#">회사소개</a> &nbsp&nbsp <a href="#">고객센터</a> &nbsp&nbsp <a href="#">이용약관</a> &nbsp&nbsp <a href="#">개인정보 처리방침</a>
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
                  <a href="/memberOutput.manager">
                     <button>관리자페이지</button>
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
</body>
</html>