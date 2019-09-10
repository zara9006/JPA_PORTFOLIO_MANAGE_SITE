<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
	<c:when test="${experience.id > 0}">
		<form action="/updateExperience" method="POST" enctype="multipart/form-data">
			<input type="hidden" id="id" name="id" value="${experience.id}">
	</c:when>
	<c:otherwise>
		<form action="/uploadExperience" method="POST" enctype="multipart/form-data">
	</c:otherwise>
</c:choose>
	<div class="form-group">
		<label for="usr">Title:</label> 
		<input type="text" class="form-control" id="title" name="title" value="${experience.title}" required>
	</div>
	<div class="form-group">
		<label for="comment">Problem:</label>
		<textarea class="form-control" rows="5" id="problem" name="problem" required>${experience.problem}</textarea>
	</div>
	<div class="form-group">
		<label for="comment">Solution:</label>
		<textarea class="form-control" rows="5" id="solution" name="solution" required>${experience.solution}</textarea>
	</div>
	<div style="text-align: center; padding: 10px;">
		<c:choose>
			<c:when test="${experience.id > 0}">				
				<input type="submit" value="수정" />
			</c:when>
			<c:otherwise>				
				<input type="submit" value="업로드" />
			</c:otherwise>
		</c:choose>
	</div>
</form>