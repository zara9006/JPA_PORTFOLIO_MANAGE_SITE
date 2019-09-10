<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="p" items="${pList}">
	<div class="col-md-6 animate-box" data-animate-effect="fadeInLeft">
		<div class="project"
			style="background-image: url('/resources/upload/${p.image}');">
			<div class="desc">
				<a href="/project/${p.id}">
					<div class="con">
						<h3>Work 01</h3>
						<span><strong>${p.title}</strong><br>${p.goal}</span>

						<p class="icon">
							<span><i class="icon-eye"></i> ${p.hits }</span> <span><i
								class="icon-heart"></i> ${p.likes }</span>
						</p>
					</div>
				</a>
			</div>
		</div>
	</div>
</c:forEach>
<!-- MAIN JS -->
<script src="/resources/js/main.js"></script>
<script>
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
	</script>