<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>semi project meeting</title>
<link rel="stylesheet" href="css/myactivity.css?after" />
<link rel="stylesheet" href="css/main.css" />
<script src="js/jquery-3.6.1.min.js"></script>
<script>
	console.log("sessionStorage:", sessionStorage.member_id);

	$(function() {
		console.log("ready...");
		activity_ongoing("활동중");

	});
	

	function href_link() {
		var link = "meeting_selectOne.do?meeting_id="
				+document.location.href.split("=")[1];
		location.href = link;
	}

	//남자일 경우에
	function activity_ongoing(x) {
		$('#activity_list').empty();
		$
				.ajax({
					type : 'GET',
					url : '/semi_project/meeting_activity_selectAll.do?activityState='
							+ x +'&meeting_id='+ document.location.href.split("=")[1],
					data : {},
					success : function(data) {
						console.log(data)
						let rows = JSON.parse(data);
						console.log(rows);
						if (rows.length == 0) {
							console.log(rows.length);
							let temp_img = '<img width="250px" alt="image_url" src="upload/no_activity.png">'
									+ '<p class="lists" style="margin-left: 86px;">해당하는 액티비티가 없습니다.</p>'
							$('#activity_list').append(temp_img)
						} else {
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
										+ '<img class="img_square" width="65px" alt="'+image_url+'" src="upload/'+image_url+'">'
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
										+ "명 참여중" + '</a></td></tr></table>'

								$('#activity_list').append(temp_html)
							}
						}

					}
				})
	}
</script>
</head>


<body>
	<div id="bg">
		<div id="navup">
			<ul>
				<li><a onclick="href_link()">액티비티</a></li>
				<!-- <li><a class="activity_link" href="meeting_selectOne.do?meeting_id=">액티비티</a></li> -->
				<li><a href="b_board.do">게시판</a></li>
				<li><a href="v_vote.do">투표</a></li>
				<li><a href="a_album.do">앨범</a></li>
			</ul>
		</div>

		<br /> <br /> <br />
		<div class="container">
			<div class="display-flex">
				<select name="activitystate" onchange="activity_ongoing(value)">
					<option value="활동중">활동중</option>
					<option value="활동전">활동전</option>
					<option value="활동후">활동후</option>
				</select>
				<button type="button" style="margin-left: 180px; cursor: pointer;"
					onclick="location.href='activity_insert.do?meeting_id='+${vo2.meeting_id}">개설하기</button>
			</div>

			<section id="activity_list" style="margin-top: 15px;"></section>
		</div>
		<jsp:include page="../main/default.jsp"></jsp:include>
	</div>

</body>
</html>