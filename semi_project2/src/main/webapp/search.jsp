<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>semi project main</title>

<link rel="stylesheet" href="css/search.css?after">
</head>
<script src="../js/jquery-3.6.1.min.js"></script>
</head>
<body>
	<div id="bg">
		<div id="navlogo">
			<img src="png/golfzonlogo.png" id ="logo" />
		</div>
		<div style="margin-top: 100px;">
			<form action="main_meeting_searchListOK.do" method="get">
				<table>
					<a href="javascript:window.history.back();"><button>β</button></a>
					<input type="text" name="searchWord" id="searchWord"
							value="πλΌμ΄λ/λͺ¨μ κ²μ"> <input id="searchBtn" type="submit" value="κ²μ"><br>
	
					<div id="nav">
						<br>
						<ul>
							<li id="round"><a href="main_round_selectAll.do" style="color: gray; border-bottom:gray">λΌμ΄λ</a></li>
							<li id="meeting"><a href="main_meeting_selectAll.do" style="color: gray; border-bottom:gray">λͺ¨μ</a> </li>
						</ul>
					</div>
					
					<hr>
					<div>
						
					</div>
					<div  class="container">
			<section  id="round_searchList">
					<!-- el νκ·Έλ‘ λ°λλ€.  var λ³μλ‘ κ°μ²΄λ³μ μ€μ . -->
					<c:forEach var="vo" items="${vos}"> 
						
					</c:forEach>
			</section> 
		</div>
					
			</form>
		</div>
		<div id="navmodal" class="hidden">
            <li>
                <a href="m_meetingCreate.do">
                    <img src="png/meetingCreate.png" id="meetingCreate" /><br /><b>λͺ¨μ κ°μ€νκΈ°</b>
                </a>
            </li>
            <li>
                <a href="r_roundCreate.do">
                    <img src="png/roundCreate.png" id="roundCreate" /><br /><b>λΌμ΄λ κ°μ€νκΈ°</b> 
                </a>
            </li>

      </div>

      <div id="navmain">
        <li>
          <a href="h_home.do"
            ><img src="png/homeIcon.png" id="homeIcon" /><br />ν</a
          >
        </li>
        <li>
          <a href="s_search.do"
            ><img src="png/search.png" id="search" /><br />κ²μ</a
          >
        </li>
        <li>
          <img src="png/mainAddBtn.png" id="Addbtn" />
        </li>
        <li>
          <a href="n_notice.do"><img src="png/bell.png" id="bell" /><br />μλ¦Ό</a>
        </li>
        <li>
          <a href="mypage/mypage.jsp"
            ><img src="png/mypage.png" id="mypage" /><br />λ§μ΄νμ΄μ§</a
          >
        </li>
      </div>
    </div>
    <script>
        const mainBtn = document.getElementById("Addbtn");
        const mainModal = document.getElementById("navmodal")

        const showModal = function (){
            mainModal.classList.toggle('hidden')
        }

        mainBtn.addEventListener('click',showModal)
    </script>
</body>
</html>