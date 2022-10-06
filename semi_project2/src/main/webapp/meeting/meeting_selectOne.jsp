<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>semi project meeting</title>
<link rel="stylesheet" href="css/meetingSelectOne.css" />
<script src="js/jquery-3.6.1.min.js"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
function enter_meeting(x) {
   
   $.ajax({
      type : "POST",
      url : "/semi_project/meeting_enter.do?meeting_id="+x,
      data : {
         
      },
      success : function(response) {
         
      }
   })

}
</script>
</head>
<body>

   <div id="bg">
      <img class="back" width="400" height="200" src="png/roundBg.png">
      <section id="meeting1">
         <table class="table_margin">
            <tbody>
               <p class="meetingProf">
                  <img width="100" alt="${vo2.image_url}"
                     src="upload/${vo2.image_url} " style="border-radius: 90%">
               </p>
               <tr>
                  <td class="lists"><b>${vo2.name}</b></td>
               </tr>
               <tr>
                  <td><a class="list">모임 지역: ${vo2.location}</a></td>
               </tr>
               <tr>
                  <td><a class="list">모임 연령대: ${vo2.age}</a></td>
               </tr>
               <tr>
                  <td><a class="list">개설일: ${vo2.creation_date}</a></td>
               </tr>
               <tr>
                  <td><a class="list">현재원: ${vo2.total_people}</a></td>
               </tr>
               <tr>
                  <td><a class="list">모임 성별: ${vo2.gender}</a></td>
               </tr>
               <tr>
                  <td><a class="list">모임 설명: ${vo2.explanation}</a></td>
               </tr>
            </tbody>
         </table>
         <div class="option">
            <hr style="opacity: 0.3">
            <p>가입조건</p>
            <p>닉네임표기</p>
         </div>
         <button onclick="enter_meeting(${vo2.meeting_id})">입장하기</button>
      </section>


   </div>

</body>
</html>