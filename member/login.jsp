<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
  <!-- Content section -->
  <section class="py-5">
    <div class="container">
      <h1>회원 로그인</h1>
     <form action="/member/login" method="POST">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">    
      <div class="form-group">
        <label for="email">Email: </label>
        <input type="email" class="form-control" placeholder="Enter email" name="email" value="${email }">
      </div>
      <div class="form-group">
        <label for="pwd">Password:</label>
        <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd" value="${pwd }">
      </div>
      <c:if test="${not empty err_msg }"><!--에러메시지가 비어있지 않으면  -->
        <div class="form-group">
          <p class="text-danger">다음과 같은 이유로 로그인을 실패하였습니다 : 
            <c:choose>
              <c:when test="${err_msg eq 'Bad credentials' }">
                <c:set var="errMsg" value="이메일 혹은 비밀번호가 정확하지 않습니다."/>
              </c:when>
              <c:when test="${err_msg eq 'User is disabled' }">
                <c:set var="errMsg" value="계정이 비활성화 되었습니다!"/>
              </c:when>
              <c:otherwise>
                <c:set var="errMsg" value="관리자에게 문의하세요!"/>
              </c:otherwise>
            </c:choose>
            ${errMsg }
          </p>
        </div>
      </c:if>
      <button type="submit" class="btn btn-primary">Submit</button>
    </form>
    </div>
  </section>
<jsp:include page="../common/footer.jsp"></jsp:include>