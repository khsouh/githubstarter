<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
  <!-- Content section -->
  <section class="py-5">
    <div class="container">
      <h1>상품 목록</h1>
      <div class="float-left">
        <a href="/product/write" class="btn btn-outline-primary">상품등록</a>
      </div>
      <div class="float-right form-group">
      <form action="/product/list" class="form-inline">
      <input type="hidden" name="pageNum" value="1"><!--검색후 첫번째페이지로  -->
      <input type="hidden" name="pageNum" value="${pgvo.cri.amount }}"><!--amount(10)개씩 출력  -->
      <div class ="input-group">
        <div class="input-group-prepend">
				  <select class="form-control" id="stype" name="type">
				    <option value="twc">선택</option>
				    <option value="t">상품명</option>
				    <option value="w">작성자</option>
				    <option value="c">상세내용</option>
				    <option value="tw">상품명+작성자</option>
				    <option value="tc">상품명+상세내용</option>
				    <option value="wc">작성자+상세내용</option>
				  </select>
        </div>
         <input type="text" name="keyword" class="form-control" placeholder="키워드를 입력하세요">
        <div class="input-group-append">
            <button class="btn btn-success" type="submit">검색</button>  
        </div>
      </div>
      </form>
      </div>
       <table class="table table-hover">
    <thead>
      <tr class="table-dark">
        <th>상품번호</th>
        <th>상품명</th>
        <th>등록자</th>
        <th>조회수</th>
        <th>최종수정일</th>
        <th>첨부</th>
      </tr>
    </thead>
    <tbody>
	    <c:choose>
	      <c:when test="${pList ne null && pList.size() != 0}">
			    <c:forEach items="${pList }" var="pvo" >
			      <tr>
			        <td>${pvo.pno }</td>
			        <td><a href="/product/detail?pno=${pvo.pno }&pageNum=${pgvo.cri.pageNum}&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}">${pvo.title }</a></td>
			        <td>${pvo.writer } 
			         <span class="badge badge-pill badge-warning">${pvo.cmtcnt }</span></td>
			        <td>${pvo.readcount }</td>
			        <td>${pvo.modd8 }</td>
			        <td><c:if test="${pvo.imgfile ne 'NONE' }">
			         <i class='far fa-file-image'></i>
			        </c:if></td>
			      </tr>
			    </c:forEach>
	      </c:when>
	      <c:otherwise>
			    <tr>
				    <th colspan="5" style="text-align: center"><h3>등록된 상품이 없습니다.</h3></th>
			    </tr>
	      </c:otherwise>
	    </c:choose>
    </tbody>
  </table>
  
  <ul class="pagination">
  <c:if test='${pgvo.prev }'><!-- 왼쪽버튼 출력여부  -->
    <li class="page-item"><a class="page-link" 
    href="/product/list?pageNum=${pgvo.beginPagingNum -1}&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}">Prev</a></li><!-- amount값을 보내서 endpaging,beginpaging에 값을 넣어준다. -->
  </c:if>

   <!-- 페이징 버튼 출력 (검색결과 추가) -->
    <c:forEach begin="${pgvo.beginPagingNum }" end="${pgvo.endPagingNum }" var="i"><!-- i는 반복문이 도는 횟수 -->
    <li class="page-item ${pgvo.cri.pageNum == i?'active':'' }"><!-- ${pgvo.cri.pageNum == i?'active':'' } : 선택한 페이지는 active , 아닌페이지는 active하지 않음 -->
    <a class="page-link" href="/product/list?pageNum=${i }&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}">${i }</a>
    </li>
  </c:forEach>
  
  <c:if test='${pgvo.next }'> <!-- 오른쪽버튼 출력여부 -->
    <li class="page-item"><a class="page-link" 
    href="/product/list?pageNum=${pgvo.endPagingNum +1 }&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}">Next</a></li>
  </c:if>
  </ul>
    </div>
  </section>
<jsp:include page="../common/footer.jsp"></jsp:include>