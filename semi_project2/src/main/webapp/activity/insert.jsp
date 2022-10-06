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
<link rel="stylesheet" href="css/round_insert.css?after" />
<script src="js/jquery-3.6.1.min.js"></script>
<style>
li {
	list-style: none;
	position: relative;
}

li>img {
	border-radius: 10%;
	width: 100px;
}

.real-upload {
	display: none;
}

.upload {
	position: absolute;
	margin: 68px 0px 0px 240px;
	cursor: pointer;
}

.image-preview {
	width: 100px;
	height: 100px;
	margin: 10px 0px 0px 118px;
}

.input-margin {
	margin-top: 120px;
}

.input-margin>input {
	border: 0px;
	border-bottom: 1px solid #838383;
	width: 400px;
	font-family: 'Inter';
	font-style: normal;
	font-weight: 400;
	font-size: 20px;
	text-align: center;
	color: #838383;
	margin: 10px 0px 10px 0px;
}
</style>
</head>	
<body>
	<div id="bg">
		<div class="row">
			<div class="title" style="margin: 30px 140px 30px 140px;">액티비티
				개설</div>

			<form action="activity_insertOK.do?meeting_id=${meeting_id}" method="post" enctype="multipart/form-data">

				<div>
					<ul class="image-preview">
						<li><img alt="imgName" src="png/img_0001.png"></li>
					</ul>
					<input type="file" name="image_name" class="real-upload" accept="image/*" required multiple>
					<div class="upload">
						<img width="40" src="png/img_camera.png">
					</div>
				</div>
				<table style="margin-top: 100px;">
					<tr>
						<td><input type="text" name="name" id="name"
							placeholder="액티비티 이름을 입력하세요(최대15자)" />
							<hr /></td>
					</tr>
					<tr>
						<td><input type="text" name="explanation" id="name"
							placeholder="소개글을 입력하세요(최대50자)" />
							<hr /></td>
					</tr>
					<tr>
						<td style="font-size: 20px; opacity: 0.7">일정을 선택하세요<br /> <input
							type="date" id="activity_date" name="activity_date" /> <br />
							<hr />
						</td>
					</tr>
					<tr>
						<td style="font-size: 20px; opacity: 0.7">시간을 선택하세요<br /> <input
							type="time" id="activity_time" name="activity_time" /> <br />
							<hr />
						</td>
					</tr>
					<tr>
						<td style="font-size: 20px; opacity: 0.7; text-align: left">장소<select
							name="location" id="course">

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

						<td style="font-size: 20px; opacity: 0.7; text-align: left">모집인원
							<input type="number" name="total_people" id="total_people"
							placeholder="모집인원" />
						</td>
					</tr>
				</table>
				<input type="submit" id="btn" style="margin-top: 80px;" value="개설하기" />
			</form>



			<!-- 				<div class="input-margin"> -->
			<!-- 					<input type="text" name="name" value="액티비티명을 입력하세요."> <br> -->
			<!-- 					<input type="text" name="explanation" value="33"> <br> -->
			<!-- 					<input type="text" name="activity_date" value="33"> <br> -->
			<!-- 					<input type="text" name="activity_time" value="33"> <br> -->
			<!-- 					<input type="text" name="location" value="33"> <br> <input -->
			<!-- 						type="text" name="total_people" value="33"> <br> <input -->
			<!-- 						type="text" name="location" value="33"> <br> -->
			<!-- 				</div> -->
			<!-- 				<input type="submit"> -->


			<!-- 				</form> -->


		</div>


	</div>
</body>

<script>
    function getImageFiles(e) {
      const uploadFiles = [];
      const files = e.currentTarget.files;
      const imagePreview = document.querySelector('.image-preview');
      const docFrag = new DocumentFragment();

      if ([...files].length >= 2) {
        alert('이미지는 최대 1개 까지 업로드가 가능합니다.');
        return;
      }

      // 파일 타입 검사
      [...files].forEach(file => {
        if (!file.type.match("image/.*")) {
          alert('이미지 파일만 업로드가 가능합니다.');
          return
        }

        // 파일 갯수 검사
        if ([...files].length < 2) {
          uploadFiles.push(file);
          const reader = new FileReader();
          reader.onload = (e) => {
            const preview = createElement(e, file);
            imagePreview.appendChild(preview);
          };
          reader.readAsDataURL(file);
        }
      });
    }

    function createElement(e, file) {
   	  $('.image-preview').empty();
      const li = document.createElement('li');
      const img = document.createElement('img');
      img.setAttribute('src', e.target.result);
      img.setAttribute('data-file', file.name);
      li.appendChild(img);

      return li;
    }

    const realUpload = document.querySelector('.real-upload');
    const upload = document.querySelector('.upload');

    upload.addEventListener('click', () => realUpload.click());

    realUpload.addEventListener('change', getImageFiles);
  </script>

</html>
