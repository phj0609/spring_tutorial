<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<form action="modify" method="post">
	<input type="hidden" name="bno" value="${board.bno}"><br>
	게시물 번호 : ${board.bno}<br>
	제목 : <input type="text" name="title" value="${board.title}"><br>
	내용 : 
	<textarea rows="20" cols="30" name="content">${board.content}</textarea><br>
	작성자 : ${board.writer}<br>
	<button class="btn btn-success">수정</button>
</form>
<%@ include file="../layout/footer.jsp" %> 