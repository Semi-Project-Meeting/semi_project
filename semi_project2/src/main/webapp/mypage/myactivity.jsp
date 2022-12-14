<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>semi project myactivity</title>
<link rel="stylesheet" href="css/myactivity.css?after" />
<link rel="stylesheet" href="css/main.css" />
<script src="js/jquery-3.6.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<script>
	function activity_ongoing(x) {
		$('#myactivity_list').empty();
		$
				.ajax({
					type : 'GET',
					url : '/semi_project/myactivity_listOK.do?activityState='
							+ x,
					data : {},
					success : function(data) {
						console.log(data)
						let rows = JSON.parse(data);
						console.log(rows);
						for (let i = 0; i < rows.length; i++) {
							let location = rows[i]['location']
							let total_people = rows[i]['total_people']
							/* let activities = rows[i] */
							let activity_id = rows[i]['activity_id']
							let name = rows[i]['name']
							let activity_date = rows[i]['activity_date']
							let activity_time = rows[i]['activity_time']
							let current_people = rows[i]['current_people']
							let image_url = rows[i]['image_url']

							console.log(activity_id, name, location)

							let temp_html = '<table class="table_margin"><tr><td class="img_td" rowspan="5">'
									+ '<a href="activity_selectOne.do?activity_id='
									+ activity_id
									+ '">'
									+ '<img class="img_square" width="65px" alt="'+image_url+'" src="png/'+image_url+'">'
									+ '</a></td>'
									+ '<td><a class="lists" href="activity_selectOne.do?activity_id='
									+ activity_id
									+ '">'
									+ name
									+ '</a></td></tr>'
									+ '<tr><td><a class="list" href="activity_selectOne.do?activity_id='
									+ activity_id
									+ '">'
									+ activity_date
									+ " "
									+ activity_time
									+ '</a></td></tr>'
									+ '<tr><td><a class="list" href="activity_selectOne.do?activity_id='
									+ activity_id
									+ '">'
									+ location
									+ '</a></td></tr>'
									+ '<tr><td><a class="list" href="activity_selectOne.do?activity_id='
									+ activity_id
									+ '">'
									+ current_people
									+ "??? ?????????" + '</a></td></tr></table>'

							$('#myactivity_list').append(temp_html)
						}
					}
				})
	}
	sessionStorage.member_id = '${member_id}';
	console.log(sessionStorage.member_id);
</script>
<body>
	<div id="bg">
		<h3>???????????????</h3>
		<p id="profImg"></p>
		${member_name} <a href="m_update.do"><button id="memberUpdate">
				<b>????????? ??????</b>
			</button></a> <a href="logout.do"><button id="logout">
				<b>?????? ??????</b>
			</button></a>
		<div class="container" style="height: 700px;">
			<div id="navup">
				<ul>
					<li><a href="mymeeting_list.do">??????</a></li>
					<li><a
						style="color: skyblue; border-bottom: 1px solid skyblue">????????????</a></li>
					<!-- 				<li><a href="myrounding_list.do">?????????</a></li> -->
				</ul>
			</div>
			<br /> <br /> <br /> <select name="activitystate"
				id="activitystate" onchange="activity_ongoing(value)">
				<option>??????</option>
				<option value="?????????">?????????</option>
				<option value="?????????">?????????</option>
				<option value="?????????">?????????</option>
			</select> <br /> <br />

			<section id="myactivity_list"></section>

		</div>


		<jsp:include page="../main/default.jsp"></jsp:include>
	</div>
	<script>
		const mainBtn = document.getElementById("Addbtn");
		const mainModal = document.getElementById("navmodal");
		const logOut = document.getElementById("logout");

		//????????????
		function outing() {
			const result = confirm("???????????? ???????????????????");

			if (result) {
				function locationHref() {
					location.href = "logoutOK.do";
				}
			}
		}
		logOut.addEventListener("click", outing);

		//???????????? ?????????
		const showModal = function() {
			mainModal.classList.toggle("hidden");
		};

		mainBtn.addEventListener("click", showModal);

		//?????? ???????????????
		const images = [ "prof1.png", "prof2.png", "prof3.png" ];
		const body = document.querySelector("#profImg");

		const IMG_NUMBER = images.length;

		const chosenImg = images[Math.floor(Math.random() * images.length)];

		function chaPho(IMG_NUMBER) {
			const image = new Image();
			image.src = "png/" + chosenImg;
			image.classList.add("profImg");
			body.appendChild(image);
		}

		function inti() {
			chaPho(Math.floor(Math.random() * images.length));
		}
		inti();
	</script>
</body>
</html>
