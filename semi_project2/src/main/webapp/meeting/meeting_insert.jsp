<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>semi project meeting</title>
<link rel="stylesheet" href="css/meetingInsert.css?after" />
<script src="js/jquery-3.6.1.min.js"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
   
</script>
</head>
<body>

   <div id="bg">
      <h1>모임 개설</h1>
      <form action="main_meeting_insertOK.do" method="post"
         enctype="multipart/form-data" class="container">
         <table>
            <tbody>
               <tr class="img">
                  <td><img src="png/img_0001.png" id="img"
                     style="border-radius: 90%" /></td>
                  <td><label class="input-file-button" for="input-file">
                        사진</label> <input type="file" id="input-file" name="upFile" /></td>
               </tr>
               <tr>
                  <td><input type="text" id="name"
                     placeholder="모임명을 입력하세요.(최대 15자)" name="name">
                     <hr></td>
               </tr>
               <tr>
                  <td><input type="text" name="explanation" id="explanation"
                     placeholder="모임에대한 소개글을 입력하세요.(최대 50자)" />
                     <hr></td>
               </tr>
               <tr>
                  <td class="open">공개여부 :<input type="radio" id="permission" name="permission"
                     value="true" /> 공개형<input type="radio" id="permission" name="permission"
                     value="false" /> 비공개형
                     <hr></td>
               </tr>
               <tr>
                  <td class="secret">가입 신청 받기 : <input type="radio"
                     name="secret" id="secret" value="true" /> 필요<input type="radio"
                     name="secret" id="secret" value="false" /> 필요없음
                     <hr></td>
               </tr>
               <tr>
                  <td style="font-size: 25px; opacity: 0.5;">지역 선택 <select
                     name="location" id="location">
                        <option>전국</option>
                        <option>서울</option>
                        <option>경기</option>
                        <option>인천</option>
                        <option>강원</option>
                        <option>충북</option>
                        <option>충남</option>
                        <option>전북</option>
                        <option>전남</option>
                        <option>경북</option>
                        <option>경남</option>
                        <option>제주</option>
                  </select>
                     <hr>
                  </td>
               </tr>
               <tr>
                  <td style="font-size: 25px; opacity: 0.5;">성별 <select
                     name="gender" id="gender">
                        <option>모두</option>
                        <option>남자</option>
                        <option>여자</option>
                  </select>
                     <hr>
                  </td>
               </tr>
               <tr>
                  <td style="font-size: 25px; opacity: 0.5;">나이 : <select
                     name="age" id="age">
                        <option>전체 연령</option>
                        <option>10대</option>
                        <option>20대</option>
                        <option>30대</option>
                        <option>40대</option>
                        <option>50대</option>
                        <option>60대</option>
                        <option>70대이상</option>
                  </select>
                  <hr>
                  </td>
               </tr>
               <tr>
                  <td style="font-size: 25px; opacity: 0.5;">평균 타수
                  <select name="handy" id="handy">
                        <option>60타</option>
                        <option>70타</option>
                        <option>80타</option>
                        <option>90타</option>
                        <option>100타</option>
                        <option>110타 이상</option>
                  </select>
                  <hr>
                  </td>
               </tr>
               <tr>
                  <td><input type="submit" value="개설완료" class="btn btn-primary"></td>
               </tr>
            </tbody>

         </table>
      </form>
   </div>
      <script>
      const nameForm = document.querySelector("#name");
      const explForm = document.querySelector("#explanation");
      const permissionForm = document.querySelector("#permission");
       const secretForm = document.querySelector("#secret");
      const locationForm = document.querySelector("#location");
      const genderForm = document.querySelector("#gender");
      const ageForm = document.querySelector("#age");
      const handyForm = document.querySelector("#handy");
      const loginBtn = document.querySelector(".btn-primary"); 

      const btnDefault = function() {
         loginBtn.disabled = true;
      };
      btnDefault();

      function activeEvent() {
         switch (!(nameForm.value 
               && explForm.value 
               && permissionForm.value 
               && secretForm.value 
               && locationForm.value
               && genderForm.value
               && ageForm.value
               && handyForm.value)) {
         case true:
            loginBtn.disabled = true;
            loginBtn.style.backgroundColor = "gray";
            loginBtn.style.color = "white";
            break;
         case false:
            loginBtn.disabled = false;
            loginBtn.style.backgroundColor = "dodgerblue";
            loginBtn.style.color = "white";
            loginBtn.style.border = "dodgerblue";
            break;
         }
      }

      nameForm.addEventListener("keyup", activeEvent);
      explForm.addEventListener("keyup", activeEvent);
      permissionForm.addEventListener("keyup", activeEvent);
      secretForm.addEventListener("keyup", activeEvent);
      locationForm.addEventListener("keyup", activeEvent);
      genderForm.addEventListener("keyup", activeEvent);
      ageForm.addEventListener("keyup", activeEvent);
      handyForm.addEventListener("keyup", activeEvent);
   </script>
</body>
</html>