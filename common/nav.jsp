<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">Final JSP</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="/">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/product/list">상품목록</a>
          </li>
          
            <sec:authorize access="isAnonymous()"><!--authorize:권한 허용 설정, access:권한받을 대상 ,isAnonymous() : 어떤 사용자든 상관없음,  true값을 반환-->
	          <li class="nav-item">
	            <a class="nav-link" href="/member/join">회원가입</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link" href="/member/login">로그인</a>
	          </li>
	          </sec:authorize>
	          
	          <sec:authorize access="isAuthenticated()"><!--isAuthenticated : 인증된 사용자  -->
		          <li class="nav-item">
		            <a class="nav-link" 
		            href='/member/detail?email=<sec:authentication property="principal.email"/>'>
		              <sec:authentication property="principal.email"/><!--sec:authentication : 시큐리티에서 값을 가져옵니다, property : 출력할 값을 씁니다  , 값을 가져올땐 principal.을 붙입니다.-->
		            </a>
		          </li>
				          <li class="nav-item">
				            <a class="nav-link" href="/member/list">회원목록</a>
				          </li>
		          <li class="nav-item">
		            <a class="nav-link" href="#" id="logout">로그아웃</a>
		          </li>
            </sec:authorize>
        </ul>
        <form action="/member/logout" method="post" id="logoutForm">
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
        </form>
      </div>
    </div>
  </nav>
  <script>
  $(function(){
	  $("#logout").on("click",function(e){
		  e.preventDefault();
		  $("#logoutForm").submit();
	  })  
  });
  
  </script>