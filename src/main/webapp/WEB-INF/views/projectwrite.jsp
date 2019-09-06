<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<!-- include summernote css/js -->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<title>Document</title>
</head>

<body>
	

	<div style="margin-right: 25%; margin-left: 25%;">
		<div class="form-group">
			<label for="usr">프로젝트명:</label> 
			<input type="text" class="form-control" id="title">
		</div>
		<div class="form-group">
			<label for="usr">메인사진:</label> 
			<input type="file" class="form-control-file" id="mainImage">
		</div>

		<div class="form-group">
			<label for="usr">설명:</label> <input type="text"
				class="form-control" id="simpleContent">
		</div>

		<div class="form-group">
			<label for="usr">목적:</label> <input type="text" class="form-control"
				id="usr">
		</div>
		<div class="form-group">
			<label for="usr">기간:</label> <input type="text" class="form-control"
				id="usr">
		</div>
		<div class="form-group">
			<label for="usr">언어:</label> <input type="text" class="form-control"
				id="usr">
		</div>
		<div class="form-group">
			<label for="usr">환경:</label> <input type="text" class="form-control"
				id="usr">
		</div>
		<div class="form-group">
			<label for="usr">사용 라이브러리:</label> <input type="text"
				class="form-control" id="usr">
		</div>
		<div class="form-group">
			<label for="usr">담당:</label> <input type="text" class="form-control"
				id="usr">
		</div>

		<div>
			<label for="usr">기능 설명:</label>
			<div id="summernote">
			</div>
		</div>
	</div>

	<!-- jQuery -->
    <script src="/resources/js/jquery.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
	<script>
		$().ready(function(){			
			function sendFile(file, editor) {
				var data = new FormData();
				data.append('image', file);
				$.ajax({
					data : data,
					type : "POST",
					url : '/uploadimage',
					cache : false,
					contentType : false,
					enctype : 'multipart/form-data',
					processData : false,
					success : function(data) {
						$(editor).summernote('editor.insertImage', data);
					}
				});
			}
			$('#summernote').summernote({
				height : 400,
				lang: 'ko-KR',
				callbacks:{
					onImageUpload : function(files, editor, welEditable) {
						sendFile(files[0], this);
					}
				}
			});
		
		});
	</script>
</body>
</html>