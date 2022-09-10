<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
  <!-- Content section -->
  <section class="py-5">
    <div class="container">
      <h1>회원 목록</h1>
       <table class="table table-hover">
    <thead>
      <tr class="table-dark">
        <th>Email</th>
        <th>NickName</th>
        <th>Register Date</th>
        <th></th>
        <th></th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${mlist }" var="mvo" >
      <tr>
        <td>${mvo.email }</td>
        <td><a href="/member/detail?email=${mvo.email }&pageNum=${pgvo.cri.pageNum}&amount=${pgvo.cri.amount }">${mvo.nickname }</a></td>
        <td>${mvo.regd8 }</td>
        
        <td><a href="/member/modify?email=${mvo.email }&pageNum=${pgvo.cri.pageNum}&amount=${pgvo.cri.amount }" class="btn btn-warning">수정</a></td>
        <td><a href="/member/resign?email=${mvo.email }&ses=${sesInfo.email}&pageNum=${pgvo.cri.pageNum}&amount=${pgvo.cri.amount }" class="btn btn-outline-danger">탈퇴</a></td>
      </tr>

    </c:forEach>
 
    </tbody>
  </table>
  <ul class="pagination">
  <c:if test='${pgvo.prev }'>
    <li class="page-item"><a class="page-link" 
    href="/member/list?pageNum=${pgvo.beginPagingNum -1}&amount=${pgvo.cri.amount}">Prev</a></li><!-- amount값을 보내서 endpaging,beginpaging에 값을 넣어준다. -->
  </c:if>
  <c:forEach begin="${pgvo.beginPagingNum }" end="${pgvo.endPagingNum }" var="i">
    <li class="page-item ${pgvo.cri.pageNum == i?'active':'' }"><!-- ${pgvo.cri.pageNum == i?'active':'' } : 선택한 페이지는 active , 아닌페이지는 active하지 않음 -->
    <a class="page-link" href="/member/list?pageNum=${i }&amount=${pgvo.cri.amount}">${i }</a>
    </li>
  </c:forEach>
  <c:if test='${pgvo.next }'>
    <li class="page-item"><a class="page-link" 
    href="/member/list?pageNum=${pgvo.endPagingNum +1 }&amount=${pgvo.cri.amount}">Next</a></li>
  </c:if>
  </ul>
    </div>
  </section>
<jsp:include page="../common/footer.jsp"></jsp:include>