<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.0/css/swiper.min.css">
<!-- Bootstrap -->
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<!-- Theme style  -->
<link rel="stylesheet" href="/resources/css/project.css">
<link rel="stylesheet" href="/resources/css/icomoon.css">
<style>
#book_list {
	height: 500px;
	overflow: auto;
}

.swiper-container {
	width: 100%;
	height: 320px;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
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
					<span class="position">서 병 주</span>
				</div>
				<nav id="colorlib-main-menu" role="navigation" class="navbar">
					<div class="collapse">
						<ul>
							<li><a href="/">home</a></li>
							<span><strong>Manage Option</strong></span>
							<li><a href="/project">project</a></li>
							<li><a href="/education">education</a></li>
							<li><a href="/experience">experience</a></li>
							<li class="active"><a href="/aboutme">aboutme</a></li>
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
						<sapn style="font-size: 14pt; font-weight: bold;">Book
						Lists</sapn>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<c:forEach var="b" items="${bList}">									
									<div class="swiper-slide">
										<span style="position: absolute; display:none;"><button onclick="location.href='/book/delete/${b.id}'">삭제</button></span>
										<div style="border: 1px solid #f2f3f7; padding:10px; width:200px; height: 260px; margin-bottom: 20px;">
											<img src="${b.image}" style="width: 100%; height: 80%;">
											<div style="height: 20%;">
												<span>${b.title}</span>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
							<!-- Add Pagination -->
							<div class="swiper-pagination"></div>
						</div>
					</div>
				</div>

				<div class="panel panel-default"
					style="margin-bottom: 15px; margin-top:20px; background-color: #f2f3f7">
					<div class="panel-body">
						<sapn style="font-size: 14pt; font-weight: bold;">Book
						Append</sapn>
					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-body">
						<span>검색어 : </span> <input id="searchInput" type="text">
						<button onclick="searchNaver();">검색</button>
						<button onclick="uploadBook();" style="float: right;">선택등록</button>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="row" id="book_list"></div>
					</div>
				</div>
				<c:set var="prev" value="${ed.id}"></c:set>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="/resources/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="/resources/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="/resources/js/bootstrap.min.js"></script>
	<!-- Swiper -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.0/js/swiper.min.js"></script>

	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

	<script type="text/javascript">
		function searchBooks(query) {
			topic = query;
			$
					.ajax({
						type : "get",
						url : "/naver/search",
						data : {
							"query" : query
						},
						success : function(data) {
							$('#book_list').html('');
							for (var i = 0; i < data.length; i++) {
								var div = $('<div class="col-md-3"></div>');
								var thumbnail = $('<div class="thumbnail" style="height:300px; padding-top:20px;"></div>');
								thumbnail
										.append('<img style="width: 80%" src="'
												+ data[i].image + '"><br>');
								thumbnail
										.append('<div class="caption"><p class="bookName">'
												+ data[i].title.split('(')[0]
												+ '</p></div>');
								div.append(thumbnail);
								$('#book_list').append(div);
							}
							$('.thumbnail').click(
									function() {
										$('.thumbnail').css('background-color',
												'white');
										$(this).css('background-color',
												'#aaaaaa');
										selectedBookImage = $(this).children(
												'img').attr('src');
										selectedBookName = $(this).children(
												'div').children('p').html();
									});
						}
					});
		}
		function searchNaver() {
			searchBooks($('#searchInput').val());
		}

		$("#searchInput").keydown(function(key) {
			if (key.keyCode == 13) {
				searchBooks($('#searchInput').val());
			}
		});

		function uploadBook() {
			if (selectedBookName == "" || selectedBookImage == "") {
				alert('책을 선택하세요.');
				return;
			}
			$.ajax({
				type : "post",
				data : {
					"topic" : topic,
					"image" : selectedBookImage,
					"title" : selectedBookName
				},
				url : "/uploadBook",
				success : function(data) {
					var slide = $('<div class="swiper-slide"></div>');
					slide.append('<span style="position: absolute; display:none;"><button onclick="location.href=\'/book/delete/'+data.id+'\'">삭제</button></span>');
					var bookSlide = $('<div style="border: 1px solid #f2f3f7; padding:10px; width:200px; height: 260px; margin-bottom: 20px;"></div>');
					bookSlide.append('<img src="'+data.image+'" style="width: 100%; height: 80%;">');					
					bookSlide.append('<div style="height: 20%;"><span>'+data.title+'</span></div>');
					slide.append(bookSlide);
					$('.swiper-wrapper').append(slide);
					setSwiper();
				}
			});
		}
		
		topic = "";
		selectedBookName = "";
		selectedBookImage = "";
		setSwiper();
		function setSwiper(){
			var swiper = new Swiper('.swiper-container', {
				slidesPerView : 4,
				spaceBetween : 30,
				centeredSlides : true,
				pagination : {
					el : '.swiper-pagination',
					clickable : true,
				},
			});
			
			$('.swiper-slide').hover(function(){
				$(this).children('span').css('display','inline');
			},function(){
				$(this).children('span').css('display','none');			
			});
		}
	</script>
</body>

</html>