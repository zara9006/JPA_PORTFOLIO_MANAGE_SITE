<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
	<c:when test="${education.id > 0}">
		<form action="/updateEducation" method="POST" enctype="multipart/form-data">
			<input type="hidden" id="id" name="id" value="${education.id}">
	</c:when>
	<c:otherwise>
		<form action="/uploadEducation" method="POST" enctype="multipart/form-data">
	</c:otherwise>
</c:choose>
	<div class="form-group">
		<label for="usr">Name:</label> 
		<input type="text" class="form-control" id="schoolName" name="schoolName" value="${education.schoolName}" required>
	</div>
	<div class="form-group">
		<label for="comment">Period:</label>
		<input type="text" class="form-control" id="period" name="period" value="${education.period}" required>
	</div>
	<div class="form-group">
		<label for="comment">Content:</label>
		<textarea class="form-control" rows="5" id="content" name="content" required>${education.content}</textarea>
	</div>
	<div style="text-align: center; padding: 10px;">
		<c:choose>
			<c:when test="${education.id > 0}">				
				<input type="submit" value="수정" />
			</c:when>
			<c:otherwise>				
				<input type="submit" value="업로드" />
			</c:otherwise>
		</c:choose>
	</div>
</form>