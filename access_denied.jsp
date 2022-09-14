<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="common/header.jsp"></jsp:include>
<jsp:include page="common/nav.jsp"></jsp:include>
<div class="umboTron">
  <h1>접근 권한이 없는 페이지 입니다.</h1>
  <p>관리자에게 문의하십시오.</p>
  <p>Email : admin@admin.com</p>
  <p>Tel : 010-9779-8282</p>
  <p>현재 시간은 ${serverTime }입니다.</p>
</div>

<jsp:include page="common/footer.jsp"></jsp:include>