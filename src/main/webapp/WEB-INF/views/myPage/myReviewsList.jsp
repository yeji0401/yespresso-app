<%@page import="com.sh.yespresso.review.model.dto.Review"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%
List<Review> myReviewsList = (List<Review>) request.getAttribute("myReviewsList");

String reviewMemberId = loginMember.getMemberId();
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/myReviewsList.css" />
<section id="review-container">
	<h2>게시판</h2>

	<table id="tbl-review-list">
		<thead>
			<tr>

				<th>리뷰 제품</th>
				<th>리뷰 번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>첨부파일</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<%
			if (myReviewsList.isEmpty()) {
			%>
			<tr>
				<td colspan="5">조회된 리뷰가 없습니다.</td>
			</tr>
			<%
			} else {
			for (Review review : myReviewsList) {
			%>
			<tr>
				<td><%=review.getReviewNo()%></td>
				<td><%=review.getReviewProductNo()%></td>
				<td><a href="<%=request.getContextPath()%>/myPage/myReviewView?no=<%=review.getReviewNo()%>"><%=review.getReviewTitle()%></a></td>
				<td><%=review.getReviewDate()%></td>
				<td>
					<%
					if (review.getAttachCnt() > 0) {
					%> <img src="<%=request.getContextPath()%>/images/file.png" style="width: 16px;"> <%
 }
 %>
				</td>
			</tr>
			<%
			}
			}
			%>
		</tbody>
	</table>

	<div id='pagebar'>
		<%=request.getAttribute("pagebar")%>
	</div>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>

<a href="<%=%>/myPage/myReviewView">내 리뷰 보기(삭제버튼 추가)</a>