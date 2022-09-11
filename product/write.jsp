<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
<section class="py-5">
    <div class="container">
      <h1>상품 등록</h1>
	     <form action="/product/write?${_csrf.parameterName }=${_csrf.token}" method="POST" enctype="multipart/form-data">
	      <div class="form-group">
	        <label for="title">상품명:</label>
	        <input type="text" class="form-control" placeholder="상품명을 입력하세요." name="title">
	      </div>
	      <sec:authorize access="isAuthenticated()"><!--isAuthenticated : 인증된 사용자  -->
        <div class="form-group">
          <label for="writer">등록자:</label>
          <input type="text" class="form-control" name="writer" 
          value='<sec:authentication property="principal.email"/>' readonly> 
        </div>
        </sec:authorize>
        <div class="form-group">
          <label for="price">상품가격:</label>
          <input type="number" class="form-control" name="price">
        </div>
        <div class="form-group">
          <label for="imgfile">그림파일:</label>
          <input type="file" class="form-control" name="imgfile"> <!--첨부파일할떄 사용..  -->
        </div>
        <div class="form-group">
          <label for="content">상세정보:</label>
          <textarea class="form-control" name="content" cols="5"></textarea>
        </div>
	      <button type="submit" class="btn btn-primary">Submit</button>
	    </form>
    </div >
</section>

<jsp:include page="../common/footer.jsp"></jsp:include>