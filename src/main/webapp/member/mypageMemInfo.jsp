<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정 페이지</title>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css">
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script
   src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
@font-face {
   font-family: 'DungGeunMo';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/DungGeunMo.woff')
      format('woff');
   font-weight: normal;
   font-style: normal;
}

* {
   box-sizing: border-box;
   /*    font-family: 'DungGeunMo'; */
   color: black;
   margin: auto;
}

body {
   background-color: #03001e;
}

.modifyForm {
   float: left;
   margin: auto;
   display: inline-block;
   text-align: center;
   width: 460px;
   background-color: white;
   border-radius: 7px;
}

input {
   width: 400px;
   height: 30px;
}

#email {
   width: 200px;
}

.selectOption {
   height: 30px;
   width: 175px;
   text-align: center;
}

.requiredField {
   color: red;
}

#result, #duplResult {
   margin: 0;
   font-family: 'DungGeunMo';
   
   
}

.id, .logo, .nickname, .pw, .pwcheck, .name, .phone, .email, .postcode,
   .address1, .address2, .margin_top, #result, #duplResultID,
   #duplResultNickname {
   margin: 15px 0;
}

.container {
   margin: auto;
   display: flex;
   overflow: hidden;
   background-color: #03001e;
}

.logo {
   font-weight: bold;
   margin: 40px 0;
}

.footer {
   margin-top: 10px;
   padding-bottom: 10px;
   text-align: center;
}

#duplCheckID, #duplCheckNickname {
   width: 100px;
}

.btns button {
   height: 30px;
   width: 92px;
}

.footer {
   margin: auto;
}

.btns {
   width: 100%;
   margin-top: 10px;
   text-align: center;
}

.btn {
   width: 100px;
}
/* div {
   border: 1px solid black;
} */
.dongfont {
   font-family: 'DungGeunMo';
}
</style>
<script>
   $(function() {
      //    window.onload와 같다
      $("#modify").on("click", function() {
         $("#nickname").removeAttr("disabled");
         $("#pw").removeAttr("disabled");
         $("#checkpw").removeAttr("disabled");
         $("#name").removeAttr("disabled");
         $("#phone").removeAttr("disabled");
         $("#email").removeAttr("disabled");
         $("#postcode").removeAttr("disabled");
         $("#address1").removeAttr("disabled");
         $("#address2").removeAttr("disabled");
         $("#btnsearch").removeAttr("disabled");
         $("#emailAddress").removeAttr("disabled");

         $("#modify").css("display", "none");
         let btnModify = $("<button>");
         btnModify.text("수정완료");
         btnModify.addClass("btn")
         btnModify.css("width", "100px");
         btnModify.css("font-family", "'DungGeunMo'");
         /* btnModify.css("margin-right", "5px") */
         let btnCancel = $("<button>");
         btnCancel.attr("type", "button");
         btnCancel.text("취소");
         btnCancel.addClass("btn");
         btnCancel.css("width", "100px");
         btnCancel.css("font-family", "'DungGeunMo'");
         btnCancel.on("click", function() {
            location.reload();
         });
         $(".btns").append(btnModify);
         $(".btns").append(" ");
         $(".btns").append(btnCancel);
      })
   })
</script>
</head>

<body>
   <form action="/updateMemInfo.member" method="post" id="frm">
      <div class="container mypage col-12" style="min-width: 350px;">
         <div class="modifyForm col-12">
            <div class="logo dongfont">회원정보수정</div>
            <div class="id col-12">
               <span class="dongfont">아이디<span class="requiredField">*<span></span>
                     <div class="margin_top col-12">
                        <input type="text" name="id" id="id" value="${dto.id }" disabled>
                        <div id="duplResultID"></div>
                     </div>
            </div>
            <div class="nickname col-12">
               <span class="dongfont">닉네임<span class="requiredField">*<span></span>
                     <div class="margin_top col-12">
                        <input type="text" name="nickname" id="nickname" maxlength="9"
                           placeholder="2~8자 영문 대 소문자,한글" disabled value="${dto.nickname}">
                        <div id="duplResultNickname"></div>
                     </div>
            </div>
            <div class="pw col-12">
               <span class="dongfont">패스워드<span class="requiredField">*<span></span>
                     <div class="margin_top col-12">
                        <input type="password" name="pw" id="pw" maxlength="16"
                           placeholder="8~16자 영문 대 소문자,숫자,특수문자(~!@#$%)" disabled>
                     </div>
            </div>
            <div class="pwcheck col-12">
               <span class="dongfont">패스워드 확인</span>
               <div class="margin_top col-12">
                  <input type="password" id="checkpw" disabled maxlength="16">
                  <div id="result"></div>
               </div>
            </div>
            <div class="name col-12">
               <span class="dongfont">이름<span class="requiredField">*<span></span>
                     <div class="margin_top col-12">
                        <input type="text"  name="name" id="name" placeholder="2~5자 한글"
                        maxlength="5"
                           value="${dto.name}" disabled >
                     </div>
            </div>
            <div class="phone col-12">
               <span class="dongfont">전화번호<span class="requiredField">*<span></span>
                     <div class="margin_top col-12">
                        <input type="text" maxlength="11" name="phone" id="phone" placeholder="숫자만 입력"
                           value="${dto.phone}" disabled>
                     </div>
            </div>
            <div class="email col-12">
               <span class="dongfont">이메일<span class="requiredField">*<span></span>
                     <div class="margin_top col-12">
                        <input type="text" name="email" id="email" maxlength="20"
                           placeholder="영어 대 소문자, 숫자" value="${dto.email}" disabled>
                        @ <select id="emailAddress" name="emailAddress"
                           class="selectOption" disabled>
                           <option value="gmail.com">gmail.com</option>
                           <option value="naver.com">naver.com</option>
                           <option value="hanmail.net">hanmail.net</option>
                           <option value="nate.com">nate.com</option>
                        </select>
                     </div>
            </div>
            <div class="postcode col-12">
               <div class="col-12">
                  <span class="dongfont">우편번호</span>&nbsp&nbsp<input type="button" 
                     onclick="postcode()" value="우편번호 찾기" id="btnsearch"
                     style="width: 100px;" disabled>
               </div>
               <div class="margin_top col-12">
                  <input type="text" name="postcode" id="postcode" maxlength="7" 
                     placeholder="우편번호" value="${dto.postcode}" disabled>
               </div>
            </div>
            <div class="address1 col-12">
               <span class="dongfont">주소</span>
               <div class="margin_top col-12">
                  <input type="text" name="address1" id="address1" placeholder="주소" maxlength="65"
                     value="${dto.address1}" disabled>
               </div>
            </div>
            <div class="address2 col-12">
               <span class="dongfont">상세주소</span>
               <div class="margin_top col-12">
                  <input type="text" name="address2" id="address2" maxlength="65"
                     placeholder="상세주소" value="${dto.address2}" disabled>
               </div>
            </div>
            <div class="footer col-12">
               <div class="btns">
                  <input type="button" class="btn dongfont" id="modify" value="수정하기">
                  <a href="/member/mypage.jsp"><input type="button"
                     class="btn dongfont" id="back" value="마이페이지"></a>
               </div>
            </div>

         </div>
      </div>
      </div>

   </form>
   <script>
      // 우편번호
      $("#btnsearch")
            .on(
                  "click",
                  function() {
                     new daum.Postcode(
                           {
                              oncomplete : function(data) {
                                 document.getElementById('postcode').value = data.zonecode;
                                 document.getElementById("address1").value = data.jibunAddress;
                              }
                           }).open();
                  })
      $("#pw,#checkpw").on("input", function() {
         if (!($("#pw").val() == $("#checkpw").val())) {
            $("#result").text("패스워드가 일치하지 않습니다.");
            $("#result").css("color", "red");
            pwCheck = false;
         } else {
            $("#result").text("패스워드가 일치합니다.");
            $("#result").css("color", "green");
            pwCheck = true;
         }
      })

      $("#nickname").on("input", function() {
         nicknameCheck = false;
         let nickname = $("#nickname").val();
         $.ajax({
            url : "/nicknameDuplCheck.member",
            data : {
               "nickname" : nickname
            }
         }).done(function(resp) {
            if (resp == "true") { // 닉네임이 이미 존재하므로 사용할 수 없는 경우
               $("#duplResultNickname").html("중복된 닉네임입니다.");
               $("#duplResultNickname").css("color", "red");
               nicknameCheck = false;
            } else { // 닉네임이 존재하지 않으므로 사용할 수 있는 경우
               $("#duplResultNickname").html("중복되지 않은 닉네임입니다.");
               $("#duplResultNickname").css("color", "green");
               nicknameCheck = true;
            }
         })
      })
      $("#frm").on(
            "submit",
            function() {

               if ($("#pw").val() == ""
                     || $("#name").val() == ""
                     || $("#nickname").val() == ""
                     || $("#phone").val() == ""
                     || $("#email").val() == "") {
                  alert("패스워드, 이름, 닉네임, 전화번호, 이메일은 필수입력값입니다.");
                  return false;
               }

               if (!nicknameCheck) {
                  alert("닉네임 중복체크를 먼저 수행해주세요.");
                  return false;
               }
               if (!pwCheck) {
                  alert("두 패스워드가 일치하지 않습니다.");
                  return false;
               }
               let nicknameRegex = /^[가-힣a-zA-Z]{2,8}$/; //2~8자 한글만 가능
               let pwRegex = /^[A-Za-z0-9~!@#$%]{8,20}$/; //8~20자 영문 대 소문자, 숫자, 특수문자(~!^*&)를 사용
               let nameRegex = /^[가-힣]{2,5}$/; // 한글 2~5자
               let phoneRegex = /^01\d\d{3,4}\d{4}$/; //010으로 시작하고 숫자만 입력
               let emailRegex = /^[a-zA-Z0-9]{1,20}$/; //숫자,영어 대 소문자 가능
               if ($("#nickname").val() != "") {
                  if (!nicknameRegex.test($("#nickname").val())) {
                     alert("닉네임 형식을 확인해주세요.");
                     return false;
                  }
               }
               if ($("#pw").val() != "") {
                  if (!pwRegex.test($("#pw").val())) {
                     alert("패스워드 형식을 확인해주세요.");
                     return false;
                  }
               }
               if ($("#name").val() != "") {
                  if (!nameRegex.test($("#name").val())) {
                     alert("이름 형식을 확인해주세요.");
                     return false;
                  }
               }
               if ($("#phone").val() != "") {
                  if (!phoneRegex.test($("#phone").val())) {
                     alert("전화번호 형식을 확인해주세요.");
                     return false;
                  }
               }
               if ($("#email").val() != "") {
                  if (!emailRegex.test($("#email").val())) {
                     alert("이메일 형식을 확인해주세요.");
                     return false;
                  }
               }
            })
   </script>
</body>

</html>