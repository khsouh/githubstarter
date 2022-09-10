<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
  <!-- Content section -->
  <section class="py-5">
    <div class="container">
      <h1>회원 정보</h1>
       <table class="table">
      <tr>
        <th class="table-dark">Email</th>
        <td>${mvo.email }</td>
      </tr>
      <tr>
        <th  class="table-dark">PWD</th>
        <td>${mvo.pwd }</td>
      </tr>
      <tr>
        <th  class="table-dark">NickName</th>
        <td>${mvo.nickname }</td>
      </tr>
      <tr>
        <th  class="table-dark">RegisterDate</th>
        <td>${mvo.regd8 }</td>
      </tr>
      <tr>
        <th colspan="2">
        <a href="/member/list?pageNum=${cri.pageNum}&amount=${cri.amount }" class="btn btn-success">목록</a>
        <a href="/member/modify?email=${mvo.email }&pageNum=${cri.pageNum}&amount=${cri.amount }" class="btn btn-warning">수정</a>
        <a href="/member/resign?email=${mvo.email }&ses=${sesInfo.email}&pageNum=${cri.pageNum}&amount=${cri.amount }" class="btn btn-outline-danger">탈퇴</a>
        </th>
      </tr>
      </table>
    </div>
  </section>
<jsp:include page="../common/footer.jsp"></jsp:include>