<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Member> members = (List<Member>) request.getAttribute("members");
	
	String searchType = request.getParameter("searchType");
	String searchKeyword = request.getParameter("searchKeyword");
%>   
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!-- 관리자용 admin.css link -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/admin.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">
<style>
div#search-memberId	 {display: <%= searchType == null || "member_id".equals(searchType) ? "inline-block" : "none" %>;}
div#search-memberName{display: <%= "member_name".equals(searchType) ? "inline-block" : "none" %>;}
</style>
<script>
window.addEventListener('load', () => {
	document.querySelector("#searchType").addEventListener('change', (e) => {
		console.log(e.target.value); // member_id, member_name
		
		document.querySelectorAll(".search-type").forEach((div) => {
			div.style.display = "none";
		});
		
		let id; 
		switch(e.target.value){
		case "member_id" : id = "search-memberId"; break; 
		case "member_name" : id = "search-memberName"; break; 
		}
		
		document.querySelector("#" + id).style.display = "inline-block";
	});
});
</script>
    <section id="admin-container">
        <div id="admin-block">
            <ul class="admin-nav">
                <li class="member" style="font-weight: bold;"><a href="">회원 관리</a></li>
                <li class="product"><a href="<%= request.getContextPath() %>/admin/adminProductList">제품 관리</a></li>
                <li class="orders"><a href="<%= request.getContextPath() %>/admin/adminOrdersList">주문 관리</a></li>
            </ul>
        </div>
	        <h2>회원 관리</h2>
	        <div id="search-block">
	            <select id="searchType">
	                <option value="member_id">아이디</option>
	                <option value="member_name">이름</option>
	            </select>
	            <div id="search-memberId" class="search-type">
	                <form action="<%= request.getContextPath()%>/admin/adminMemberFinder">
	                    <input type="hidden" name="searchType" value="member_id">
	                    <input type="text" name="searchKeyword" size="25" placeholder="검색할 아이디를 입력하세요."
	                        value="<%= "member_id".equals(searchType) ? searchKeyword : "" %>">
	                    <button type="submit">검색</button>
	                </form>
	            </div>
	            <div id="search-memberName" class="search-type">
	                <form action="<%=request.getContextPath()%>/admin/adminMemberFinder">
	                    <input type="hidden" name="searchType" value="member_name">
	                    <input type="text" name="searchKeyword" size="25" placeholder="검색할 이름을 입력하세요."
	                        value="<%= "member_name".equals(searchType) ? searchKeyword : "" %>">
	                    <button type="submit">검색</button>
	                </form>
	            </div>
	        </div>
	        <table id="tbl-member" class="tbl">
	            <thead>
	                <tr>
	                    <th>아이디</th>
	                    <th>권한</th>
	                    <th>이름</th>
	                    <th>생년월일</th>
	                    <th>성별</th>
	                    <th>휴대폰 번호</th>
	                    <th>이메일</th>
	                    <th>주소</th>
	                    <th>가입일자</th>
	                    <th>삭제</th>
	                </tr>
	            </thead>
	            <tbody>
				<% if(members.isEmpty()){ %>
					<tr>
						<td colspan="9">조회된 회원이 없습니다.</td>
					</tr>
				<% 
				   } else { 
					  for(Member member : members){
				%>
						<tr>
							<td><%= member.getMemberId() %></td>
							<td>
								<select class="member-role" data-member-id="<%= member.getMemberId() %>"">
									<option value="<%= MemberRole.C %>" <%= member.getMemberRole() == MemberRole.C ? "selected" : "" %>>COMMON</option>
									<option value="<%= MemberRole.V %>" <%= member.getMemberRole() == MemberRole.V ? "selected" : "" %>>VIP</option>
									<option value="<%= MemberRole.A %>" <%= member.getMemberRole() == MemberRole.A ? "selected" : "" %>>ADMIN</option>
								</select>
							</td>
							<td><%= member.getMemberName() %></td>
							<td><%= member.getBirthday() != null ? member.getBirthday() : "" %></td>
							<td><%= member.getGender() != null ? member.getGender() : "" %></td>
							<td><%= member.getPhone() %></td>
							<td><%= member.getEmail() != null ? member.getEmail() : "" %></td>
							<td><%= member.getAddress() != null ? member.getAddress() : "" %></td>
							<td><%= member.getEnrollDate() %></td>
							<td>
								<form action="<%= request.getContextPath() %>/admin/adminMemberDelete" name="memberDeleteFrm" method="POST">
									<button type="submit" name ="memberId" value="<%= member.getMemberId() %>" onclick="confirmDeleteMember()">삭제</button>
								</form>
							</td>
						</tr>
				<%
					  }			
					} 
				%>            
	            </tbody>
	        </table>
			<div id="pagebar">
				<%= request.getAttribute("pagebar") %>
			</div>
		</section>
<form action="<%= request.getContextPath() %>/admin/adminUpdateMemberRole" name="memberRoleUpdateFrm" method="POST">
	<input type="hidden" name="memberId" />
	<input type="hidden" name="memberRole" />
</form>
<script>
document.querySelectorAll(".member-role").forEach((select) => {
	select.addEventListener('change', (e) => {
		console.log(e.target.value);
		console.log(e.target.dataset.memberId);
		const memberId = e.target.dataset.memberId;
		const memberRole = e.target.value;
		
		if(confirm(`[\${memberId}]회원의 권한을 \${memberRole}로 변경하시겠습니까?`)){			
			const frm = document.memberRoleUpdateFrm;
			frm.memberId.value = memberId;
			frm.memberRole.value = memberRole;
			frm.submit();
		}
		else {
			// e.target(select)하위의 selected 속성이 있는 option태그
			e.target.querySelector("option[selected]").selected = true;
		}
		
	});
});

function confirmDeleteMember() {
    window.confirm("정말 이 회원을 삭제하시겠습니까?");
 }
</script>    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>