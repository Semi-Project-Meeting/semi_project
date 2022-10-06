<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/signupstyle.css?after" />
<link rel="stylesheet" href="css/style.css?after">
<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<title>semi project signup</title>
<script>
	window.onload = function() {
		console.log("onload....");
		let btn_idCheck = document.querySelector("#btn_idCheck");
		let btn_nickCheck = document.querySelector("#btn_nickCheck");

		let txt_id = document.querySelector("#txt_id");
		let txt_nickname = document.querySelector("#txt_nickname");
		//   let result = document.querySelector("#result");
		// console.log(result);

		btn_nickCheck.onclick = function(event) {
			console.log("onclick....");
			let nick = document.querySelector("#nick");
			// console.log(id);
			console.log(nick.value);

			let req = new XMLHttpRequest();

			req.addEventListener("load", function() {
				console.log(this.status);
				console.log(this.responseText);
				//{"result":"Not OK"}
				if (this.status == 200) {
					try {
						let txt_json = this.responseText;
						let obj_json = JSON.parse(txt_json);
						console.log(obj_json);
						console.log(obj_json.result);

						let txt = "";
						if (obj_json.result === "Not OK") {
							txt = "사용불가";
						} else {
							txt = "사용가능";
						}
						btn_nickCheck.innerHTML = txt;
						setTimeout(() => btn_nickCheck.innerHTML = "중복체크", 3000);
					} catch (e) {
						console.log("json 형식이 아님.");
					}
				} //end if
			});

			req.open("GET",
					"http://localhost:8090/semi_project/json_nickCheck.do?nick="
							+ nick.value);
			req.send();

			event.preventDefault();
			event.stopPropagation();
		};

		btn_idCheck.onclick = function(event) {
			console.log("onclick....");
			let id = document.querySelector("#id");
			// console.log(id);
			console.log(id.value);

			let req = new XMLHttpRequest();

			req.addEventListener("load", function() {
				console.log(this.status);
				console.log(this.responseText);
				//{"result":"Not OK"}
				if (this.status == 200) {
					try {
						let txt_json = this.responseText;
						let obj_json = JSON.parse(txt_json);
						console.log(obj_json);
						console.log(obj_json.result);

						let txt = "";
						if (obj_json.result === "Not OK") {
							txt = "사용불가";
						} else {
							txt = "사용가능";
						}
						btn_idCheck.innerHTML = txt;
						setTimeout(() => btn_idCheck.innerHTML = "중복체크", 3000);
					} catch (e) {
						console.log("json 형식이 아님.");
					}
				} //end if
			});

			req.open("GET",
					"http://localhost:8090/semi_project/json_idCheck.do?id="
							+ id.value);
			req.send();

			event.preventDefault();
			event.stopPropagation();
		};
	};
</script>
</head>
<body>
	<img src="png/golfzon.png"
		style="float: left; margin-left: 120px; margin-bottom: 5px; width: 180px; height: 80px;" />
	<div>


		<form action="m_insertOK.do" method="post"
			enctype="multipart/form-data">

			<p>
				<input type="text" name="nick" id="nick" placeholder="닉네임을 입력하세요"
					style="float:left; width: 230px; height: 50px; font-size: 20px;" />
				<button id="btn_nickCheck"
					style="margin-top: 10px; width: 80px; height: 30px; font-size: 13px; background-color:#00CED1; border: 0px solid blue;">중복체크</button>
			</p>
			<br>
			<p id="txt_nickname" style="margin-top: 0px; font-size: 10px;"></p>
			<p>
				<input type="text" type="text" name="id" id="id"
					placeholder="아이디를 입력하세요"
					style="width: 230px; height: 50px; font-size: 20px;" />
				<button id="btn_idCheck"
					style="margin-top: 10px; width: 80px; height: 30px; font-size: 13px; background-color:#00CED1; border: 0px solid blue;">중복체크</button>
			</p>
			<br>
			<p id="txt_id" style="margin-top: 0px; font-size: 10px;"></p>

			<p style="margin-top: 2px;">
				<b>영문과 숫자,일부 특수문자(._-)사용가능,2~10자 길이</b>
			</p>

			<p>
				<input id="pw" type="password" name="pw" placeholder="비밀번호를 입력하세요"
					style="width: 230px; height: 50px; font-size: 20px;"> <br>
			</p>
			<br>
			<!-- <p style="margin-top: 2px; float: left;">영문과 숫자 필수 포함, 특수문자
				사용가능, 8자 길이</p> -->

			<input id="pwc" type="password" name="pwc" placeholder="비밀번호를 확인해주세요"
				style="width: 230px; height: 50px; font-size: 20px;"> 
				
			<label
				for="age" style="margin-top: 20px; width: 230px; height: 50px; font-size: 20px;">나이를
				선택해주세요:</label> <select class="selectpicker" style="margin-top: 20px; height: 30px" name="age"
				id="age">
				<option>10대</option>
				<option>20대</option>
				<option>30대</option>
				<option>40대</option>
				<option>50대</option>
				<option>60대</option>
				<option>70대 이상</option>
			</select>

			<label
				for="handy" style="width: 230px; height: 50px; font-size: 20px;">평균 타수를 선택해주세요:</label> 
				<select name="handy" id="handy" class="selectpicker" style="margin-top: 2px; height: 30px">
				<option>60타</option>
				<option>70타</option>
				<option>80타</option>
				<option>90타</option>
				<option>100타</option>
				<option>110타 이상</option>
			</select>
			
			<label for="loc" style="width: 230px; height: 50px; font-size: 20px;">지역을 선택해주세요:</label> 
			<select class="selectpicker" style="margin-top: 2px; height: 30px" name="loc" id="loc">
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
			<label for="loc" style="width: 230px; height: 50px; font-size: 20px;">성별을 선택해주세요:</label> 
			<select class="selectpicker" style="margin-top: 2px; height: 30px"
				name="gender" id="gender">
				<option>남자</option>
				<option>여자</option>
			</select>
			<button style="float : center; margin-top: 50px; width: 300px; height: 40px;background-color: dodgerblue; border: 0px solid blue; font-size:20px" 
			type="submit" id="insert">가입완료</button>

		</form>
	</div>
</body>
</html>