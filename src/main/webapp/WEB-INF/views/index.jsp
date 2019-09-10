<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>서병주 포트폴리오</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="" />

<!-- Facebook and Twitter integration -->
<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico">

<link
	href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700"
	rel="stylesheet">

<!-- Animate.css -->
<link rel="stylesheet" href="/resources/css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="/resources/css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<!-- Flexslider  -->
<link rel="stylesheet" href="/resources/css/flexslider.css">
<!-- Owl Carousel -->
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
<!-- Theme style  -->
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.0/css/swiper.min.css">

<!-- Modernizr JS -->
<script src="/resources/js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="/resources/js/respond.min.js"></script>
	<![endif]-->
<style>
.swiper-container {
	width: 100%;
	height: 320px;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
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
					<h1 id="colorlib-logo">
						<a href="index.html">Seo Byoung Ju</a>
					</h1>
					<span class="position">서 병 주</span>
				</div>
				<nav id="colorlib-main-menu" role="navigation" class="navbar">
					<div id="navbar" class="collapse">
						<ul>
							<li class="active"><a href="#" data-nav-section="home">Home</a></li>
							<li><a href="#" data-nav-section="about">About</a></li>
							<!--<li><a href="#" data-nav-section="services">Services</a></li>-->
							<li><a href="#" data-nav-section="skills">Skills</a></li>
							<li><a href="#" data-nav-section="education">Education</a></li>
							<li><a href="#" data-nav-section="experience">Experience</a></li>
							<li><a href="#" data-nav-section="work">Work</a></li>
							<li><a href="#" data-nav-section="contact">Contact</a></li>
							<br>
						</ul>
					</div>
					<c:if test="${loginInfo != null }">						
						<ul>
							<span><strong>Manage Option</strong></span>
							<li><a href="/project">project</a></li>
							<li><a href="/education">education</a></li>
							<li><a href="/experience">experience</a></li>
							<li><a href="/aboutme">aboutme</a></li>
						</ul>
					</c:if>
				</nav>

				<div class="colorlib-footer">
					<p>
						<div style="font-size: 20pt; font-weight: bold;">
							<a id="like_me_btn" onclick="thumbsUp();" style="<c:if test="${like.state == false}">color:black;</c:if>"><i class="icon-heart" style="color:#ec5453;"></i>like me </a>
						</div>
						<small>&copy; <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright <script>
								document.write(new Date().getFullYear());
							</script> All rights reserved. <br> with me <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</span> <span>Blog <a href="https://zarawebstudy.tistory.com/"
								target="_blank">zarawebstudy</a></span> <span>Git hub : <a
								href="https://github.com/zara9006" target="_blank">github.com/zara9006</a></span></small>
					</p>
					<c:if test="${loginInfo == null }">					
						<small><strong><a onclick="getPasswordInput();">관리자 전환</a></strong></small>
					</c:if>
					<form id="loginForm" class="form-group" style="visibility: hidden;" method="POST" action="/login">
						<input type="password" class="form-control password-input" name="password" id="password"> 
						<input type="submit" class="btn btn-primary btn-send-message" value="전환">
					</form>
				</div>

			</aside>

			<div id="colorlib-main">
				<section id="colorlib-hero" class="js-fullheight"
					data-section="home">
					<div class="flexslider js-fullheight">
						<ul class="slides">
							<li
								style="background-image: url(/resources/images/img_bg_2.PNG);">
								<div class="overlay"></div>
								<div class="container-fluid">
									<div class="row">
										<div
											class="col-md-6 col-md-offset-3 col-md-pull-3 col-sm-12 col-xs-12 js-fullheight slider-text">
											<div class="slider-text-inner">
												<div class="desc">
													<h1>
														I'm a<br>Web Developer
													</h1>
													<h2>This is my portfolio site.</h2>
													<p>
														<a class="btn btn-primary btn-learn"
															href="/pdf">Portfolio
															download to pdf <i class="icon-briefcase3"></i>
														</a>
													</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</section>

				<div id="colorlib-counter" class="colorlib-counters"
					style="background-image: url(/resources/images/cover_bg_1.jpg);"
					data-stellar-background-ratio="0.5">
					<div class="overlay"></div>
					<div class="colorlib-narrow-content">
						<div class="row"></div>
						<div class="row">
							<div class="col-md-3 text-center animate-box">
								<span class="colorlib-counter js-counter" data-from="0"
									data-to="${fn:length(pList)}" data-speed="2500"
									data-refresh-interval="50"></span> <span
									class="colorlib-counter-label">Projects</span>
							</div>
							<div class="col-md-3 text-center animate-box">
								<span class="colorlib-counter js-counter" data-from="0"
									data-to="${log.total}" data-speed="2500"
									data-refresh-interval="50"></span> <span
									class="colorlib-counter-label">Visitors</span>
							</div>
							<div class="col-md-3 text-center animate-box">
								<span class="colorlib-counter js-counter" data-from="0"
									data-to="${log.today}" data-speed="2500"
									data-refresh-interval="50"></span> <span
									class="colorlib-counter-label">today</span>
							</div>
							<div class="col-md-3 text-center animate-box">
								<span id="like_me" class="colorlib-counter js-counter" data-from="0"
									data-to="${like.likes}" data-speed="2500" data-refresh-interval="50"></span>
								<span class="colorlib-counter-label">Like me</span>
							</div>
						</div>
					</div>
				</div>

				<section class="colorlib-about" data-section="about">
					<div class="colorlib-narrow-content">
						<div class="row">
							<div class="col-md-12">
								<div class="row row-bottom-padded-sm animate-box"
									data-animate-effect="fadeInLeft">
									<div class="col-md-12">
										<div class="about-desc">
											<span class="heading-meta">About Us</span>
											<h2 class="colorlib-heading">Who Am I?</h2>
											<!--<div class="row">
												<div class="col-md-3 animate-box"
													data-animate-effect="fadeInLeft">
													<div class="services color-1">
														<span class="icon2"><i class="icon-sun2"></i></span>
														<h3>Passion</h3>
													</div>
												</div>
												<div class="col-md-3 animate-box"
													data-animate-effect="fadeInRight">
													<div class="services color-2">
														<span class="icon2"><i class="icon-time"></i></span>
														<h3>Steady</h3>
													</div>
												</div>
												<div class="col-md-3 animate-box"
													data-animate-effect="fadeInTop">
													<div class="services color-3">
														<span class="icon2"><i class="icon-fire2"></i></span>
														<h3>Challenge</h3>
													</div>
												</div>
												<div class="col-md-3 animate-box"
													data-animate-effect="fadeInBottom">
													<div class="services color-4">
														<span class="icon2"><i class="icon-phone3"></i></span>
														<h3>Sociability</h3>
													</div>
												</div>
											</div>-->
											<p>
												<strong style="font-size: 13pt;">의미없는 경험은 없다. 일단
													시작하자!!</strong><br> <br> 개발을 하다 보면 막히거나 생각한 대로 되지 않는 경우가
												많았습니다. 그때마다 포기하지 않고 천천히 작업하면서 <strong>완벽하지는 않더라도
													결과물이 나올 수 있게 노력</strong>했습니다. 그런 <strong>경험들이 쌓이다 보면 다음번에
													다른 새로운 것을 배우거나 시도할 때 좋은 밑거름</strong>이 된다고 생각했기 때문입니다.
											</p>
											<p>
												평소에 <strong>새로운 것을 배우면 바로바로 활용해서 작더라도 직접 코딩을 통해서
													완전히 제 것이 될 수 있도록 공부</strong>하려고 노력합니다. 일례로 처음 자바 언어 공부를 시작하고 소켓과
												스레드를 공부할 때 파일 송수신이 가능한 채팅 프로그램을 만들어 보았습니다. 덕분에 객체지향의 개념에 대해서
												좀 더 이해할 수 있었고, 이후에 JSP와 Spring 책을 볼 때 많이 수월할 수 있었습니다.
											</p>
											<p>이 포트폴리오 관리 사이트 역시 포트폴리오를 준비하면서 JPA를 공부했고 주말을 이용해서 JPA를
												활용하면 빠르게 만들 수 있겠다는 생각에서 시작하게 되었습니다.</p>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12 animate-box"
										data-animate-effect="fadeInLeft">
										<div class="hire">
											<h2 style="margin-bottom: 10px;">최근 읽은 책</h2>
											<div class="swiper-container">
												<div class="swiper-wrapper">
													<c:forEach var="b" items="${bList}">
														<div class="swiper-slide">
															<span style="position: absolute; display: none;"><button
																	onclick="location.href='/book/delete/${b.id}'">삭제</button></span>
															<div
																style="border: 1px solid #f2f3f7; background-color: white; padding: 10px; width: 170px; height: 260px; margin-bottom: 20px;">
																<img src="${b.image}" style="width: 140px; height: 80%;">
																<div style="height: 20%;">
																	<span style="font-size:0.5vw;">${b.title}</span>
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
								</div>
							</div>
						</div>
					</div>
				</section>



				<!--<section class="colorlib-services" data-section="services">
				<div class="colorlib-narrow-content">
					<div class="row">
						<div class="col-md-6 col-md-offset-3 col-md-pull-3 animate-box" data-animate-effect="fadeInLeft">
							<span class="heading-meta">What I do?</span>
							<h2 class="colorlib-heading">Here are some of my expertise</h2>
						</div>
					</div>
					<div class="row row-pt-md">
						<div class="col-md-4 text-center animate-box">
							<div class="services color-1">
								<span class="icon">
									<i class="icon-bulb"></i>
								</span>
								<div class="desc">
									<h3>Innovative Ideas</h3>
									<p>Separated they live in Bookmarksgrove right at the coast of the Semantics</p>
								</div>
							</div>
						</div>
						<div class="col-md-4 text-center animate-box">
							<div class="services color-2">
								<span class="icon">
									<i class="icon-data"></i>
								</span>
								<div class="desc">
									<h3>Software</h3>
									<p>Separated they live in Bookmarksgrove right at the coast of the Semantics</p>
								</div>
							</div>
						</div>
						<div class="col-md-4 text-center animate-box">
							<div class="services color-3">
								<span class="icon">
									<i class="icon-phone3"></i>
								</span>
								<div class="desc">
									<h3>Application</h3>
									<p>Separated they live in Bookmarksgrove right at the coast of the Semantics</p>
								</div>
							</div>
						</div>
						<div class="col-md-4 text-center animate-box">
							<div class="services color-4">
								<span class="icon">
									<i class="icon-layers2"></i>
								</span>
								<div class="desc">
									<h3>Graphic Design</h3>
									<p>Separated they live in Bookmarksgrove right at the coast of the Semantics</p>
								</div>
							</div>
						</div>
						<div class="col-md-4 text-center animate-box">
							<div class="services color-5">
								<span class="icon">
									<i class="icon-data"></i>
								</span>
								<div class="desc">
									<h3>Software</h3>
									<p>Separated they live in Bookmarksgrove right at the coast of the Semantics</p>
								</div>
							</div>
						</div>
						<div class="col-md-4 text-center animate-box">
							<div class="services color-6">
								<span class="icon">
									<i class="icon-phone3"></i>
								</span>
								<div class="desc">
									<h3>Application</h3>
									<p>Separated they live in Bookmarksgrove right at the coast of the Semantics</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>-->

				<section class="colorlib-skills" data-section="skills">
					<div class="colorlib-narrow-content">
						<div class="row">
							<div class="col-md-6 col-md-offset-3 col-md-pull-3 animate-box"
								data-animate-effect="fadeInLeft">
								<span class="heading-meta">My Specialty</span>
								<h2 class="colorlib-heading animate-box">My Skills</h2>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 animate-box"
								data-animate-effect="fadeInLeft">
								<p>
									주로 자바를 사용해서 Spring 프레임워크와 Mybatis를 연동하여 웹 개발을 하고 있습니다.<br>
									메이븐을 활용하여 라이브러리 관리와 프로젝트 빌드를 해보았습니다. Mybatis를 활용한 기본적인 CRUD작업과
									저장 프로시저 활용에 능숙합니다. 데이터는 주로 VO와 DTO를 활용한 방법과 자바 map을 활용한 방법 두가지를
									응용하여 처리하고 있습니다. 최근 모바일 앱 공부를 시작하면서 Restfull 방식의 개발을 이해하고 사용하려고
									노력하고 있습니다.
								</p>
							</div>
							<div class="col-md-6 animate-box"
								data-animate-effect="fadeInLeft">
								<div class="progress-wrap">
									<h3>Java</h3>
									<div class="progress">
										<div class="progress-bar color-1" role="progressbar"
											aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"
											style="width: 80%">
											<span>80%</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6 animate-box"
								data-animate-effect="fadeInRight">
								<div class="progress-wrap">
									<h3>Spring</h3>
									<div class="progress">
										<div class="progress-bar color-2" role="progressbar"
											aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"
											style="width: 80%">
											<span>80%</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6 animate-box"
								data-animate-effect="fadeInLeft">
								<div class="progress-wrap">
									<h3>jQuery</h3>
									<div class="progress">
										<div class="progress-bar color-3" role="progressbar"
											aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"
											style="width: 70%">
											<span>70%</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6 animate-box"
								data-animate-effect="fadeInRight">
								<div class="progress-wrap">
									<h3>Mybatis</h3>
									<div class="progress">
										<div class="progress-bar color-4" role="progressbar"
											aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"
											style="width: 75%">
											<span>75%</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6 animate-box"
								data-animate-effect="fadeInRight">
								<div class="progress-wrap">
									<h3>HTML5+CSS3</h3>
									<div class="progress">
										<div class="progress-bar color-6" role="progressbar"
											aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
											style="width: 60%">
											<span>60%</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6 animate-box"
								data-animate-effect="fadeInLeft">
								<div class="progress-wrap">
									<h3>Node.js</h3>
									<div class="progress">
										<div class="progress-bar color-1" role="progressbar"
											aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"
											style="width: 65%">
											<span>65%</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6 animate-box"
								data-animate-effect="fadeInRight">
								<div class="progress-wrap">
									<h3>Python</h3>
									<div class="progress">
										<div class="progress-bar color-2" role="progressbar"
											aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
											style="width: 60%">
											<span>60%</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6 animate-box"
								data-animate-effect="fadeInLeft">
								<div class="progress-wrap">
									<h3>Hibernate</h3>
									<div class="progress">
										<div class="progress-bar color-5" role="progressbar"
											aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"
											style="width: 30%">
											<span>30%</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>

				<section class="colorlib-education" data-section="education">
					<div class="colorlib-narrow-content">
						<div class="row">
							<div class="col-md-6 col-md-offset-3 col-md-pull-3 animate-box"
								data-animate-effect="fadeInLeft">
								<span class="heading-meta">Education</span>
								<h2 class="colorlib-heading animate-box">Education</h2>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="timeline-centered">
									<c:forEach var="ed" items="${edList}" varStatus="status">
										<article class="timeline-entry animate-box"
											data-animate-effect="fadeInLeft">
											<div class="timeline-entry-inner">

												<div class="timeline-icon color-${(status.index % 6)+1}">
													<i class="icon-pen2"></i>
												</div>

												<div class="timeline-label">
													<h2>
														<a href="#">${ed.schoolName}</a> <span>${ed.period}</span>
													</h2>
													<p>${ed.content}</p>
												</div>
											</div>
										</article>
									</c:forEach>

									<article class="timeline-entry begin animate-box"
										data-animate-effect="fadeInBottom">
										<div class="timeline-entry-inner">
											<div class="timeline-icon color-none"></div>
										</div>
									</article>
								</div>
							</div>
						</div>
					</div>
				</section>

				<section class="colorlib-experience" data-section="experience">
					<div class="colorlib-narrow-content">
						<div class="row">
							<div class="col-md-6 col-md-offset-3 col-md-pull-3 animate-box"
								data-animate-effect="fadeInLeft">
								<span class="heading-meta">Experience</span>
								<h2 class="colorlib-heading animate-box">Work Experience</h2>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 animate-box"
								data-animate-effect="fadeInLeft">
								<div class="fancy-collapse-panel">
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
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>

					</div>
				</section>

				<section class="colorlib-work" data-section="work">
					<div class="colorlib-narrow-content">
						<div class="row">
							<div class="col-md-6 col-md-offset-3 col-md-pull-3 animate-box"
								data-animate-effect="fadeInLeft">
								<span class="heading-meta">My Work</span>
								<h2 class="colorlib-heading animate-box">Recent Work</h2>
							</div>
						</div>
						<div class="row row-bottom-padded-sm animate-box"
							data-animate-effect="fadeInLeft">
							<!-- 
							<div class="col-md-12">
								<p class="work-menu">
									<span><a class="active p_category">ALL</a></span> <span><a
										class="p_category">WEB</a></span> <span><a class="p_category">CRAWLING</a></span><span><a
										class="p_category">MOBILE</a></span>
								</p>
							</div>
							 -->
						</div>
						<div class="row" id="project_box">
							<c:forEach var="p" items="${pList}" varStatus="status">
								<div class="col-md-6 animate-box"
									data-animate-effect="fadeInLeft">
									<div class="project"
										style="background-image: url('/resources/upload/${p.image}');">
										<div class="desc">
											<a href="/project/${p.id}">
												<div class="con">
													<h3>Work 0${status.index+1}</h3>
													<span><strong>${p.title}</strong><br>${p.goal}</span>

													<p class="icon">
														<span style="font-size: 14pt;"><i class="icon-eye"></i> ${p.hits }</span> 
														<!--<span><i class="icon-heart"></i> ${p.likes }</span>-->
													</p>
												</div>
											</a>
										</div>
									</div>
								</div>
							</c:forEach>
							<!--<div class="row">
								<div class="col-md-12 animate-box">
									<p>
										<a href="#" class="btn btn-primary btn-lg btn-load-more">Load
											more <i class="icon-reload"></i>
										</a>
									</p>
								</div>
							</div>-->
						</div>
				</section>

				<section class="colorlib-contact" data-section="contact">
					<div class="colorlib-narrow-content">
						<div class="row">
							<div class="col-md-6 col-md-offset-3 col-md-pull-3 animate-box"
								data-animate-effect="fadeInLeft">
								<span class="heading-meta">Get in Touch</span>
								<h2 class="colorlib-heading">Contact</h2>
							</div>
						</div>
						<div class="row">
							<div class="col-md-7 col-md-push-1">
								<div class="row">
									<div
										class="col-md-10 col-md-offset-1 col-md-pull-1 animate-box"
										data-animate-effect="fadeInRight">
										<form action="/mail/send" method="post">
											<div class="form-group">
												<input name="email" type="text" class="form-control mail-text"
													placeholder="Your Email">
											</div>
											<div class="form-group">
												<input name="title" type="text" class="form-control mail-text"
													placeholder="Title">
											</div>
											<div class="form-group">
												<textarea name="content" id="message" cols="30" rows="7"
													class="form-control mail-text" placeholder="Message"></textarea>
											</div>
											<div class="form-group">
												<input type="submit"
													class="btn btn-primary btn-send-message"
													value="Send Mail">
											</div>
										</form>
									</div>

								</div>
							</div>
						</div>
					</div>
				</section>

			</div>
			<!-- end:colorlib-main -->
		</div>
		<!-- end:container-wrap -->
	</div>
	<!-- end:colorlib-page -->

	<!-- jQuery -->
	<script src="/resources/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="/resources/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="/resources/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="/resources/js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="/resources/js/jquery.flexslider-min.js"></script>
	<!-- Owl carousel -->
	<script src="/resources/js/owl.carousel.min.js"></script>
	<!-- Counters -->
	<script src="/resources/js/jquery.countTo.js"></script>
	<!-- Swiper -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.0/js/swiper.min.js"></script>

	<!-- MAIN JS -->
	<script src="/resources/js/main.js"></script>

	<script type="text/javascript">
		function getPasswordInput() {
			$('#loginForm').css('visibility', 'visible');
		}
		var swiper = new Swiper('.swiper-container', {
			slidesPerView : 4,
			spaceBetween : 20,
			centeredSlides : true,
			pagination : {
				el : '.swiper-pagination',
				clickable : true,
			},
			breakpoints: { 
				300: { slidesPerView: 2, spaceBetween: 60 },
				1200: { slidesPerView: 3, spaceBetween: 40 }
			}
		});

		$('.p_category').click(function() {
			var category = $(this).html();
			$.ajax({
				type : "get",
				data : {
					"category" : category
				},
				url : "/project/search",
				success : function(data) {
					var h = $(data);
					$('#project_box').html('');
					$('#project_box').append(h);
				}
			});

		});
		
		function thumbsUp(){
			$.ajax({
				type:"get",
				url:"/thumbsup",
				success:function(data){
					$('#like_me').html(data.likes);
					if(data){
						if(data.state){							
							$('#like_me_btn').css('color','#2c98f0');
						}else{
							$('#like_me_btn').css('color','black');
						}
					}else{						
						alert('Error!');
					}
				}
			});
		}
	</script>

</body>

</html>