<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>semi project main</title>

<link rel="stylesheet" href="css/search.css" />
<link rel="stylesheet" href="css/default.css" />
<link rel="stylesheet" href="css/roundResearch.css?after" />
</head>
<script src="../js/jquery-3.6.1.min.js"></script>
</head>
<body>
   <div id="bg">
      <div id="nav">
         <img src="png/golfzonlogo.png" id="logo" />
      </div>
      <div class="container" style="height: 780px;">
         <form action="main_round_searchListOK.do" method="get" style="margin-top: 50px;">

            <a href="javascript:window.history.back();"><button>←</button></a> <input
               style="text-indent: 10px;" type="text" name="searchWord"
               id="searchWord" placeholder="🔍라운드 검색"> <input
               id="searchBtn" type="submit" value="검색"> <br>

            <div id="nav">
               <br>
               <ul>
                  <li id="round"><a href="main_round_searchList.do"
                     style="color: skyblue; border-bottom: skyblue">라운드</a></li>
                  <li id="meeting"><a href="main_meeting_searchList.do"
                     style="color: gray; border-bottom: 1px solid gray">모임</a></li>
               </ul>
            </div>

            <hr>
            <!--             <div> -->
            <!--                <select name="location" id="location"><br> -->
            <!--                   <option value="전국">전국</option> -->
            <!--                   <option value="서울">서울</option> -->
            <!--                   <option value="경기">경기</option> -->
            <!--                   <option value="충남">충남</option> -->
            <!--                   <option value="강원">강원</option> -->
            <!--                   <option value="제주">제주</option> -->
            <!--                </select> <select name="gender" id="gender"><br> -->
            <!--                   <option value="성별">성별</option> -->
            <!--                   <option value="남">남</option> -->
            <!--                   <option value="여">여</option> -->
            <!--                </select> <select name="age" id="age"> -->
            <!--                   <option value="전체 연령">전체 연령</option> -->
            <!--                   <option value="10대">10대</option> -->
            <!--                   <option value="20대">20대</option> -->
            <!--                   <option value="30대">30대</option> -->
            <!--                   <option value="40대">40대</option> -->
            <!--                   <option value="50대">50대</option> -->
            <!--                   <option value="60대">60대</option> -->
            <!--                   <option value="70대이상">70대이상</option> -->
            <!--                </select> -->
            <!--             </div> -->

         </form>
         <!-- el 태그로 받는다.  var 변수로 객체변수 설정. -->
         <c:forEach var="vo" items="${vos}">
            <section id="round_searchList">
               <ul>
                  <li><a href="round_selectOne.do?round_id=${vo.round_id}">
                        <!-- 대체로 더미 이미지 (prof1) 붙임  --> 
                  <img alt="${vo.image_url}" src="upload/${vo.image_url}" width="110px" height="110px" style="margin-right:20px;">
                  </a></li>
                  <li><b>${vo.name}</b></li>
                  <li>${vo.course}</li>
                  <li>${vo.round_date}</li>
                  <li>총원 ${vo.total_people}명</li>
                  <li>현재 참가 인원: ${vo.current_people}명</li>
               </ul>
            </section>
         </c:forEach>

      </div>

      <jsp:include page="../main/default.jsp"></jsp:include>
   </div>
</body>


</html>