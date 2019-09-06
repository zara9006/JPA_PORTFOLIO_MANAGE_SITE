<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>서병주 포트폴리오</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700"
	rel="stylesheet">

<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css"
	rel="stylesheet">

<!-- Bootstrap  -->
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<!-- Theme style  -->
<link rel="stylesheet" href="/resources/css/project.css">
</head>

<body>
	<div id="colorlib-page">
		<div class="container-wrap">
			<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar"><i></i></a>
			<aside id="colorlib-aside" role="complementary"
				class="border js-fullheight">
				<div class="text-center">
					<div class="author-img"
						style="background-image: url(/resources/images/about.jpg);"></div>
					<span class="position">서 병 주</span>
				</div>
				<nav id="colorlib-main-menu" role="navigation" class="navbar">
					<div class="collapse">
						<ul>
							<li><a href="/">home</a></li>
							<span><strong>Manage Option</strong></span>
							<li class="active"><a href="/project">project</a></li>
							<li><a href="/develop">education</a></li>
							<li><a href="/education">develop</a></li>
						</ul>
					</div>
				</nav>

				<div class="colorlib-footer">
					<p>
						<small>&copy; <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright <script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved. <br> with me <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</span> <span>Blog <a href="https://zarawebstudy.tistory.com/"
								target="_blank">zarawebstudy</a></span> <span>Git hub : <a
								href="https://github.com/zara9006" target="_blank">github.com/zara9006</a></span></small>
					</p>
					<small><strong><a href="#">관리자 전환</a></strong></small>
					<form class="form-group" style="visibility: hidden;" method="POST"
						action="/login">
						<input type="password" class="form-control password-input"
							id="pwd"> <input type="submit"
							class="btn btn-primary btn-send-message" value="전환">
					</form>
				</div>
			</aside>
			<div id="container-manage">
				<div class="panel panel-default"
					style="margin-bottom: 15px; background-color: #f2f3f7">
					<div class="panel-body">
						<sapn style="font-size: 14pt; font-weight: bold;">Project
						Lists</sapn>
						<span style="float: right;"><button data-toggle="modal"
								data-target="#myModal">글쓰기</button></span>
					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-body">
						<div class="list-title">
							<strong>영화관 사이트 프로젝트</strong> <span class="span-remove">
								<button>수정</button>
								<button>삭제</button>
							</span>
						</div>
						<span class="category">Spring</span> <span class="likes">likes
							0</span> <span class="hits">hits 0</span> <span class="date">2019-08-28
							11:28</span>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="list-title">
							<strong>영화관 사이트 프로젝트</strong> <span class="span-remove">
								<button>수정</button>
								<button>삭제</button>
							</span>
						</div>
						<span class="category">Spring</span> <span class="likes">likes
							0</span> <span class="hits">hits 0</span> <span class="date">2019-08-28
							11:28</span>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="list-title">
							<strong>영화관 사이트 프로젝트</strong> <span class="span-remove">
								<button>수정</button>
								<button>삭제</button>
							</span>
						</div>
						<span class="category">Spring</span> <span class="likes">likes
							0</span> <span class="hits">hits 0</span> <span class="date">2019-08-28
							11:28</span>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="list-title">
							<strong>영화관 사이트 프로젝트</strong> <span class="span-remove">
								<button>수정</button>
								<button>삭제</button>
							</span>
						</div>
						<span class="category">Spring</span> <span class="likes">likes
							0</span> <span class="likes">hits 0</span> <span class="date">2019-08-28
							11:28</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog"
		style="margin-top: 100px;">
		<div class="modal-dialog" style="max-width: 100%; width: auto; display: table;">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<span style="font-size: 25pt;">Project Write</span>
					<button type="button" class="btn btn-default" data-dismiss="modal" style="float: right; margin-top:10px;">Close</button>
				</div>
				<div style="margin:2%;">
					<form action="/uploadProject" method="POST" enctype="multipart/form-data">
						<div class="form-group">
							<label for="usr">프로젝트명:</label> 
							<input type="text" class="form-control" id="title" name="title">
						</div>
						<div class="form-group">
							<label for="usr">메인사진:</label> 
							<input type="file" class="form-control-file" id="image" name="image">
						</div>
	
						<div class="form-group">
							<label for="usr">목적:</label> 
							<input type="text" class="form-control" id="goal" name="goal">
						</div>
						
						<div class="form-group">
							<label for="usr">기간:</label> 
							<input type="text" class="form-control" id="period" name="period">
						</div>
						
						<div class="form-group">
							<label for="usr">언어:</label> 
							<input type="text" class="form-control" id="language" name="language">
						</div>
						
						<div class="form-group">
							<label for="usr">환경:</label> 
							<input type="text" class="form-control" id="environment" name="environment">
						</div>
						
						<div class="form-group">
							<label for="usr">사용 라이브러리:</label> 
							<input type="text" class="form-control" id="library" name="library">
						</div>
						
						<div class="form-group">
							<label for="usr">담당:</label> 
							<input type="text" class="form-control" id="position" name="position">
						</div>
						
						<div>
							<label for="usr">기능 설명:</label>
							<div id="summernote"></div>
						</div>
						
						<div style="text-align: center; padding: 10px;">
							<input type="button" value="임시저장"/> <input type="submit" value="업로드"/>
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>


	<!-- jQuery -->
	<script src="/resources/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="/resources/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="/resources/js/bootstrap.min.js"></script>

	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
	<script>
		$().ready(function() {
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
				lang : 'ko-KR',
				callbacks : {
					onImageUpload : function(files, editor, welEditable) {
						sendFile(files[0], this);
					}
				}
			});

		});
	</script>
</body>

</html>