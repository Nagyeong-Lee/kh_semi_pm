<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>영화 드라마 게시판</title>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
        crossorigin="anonymous"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" rel="stylesheet">
    <style>
        @font-face {
            font-family: 'DungGeunMo';
            src:
                url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/DungGeunMo.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        * {
            box-sizing: border-box;
            font-family: 'DungGeunMo';
        }

      /*   div{
            border: 1px solid black;
        } */
        body {
            overflow: hidden;
            overflow-y: auto;
            background-color: #03001e;
        }

        .container {
           /*  background-color: white; */
           
        }
		

        /* header */
        .header {
            height: 100px;
            background-color: #03001e;
            padding-bottom: 20px;
        }

        #logo,
        #titleimg {
            height: 100%;
        }

        #titleimg:hover {
            cursor: pointer;
        }

        @media (max-width :767px) {
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
            color: white;
        }

        #menuicon {
            position: relative;
            top: 8%;
        }

        #menuicon:hover {
            cursor: pointer;
        }

        #searchbtn {
            color: white;
        }

        /* comment */
      
      
      
      .boardtitle{
            padding-top: 30px;
        	background-color: #03001e;
         	color:white;
            font-size: xx-large;
            text-decoration: underline;
            padding-bottom: 30px;
      }

        #boardtitle{
            text-align: center;
        }
        
        #boardtitle>a:hover{
        color:white;
        }
        
        .content{
            background-color: #03001e;
            text-align: center;
        }

        .contentline{
            border-radius: 5px;
            background-color: white;
            border-top: 7px solid #7303c0;
            border-bottom: 7px solid #7303c0;
        }
      
      .theader>div{
         font-size: 20px;
      }

        .contentbtn {
            width: 100px;
            height: 30.8px;
        }
        .insertBoardContents{
        padding-right:10px;
        }
        
        .insertBoard{
        text-align:right;
        }

        .boardSearchList{
        	margin-top:30px;
        	margin-bottom:30px;
        }

        #boardSearchOption {
            width: 13%;
            height: 100%;
        }

		#boardSearchWord {
            width: 30%;
            height: 100%;
        }

        .titlelink {
            color: black;
        }

        .titlelink:hover {
            color: black;
            text-decoration: underline;
        }
        
        .boxheight{
            height: 40px;            
        }
        hr.hr{
        margin-top:4px;
        }
        .contentTitle{
        	overflow:hidden;
        	text-overflow:ellipsis;
        	white-space:nowrap;
        }
        #boardSearchbtn{
              text-align:left;
        }


        /* footer */
        .footer {
            padding-top: 50px;
            padding-bottom: 50px;
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

        .menulink:hover,
        #searchbtn:hover {
            color: #c4c4c4;
        }

        #colsebtn {
            border: none;
            color: white;
            background-color: #03001e;
        }

        #linksec {
            padding-top: 50px;
            ;
            padding-bottom: 50px;
            ;
        }

        #logoutsec {
            padding-top: 50px;
            ;
            padding-bottom: 50px;
            ;
        }

.navi>a{
color:black;
}
        a {
            color: white;
            text-decoration: none;
        }

        button {
            border: none;
            border-radius: 5px;
        }
    </style>
</head>

<body>
    <div class="container w-xl">
        <div class="row header">
            <div class="col-12 col-md-6 col-lg-7" id="logo">
                <img src="/img/title.png" id="titleimg">
            </div>
            <div class="col-9 col-md-5 col-lg-4 searchbox">
                <input type="text" class="searchboxin" id="searchtext" onkeyup="enterkey()" name="searchtext" />
                <i class="fa-solid fa-magnifying-glass searchboxin" id="searchbtn"></i>
            </div>
            <script>
                function enterkey() { //검색창에 마우스 올린 후 엔터 누르면 바로 넘어가게 만드는 함수
                    if (window.event.keyCode == 13) {
                        location.href = "/search.content?searchtext=" + $("#searchtext").val();
                    }
                };

                $("#titleimg").on("click", function () {
                    location.href = "/main";
                });


                $("#searchbtn").on("click", function () {
                    location.href = "/search.content?searchtext=" + $("#searchtext").val();

                });

            </script>
            <div class="col-3 col-md-1 col-lg-1 menuicon">
                <i class="fas fa-bars fa-2x" id="menuicon" data-bs-toggle="offcanvas"
                    data-bs-target="#offcanvasWithBothOptions" aria-controls="offcanvasWithBothOptions"></i>
            </div>
        </div>

        <div class="row boardtitle">
            <div class="col-12 p-0" id="boardtitle"> <a href="/boardList.board?cpage=1" >영화/드라마 게시판</a></div>
        </div>
        <div class="row content">
            <div class="col-12 contentline">
            <div class="col-12">
                <div class="row theader boxheight">
                    <div class="col-1 d-none d-lg-block p-0">카테고리</div>
                    <div class="col-5 col-lg-4 p-0">제목</div>
                    <div class="col-3 p-0">작성자</div>
                    <div class="col-3 p-0">작성일</div>
                    <div class="col-1 p-0">조회</div>
                    <hr class="hr">
                </div>
            </div>


            <c:choose>
                <c:when test="${not empty board}">
                    <c:forEach var="board" items="${board}">
                        <div class="col-12 boxheight">
                            <div class="row">
                                <div class="col-1 d-none d-lg-block  p-0">
                                    ${board.b_category}
                                </div>
                                <div class="col-5 col-lg-4 contentTitle p-0">
                                    <a href="/selectBoardContents.board?b_seq=${board.b_seq}">
                                        <div id="b_title" class="titlelink" style="height: 100%;">${board.b_title}</div>
                                        <script>
                                            $("#b_title").text($("#b_title").html());
                                        </script>
                                    </a>
                                </div>
                                <div class="col-3 contentWriter p-0">
                                    ${board.b_writer_nn}
                                </div>
                                <div class="col-3 contentWriteTime p-0">
                                    ${board.b_write_date}
                                </div>
                                <div class="col-1 contentViewCount p-0">
                                    ${board.b_view_count}
                                </div>
                                <hr class="hr">
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="col p-0">
                        <div class="row p-0">
                            <div style="font-family: 'DungGeunMo';">
                                출력할 글이 없습니다.
                            </div>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>

            <div class="row insertBoardContents">
                <div class="col-12 p-0 insertBoard">
                    <a href="/board/insertBoardContents.jsp">
                        <button type="button" class="contentbtn" id="insertBoardContentsBtn">글쓰기</button>
                    </a>
                </div>
            </div>

            <div class="navi" align="center">
                              ${navi }
            </div>
            <form action="/boardSearchList.board?cpage=1" method="post">
                <div class="row boardSearchList">
                    <div class="col-12 ">
                        <select id="boardSearchOption" name="boardSearchOption">
                            <option value="b_title">제목</option>
                            <option value="b_writer_nn">작성자</option>
                            <option value="b_content">내용</option>
                        </select>
                        <input type="text" id="boardSearchWord" name="boardSearchWord">
                        <button class="contentbtn" >검색</button>
                   		 <br>
                	</div>
                </div>
            </form>
        </div>
        </div>


        <div class="row footer">
            <div class="col-12 footerAtag">
                <a href="#">회사소개</a> &nbsp&nbsp<a href="#">고객센터</a> &nbsp&nbsp<a href="#">이용약관</a> &nbsp&nbsp<a
                    href="#">개인정보 처리방침</a>
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
                <span class="snsIcon"><i class="fa-brands fa-instagram fa-2xl"></i></span> <span class="snsIcon"><i
                        class="fa-brands fa-twitter fa-2xl"></i></span> <span class="snsIcon"> <i
                        class="fa-brands fa-facebook fa-2xl"></i>
                </span>
            </div>
        </div>
    </div>

    <c:choose>
        <c:when test="${loginID!=null && loginID!='admin123'}">
            <!-- 로그인 -->
            <div class="offcanvas offcanvas-end" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions"
                aria-labelledby="offcanvasWithBothOptionsLabel">
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
                    $("#logoutBtn").on("click", function () {
                        location.href = "/logout.member";
                    })
                </script>
            </div>
        </c:when>
        <c:when test="${loginID!=null && loginID == 'admin123'}">
            <!-- 관리자 -->
            <div class="offcanvas offcanvas-end" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions"
                aria-labelledby="offcanvasWithBothOptionsLabel">
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
                    $("#logoutBtn").on("click", function () {
                        location.href = "/logout.member";
                    })
                </script>
            </div>
        </c:when>
    </c:choose>
</body>

</html>