<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<style>
.panel-heading {
	padding: 0;
}

.panel-heading a {
	padding: 20px 25px;
	display: block;
	width: 100%;
	font-weight: 500;
	font-size: 14px;
	letter-spacing: 1px;
	text-transform: uppercase;
	font-family: "Quicksand", Arial, sans-serif;
	background-color: #2c98f0;
	color: #fff;
	position: relative;
	-webkit-box-shadow: none !important;
	-moz-box-shadow: none !important;
	-ms-box-shadow: none !important;
	-o-box-shadow: none !important;
	box-shadow: none !important;
}

.panel {
	-webkit-box-shadow: none !important;
	-moz-box-shadow: none !important;
	-ms-box-shadow: none !important;
	-o-box-shadow: none !important;
	box-shadow: none !important;
	border: none;
}

.panel-heading a:after {
	font-family: "icomoon";
	content: "\e115";
	position: absolute;
	right: 20px;
	font-size: 14px;
	font-weight: 400;
	top: 50%;
	line-height: 1;
	margin-top: -7px;
}

.panel-heading a.collapsed:after {
	content: "\e114";
}

.panel-heading a.collapsed {
	background: #f2f3f7;
	border: 1px solid #e6e6e6 !important;
	color: #333333;
}

.panel-body {
	padding: 1.5em;
	margin-top: 5px;
	border: 1px solid #e6e6e6 !important;
}
@media screen and (max-width: 768px) {
	#colorlib-aside {
		width: 300px;
		-moz-transform: translateX(-300px);
		-webkit-transform: translateX(-300px);
		-ms-transform: translateX(-300px);
		-o-transform: translateX(-300px);
		transform: translateX(-300px);
		padding-top: 4em;
	}
	 #container-manage{
	      margin-left: 0px;
	      padding: 10px;
	  }
}
.colorlib-nav-toggle {
	cursor: pointer;
	text-decoration: none;
}

.colorlib-nav-toggle.active i::before, .colorlib-nav-toggle.active i::after
	{
	background: #000;
}

.colorlib-nav-toggle.dark.active i::before, .colorlib-nav-toggle.dark.active i::after
	{
	background: #000;
}

.colorlib-nav-toggle:hover, .colorlib-nav-toggle:focus,
	.colorlib-nav-toggle:active {
	outline: none;
	border-bottom: none !important;
}

.colorlib-nav-toggle i {
	position: relative;
	display: -moz-inline-stack;
	display: inline-block;
	zoom: 1;
	*display: inline;
	width: 30px;
	height: 2px;
	color: #000;
	font: bold 14px/.4 Helvetica;
	text-transform: uppercase;
	text-indent: -55px;
	background: #000;
	-webkit-transition: all .2s ease-out;
	-o-transition: all .2s ease-out;
	transition: all .2s ease-out;
}

.colorlib-nav-toggle i::before, .colorlib-nav-toggle i::after {
	content: '';
	width: 30px;
	height: 2px;
	background: #000;
	position: absolute;
	left: 0;
	-webkit-transition: 0.2s;
	-o-transition: 0.2s;
	transition: 0.2s;
}

.colorlib-nav-toggle.dark i {
	position: relative;
	color: #000;
	background: #000;
	-webkit-transition: all .2s ease-out;
	-o-transition: all .2s ease-out;
	transition: all .2s ease-out;
}

.colorlib-nav-toggle.dark i::before, .colorlib-nav-toggle.dark i::after
	{
	background: #000;
	-webkit-transition: 0.2s;
	-o-transition: 0.2s;
	transition: 0.2s;
}

.colorlib-nav-toggle i::before {
	top: -7px;
}

.colorlib-nav-toggle i::after {
	bottom: -7px;
}

.colorlib-nav-toggle:hover i::before {
	top: -10px;
}

.colorlib-nav-toggle:hover i::after {
	bottom: -10px;
}

.colorlib-nav-toggle.active i {
	background: transparent;
}

.colorlib-nav-toggle.active i::before {
	top: 0;
	-webkit-transform: rotateZ(45deg);
	-moz-transform: rotateZ(45deg);
	-ms-transform: rotateZ(45deg);
	-o-transform: rotateZ(45deg);
	transform: rotateZ(45deg);
}

.colorlib-nav-toggle.active i::after {
	bottom: 0;
	-webkit-transform: rotateZ(-45deg);
	-moz-transform: rotateZ(-45deg);
	-ms-transform: rotateZ(-45deg);
	-o-transform: rotateZ(-45deg);
	transform: rotateZ(-45deg);
}

.colorlib-nav-toggle {
	position: fixed;
	left: -5px;
	top: 0px;
	z-index: 9999;
	cursor: pointer;
	opacity: 1;
	visibility: hidden;
	padding: 20px;
	-webkit-transition: 0.5s;
	-o-transition: 0.5s;
	transition: 0.5s;
}

@media screen and (max-width: 768px) {
	.colorlib-nav-toggle {
		opacity: 1;
		visibility: visible;
	}
}
</style>
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
					<h1 id="colorlib-logo">
						<a href="index.html">Seo Byoung Ju</a>
					</h1>
					<span class="position">서 병 주</span>
				</div>
				<nav id="colorlib-main-menu" role="navigation" class="navbar">
					<div id="navbar" class="collapse">
						<ul>
							<li><a href="/">home</a></li>
							<span><strong>Manage Option</strong></span>
							<li><a href="/project">project</a></li>
							<li><a href="/education">education</a></li>
							<li class="active"><a href="/experience">experience</a></li>
							<li><a href="/aboutme">aboutme</a></li>
						</ul>
					</div>
				</nav>

				<div class="colorlib-footer">
					<p>
						<small>&copy; <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright <script>
								document.write(new Date().getFullYear());
							</script> All rights reserved. <br> with me <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
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
						<sapn style="font-size: 14pt; font-weight: bold;">Experience
						Lists</sapn>
						<span style="float: right;">
							<button onclick="getWritePage();" data-toggle="modal" data-target="#myModal">글쓰기</button>
						</span>
					</div>
				</div>

				<div class="panel-group" id="accordion" role="tablist"
					aria-multiselectable="true">
					<c:forEach var="e" items="${eList}">
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="heading${e.id}">
								<h4 class="panel-title">
									<a class="collapsed" data-toggle="collapse"
										data-parent="#accordion" href="#collapse${e.id}"
										aria-expanded="false" aria-controls="collapse${e.id}">${e.title}</a>
								</h4>
							</div>
							<div id="collapse${e.id}" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="heading${e.id}">
								<div class="panel-body">
									<div class="row">
										<div class="col-md-6">
											<p>${e.problem}</p>
										</div>
										<div class="col-md-6">
											<p>${e.solution}</p>
										</div>
									</div>
									<div>
										<span style="float: right;">
											<button onclick="getWritePage(${e.id});" data-toggle="modal" data-target="#myModal">수정</button> 
											<button onclick="location.href='/experience/delete/${e.id}'">삭제</button>
										</span>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>

			</div>
		</div>
	<!-- colorlib-page -->
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog"
		style="margin-top: 100px;">
		<div class="modal-dialog"
			style="max-width: 100%; width: 1000px; display: table;">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<span style="font-size: 25pt;">Experience Write</span>
					<button type="button" class="btn btn-default" data-dismiss="modal"
						style="float: right; margin-top: 10px;">Close</button>
				</div>

				<div id="formDiv" style="margin: 2%;">
					
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
	
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

	<script type="text/javascript">
		function getWritePage(id=null){
			$.ajax({
				type:"get",
				url:"/experiencewrite",
				data:{"id":id},
				success:function(data){
					$('#formDiv').html(data);
				}
			});
		}
	</script>

</body>

</html>