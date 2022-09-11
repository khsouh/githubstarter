<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
<section class="py-5">
    <div class="container">
      <h1>상품 수정</h1>
    <form action="/product/modify?${_csrf.parameterName}=${_csrf.token}"
     method="post" enctype="multipart/form-data">
	     <input type="hidden" name="pno" value="${pvo.pno }">
	     <input type="hidden" name="pageNum" value="${cri.pageNum }">
	     <input type="hidden" name="amount" value="${cri.amount }">
       <input type="hidden" name="type" value="${cri.type }">
       <input type="hidden" name="keyword" value="${cri.keyword }">
	      <div class="form-group">
	        <label for="title">상품명:</label>
	        <input type="text" class="form-control" placeholder="상품명을 입력하세요." name="title" value="${pvo.title }">
	      </div>
        <div class="form-group">
          <label for="writer">등록자:</label>
          <input type="text" class="form-control" name="writer" value="${pvo.writer }" readonly>
        </div>
        <div class="form-group">
          <label for="price">상품가격:</label>
          <input type="number" class="form-control" name="price" value="${pvo.price }">
        </div>
        <div class="form-group">
          <label for="imgfile">기존이미지:</label>
          <input type="text" class="form-control" name="old_imgfile" value="${pvo.imgfile }" readonly> 
        </div>
        <div class="form-group">
          <label for="imgfile">그림파일:</label>
          <input type="file" class="form-control" name="imgfile">
        </div>
        <div class="form-group">
          <label for="content">상세정보:</label>
          <textarea class="form-control" name="content" cols="5">${pvo.content } </textarea>
        </div>
        <input type="hidden" id="hidVal" name="delImg" value="">
	      <button type="submit" class="btn btn-primary" id="modSubmit">Submit</button>
	    </form>
    </div >
</section>
<script>
$(function() {
	$("#modSubmit").on("click",function(e){
		e.preventDefault();
		let imgfileName = $("input[type=file]").val();
	  /* let hiddenVal = '<input type="hidden" id="hidVal" name="delImg" value="">';
    $("form").prepend(hiddenVal).trigger("create"); */
		if(imgfileName == ''){
			let isOk = confirm("첨부된 파일이 삭제되어도 괜찮습니까?");
			isOk == true ? $(document).find("#hidVal").val("1"):$(document).find("#hidVal").val("0");// 예를누르면 1값을 받아서 삭제, 아니오를 누르면 0값을 받아서 삭제하지않음
		}else{
      $(document).find("#hidVal").val("2");
		}
		$("form").submit();
	});
})
</script>

<jsp:include page="../common/footer.jsp"></jsp:include>