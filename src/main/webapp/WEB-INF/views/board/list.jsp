<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<div class="jumbotron">
		<div class="container">
			<div class="searchArea">
				<form action="${contextPath}/board/list" id="searchForm">
					<select name="type">
						<option value="">===</option>
						<option value="T" ${pageMaker.criteria.type eq 'T' ? 'selected':''}>제목</option>
						<option value="C" ${pageMaker.criteria.type eq 'C' ? 'selected':''}>내용</option>
						<option value="W" ${pageMaker.criteria.type eq 'W' ? 'selected':''}>작성자</option>
					</select>
					<input type="text" name="keyword" value="${pageMaker.criteria.keyword}">
					<button class="btn btn-primary">검색</button>
				</form>
			</div>
			<h2>자유게시판</h2>
		</div>
	</div>
	<div class="container">
		<a href="register" class="btn btn-primary">글쓰기</a>
		<table class="table">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>수정일</th>
			</tr>
			<c:forEach items="${list}" var="b">
			<tr>
				<td>${b.bno}</td>
				<td>
				<a href="${contextPath}/board/get?bno=${b.bno}">${b.title}</a>
				</td>
				<td>${b.writer}</td>
				<td>
					<fmt:parseDate var="regDate" value="${b.regDate}" pattern="yyyy-MM-dd'T'HH:mm:ss"/>
					<fmt:formatDate value="${regDate}" pattern="yyyy년MM월dd일 HH시mm분ss초"/>
				</td>
				<td>
					<fmt:parseDate var="updateDate" value="${b.updateDate}" pattern="yyyy-MM-dd'T'HH:mm:ss"/>
					<fmt:formatDate value="${updateDate}" pattern="yyyy년MM월dd일 HH시mm분ss초"/>
				</td>
			</tr>
			</c:forEach>
		</table>
		<form action="${contextPath}/board/list" id="pageForm">
		<input type="hidden" name="page" value="${pageMaker.criteria.page}">
		<input type="hidden" name="type" value="${pageMaker.criteria.type}">
		<input type="hidden" name="keyword" value="${pageMaker.criteria.keyword}">
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li class="page-item"><a class="page-link" href="${pageMaker.startPage-1}">이전페이지</a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="pageNum">
					<li class="page-item ${pageMaker.criteria.page == pageNum ? 'active':''}">
						<a href="${pageNum}" class="page-link">${pageNum}</a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<li class="page-item"><a class="page-link" href="${pageMaker.endPage+1}">다음페이지</a></li>
				</c:if>
				<br>
			</ul>
		</form>
		</div>
<%@ include file="../layout/footer.jsp" %>
<script>
	$(function(){
		let pageForm = $('#pageForm')
		$('#pageForm a').on('click',function (e){
			e.preventDefault();
			pageForm.find('input[name="page"]').val($(this).attr('href'));
			
			$('#pageForm').submit();
		});
	})
</script> 