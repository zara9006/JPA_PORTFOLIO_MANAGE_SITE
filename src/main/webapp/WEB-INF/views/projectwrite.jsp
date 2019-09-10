<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${project.id > 0}">
		<form action="/updateProject" method="POST" enctype="multipart/form-data">		
			<input style="display: none;" type="text" class="form-control" id="id" name="id" value="${project.id}" required>
			<input style="display: none;" type="text" class="form-control" id="image" name="image" value="${project.image}">
	</c:when>
	<c:otherwise>
		<form action="/uploadProject" method="POST" enctype="multipart/form-data">
	</c:otherwise>
</c:choose>
	<div class="form-group">
		<label for="usr">프로젝트명:</label> 
		<input type="text" class="form-control" id="title" name="title" value="${project.title}" required>
	</div>
	<div class="form-group">
		<label>카테고리:</label> 
		<select class="form-control" id="category" name="category">
			<option>WEB</option>
			<option>CRAWLING</option>
			<option>MOBILE</option>
		</select>
	</div>
	<div class="form-group">
		<label for="usr">메인사진:</label> <input type="file" class="form-control-file" id="mulImage" name="mulImage">
	</div>

	<div class="form-group">
		<label for="usr">목적:</label> 
		<input type="text" class="form-control" id="goal" name="goal" value="${project.goal}" required>
	</div>

	<div class="form-group">
		<label for="usr">기간:</label> 
		<input type="text" class="form-control" id="period" name="period" value="${project.projectInfo.period}" required>
	</div>

	<div class="form-group">
		<label for="usr">언어:</label> 
		<input type="text" class="form-control" id="language" name="language" value="${project.projectInfo.language}" required>
	</div>

	<div class="form-group">
		<label for="usr">환경:</label> 
		<input type="text" class="form-control" id="environment" name="environment" value="${project.projectInfo.environment}" required>
	</div>

	<div class="form-group">
		<label for="usr">사용 라이브러리:</label> 
		<input type="text" class="form-control" id="library" name="library" value="${project.projectInfo.library}" required>
	</div>

	<div class="form-group">
		<label for="usr">담당:</label> 
		<input type="text" class="form-control" id="position" name="position" value="${project.projectInfo.position}" required>
	</div>

	<div>
		<label for="usr">기능 설명:</label>
		<textarea name="content" id="summernote" class="summernote">${project.projectInfo.content}</textarea>
	</div>

	<div style="text-align: center; padding: 10px;">
		<c:choose>
			<c:when test="${project.id > 0}">
				<input type="submit" value="수정" />
			</c:when>
			<c:otherwise>
				<input type="button" value="임시저장" /> <input type="submit" value="업로드" />
			</c:otherwise>
		</c:choose>
	</div>
</form>

<script>
	$().ready(function() {

		function sendFile(file, editor) {
			var data = new FormData();
			data.append('mulImage', file);
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