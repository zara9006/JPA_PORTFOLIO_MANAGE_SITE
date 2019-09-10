<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>서병주 포트폴리오</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700" rel="stylesheet">
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<!-- Bootstrap  -->
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<!-- Theme style  -->
<link rel="stylesheet" href="/resources/css/project.css">
<link rel="stylesheet" href="/resources/css/icomoon.css">
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
							<li><a href="/project">project</a></li>
							<li class="active"><a href="/education">education</a></li>
							<li><a href="/experience">experience</a></li>
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
						<sapn style="font-size: 14pt; font-weight: bold;">Education Lists</sapn>
						<span style="float: right;">
							<button onclick="getWritePage();" data-toggle="modal" data-target="#myModal">글쓰기</button>
						</span>
					</div>
				</div>
				
				<c:forEach var="ed" items="${edList}" varStatus="status">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="list-title">
								<strong>${ed.schoolName}</strong> <span style="color: #ec5621;">${ed.period}</span>
								<span class="span-remove">
									<c:if test="${prev != null}">
										<button prev_seq="${prev}"><i class="icon-arrow-up-thick"></i></button>
									</c:if>
									<c:if test="${not status.last}">
										<button next_seq="${edList[status.index + 1].id}"><i class="icon-arrow-down-thick"></i></button>
									</c:if>
									<button onclick="getWritePage(${ed.id});" data-toggle="modal" data-target="#myModal">수정</button>
									<button onclick="location.href='/education/delete/${ed.id}'">삭제</button>
								</span>
							</div>
							<div style="margin-top:15px;">
								${ed.content}
							</div>
						</div>
					</div>
					<c:set var="prev" value="${ed.id}"></c:set>
				</c:forEach>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog"
		style="margin-top: 100px;">
		<div class="modal-dialog"
			style="max-width: 100%; width: auto; display: table;">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<span style="font-size: 25pt;">Education Write</span>
					<button type="button" class="btn btn-default" data-dismiss="modal" style="float: right; margin-top: 10px;">Close</button>
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
				url:"/educationwrite",
				data:{"id":id},
				success:function(data){
					$('#formDiv').html(data);
				}
			});
		}
	</script>
</body>

</html>