<%@page import="com.sh.yespresso.product.model.dto.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Product> products = (List<Product>) request.getAttribute("products");
	
	String searchType = request.getParameter("searchType");
	String searchKeyword = request.getParameter("searchKeyword");
%>   
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!-- 관리자용 admin.css link -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/admin.css" />
<style>
</style>
<script>
</script>
    <section id="admin-container">
        <div id="admin-block">
            <ul class="admin-nav">
                <li class="member"><a href="<%= request.getContextPath() %>/admin/adminMemberList">회원 관리</a></li>
                <li class="product"><a href="">제품 관리</a></li>
                <li class="orders"><a href="<%= request.getContextPath() %>/admin/adminOrdersList">주문 관리</a></li>
            </ul>
        </div>
        <h2>제품 관리</h2>
        <div id="search-block">
            <select id="searchType">
                <option value="product_name">제품명</option>
            </select>
            <div id="search-product" class="search-type">
                <form action="#">
                    <input type="hidden" name="searchType" value="product_name">
                    <input type="text" name="searchKeyword" size="25" placeholder="검색할 제품명을 입력하세요."
                        value="">
                    <button type="submit">검색</button>
                </form>
                <button>제품 등록</button>
            </div>
        </div>
            <div id="check-block">
                <div id="product-sort">
                    <p>정렬순</p>
                    <input type="checkbox" name="no-A" id="no-A">
                    <label for="no-A">제품번호 오름차순</label><br>
                    <input type="checkbox" name="no-D" id="no-D">
                    <label for="no-D">제품번호 내림차순</label><br>
                    <input type="checkbox" name="price-A" id="price-A">
                    <label for="price-A">가격 오름차순</label><br>
                    <input type="checkbox" name="price-D" id="price-D">
                    <label for="price-D">가격 내림차순</label><br>
                    <input type="checkbox" name="stock-A" id="stock-A">
                    <label for="stock-A">재고 오름차순</label><br>
                    <input type="checkbox" name="stock-D" id="stock-D">
                    <label for="stock-D">재고 내림차순</label><br>
                    <input type="checkbox" name="no-A" id="no-A">
                    <input type="checkbox" name="p-enroll-A" id="p-enroll-A">
                    <label for="p-enroll-A">제품등록일 오름차순</label><br>
                    <input type="checkbox" name="p-enroll-D" id="p-enroll-D">
                    <label for="p-enroll-D">제품등록일 내림차순</label>
                </div>
                <div id="product-type">
                    <p>제품 타입</p>
                    <input type="checkbox" name="vertuo" id="vertuo">
                    <label for="vertuo">버츄오</label><br>
                    <input type="checkbox" name="original" id="original">
                    <label for="original">오리지널</label>
                </div>
                <div id="aroma">
                    <p>아로마</p>
                    <input type="checkbox" name="cocoa" id="cocoa">
                    <label for="cocoa">코코아</label><br>
                    <input type="checkbox" name="biscuity" id="biscuity">
                    <label for="biscuity">비스킷</label><br>
                    <input type="checkbox" name="fruity" id="fruity">
                    <label for="fruity">과일</label>
                </div>
                <div id="acidity">
                    <p>산미감</p>
                    <input type="checkbox" name="aw-1" id="aw-1">
                    <label for="aw-1">1(약)</label><br>
                    <input type="checkbox" name="aw-2" id="aw-2">
                    <label for="aw-2">2(약)</label><br>
                    <input type="checkbox" name="as-3" id="as-3">
                    <label for="as-3">3(강)</label><br>
                    <input type="checkbox" name="as-4" id="as-4">
                    <label for="as-4">4(강)</label><br>
                    <input type="checkbox" name="as-5" id="as-5">
                    <label for="as-5">5(강)</label>
                </div>
                <div id="roasting">
                    <p>로스팅</p>
                    <div id="roasting-w">
                        <input type="checkbox" name="rw-1" id="rw-1">
                        <label for="rw-1">1(약)</label><br>
                        <input type="checkbox" name="rw-2" id="rw-2">
                        <label for="rw-2">2(약)</label><br>
                        <input type="checkbox" name="rw-3" id="rw-3">
                        <label for="rw-3">3(약)</label><br>
                        <input type="checkbox" name="rw-4" id="rw-4">
                        <label for="rw-4">4(약)</label><br>
                        <input type="checkbox" name="rw-5" id="rw-5">
                        <label for="rw-5">5(약)</label><br>
                        <input type="checkbox" name="rw-6" id="rw-6">
                        <label for="rw-6">6(약)</label>
                    </div>
                    <div id="roasting-s">
                        <input type="checkbox" name="rs-7" id="rs-7">
                        <label for="rs-7">7(강)</label><br>
                        <input type="checkbox" name="rs-8" id="rs-8">
                        <label for="rs-8">8(강)</label><br>
                        <input type="checkbox" name="rs-9" id="rs-9">
                        <label for="rs-9">9(강)</label><br>
                        <input type="checkbox" name="rs-10" id="rs-10">
                        <label for="rs-10">10(강)</label><br>
                        <input type="checkbox" name="rs-11" id="rs-11">
                        <label for="rs-11">11(강)</label><br>
                        <input type="checkbox" name="rs-12" id="rs-12">
                        <label for="rs-12">12(강)</label><br>
                        <input type="checkbox" name="rs-13" id="rs-13">
                        <label for="rs-13">13(강)</label>
                    </div>
                </div>
                <div id="cup-size">
                    <p>컵사이즈</p>
                    <input type="checkbox" name="S" id="S">
                    <label for="S">S : 25 ~ 40ml</label><br>
                    <input type="checkbox" name="M" id="M">
                    <label for="M">M : 80 ~ 110ml</label><br>
                    <input type="checkbox" name="L" id="L">
                    <label for="L">L : 150 ~ 230ml</label>
                </div>
            </div>        
        <table id="tbl-product" class="tbl">
            <thead>
                <tr>
                    <th>No</th>
                    <th>제품번호</th>
                    <th>제품명</th>
                    <th>제품번호</th>
                    <th>가격</th>
                    <th>재고</th>
                    <th>카테고리번호</th>
                    <th>판매량</th>
                    <th>제품등록일</th>
                    <th>제품 타입</th>
                    <th>아로마</th>
                    <th>산미감</th>
                    <th>로스팅</th>
                    <th>컵사이즈</th>
                    <th>
                        <button type="submit">수정</button>
                        <button type="submit">삭제</button>
                    </th>
                </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
		<div id="pagebar">
			<%= request.getAttribute("pagebar") %>
		</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>