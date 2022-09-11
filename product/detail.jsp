<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
  <!-- Content section -->
  <section class="py-5">
    <div class="container">
      <h1>상품 정보</h1>
       <table class="table">
      <tr>
        <th class="table-dark">상품번호</th>
        <td>${pvo.pno }</td>
      </tr>
      <tr>
        <th  class="table-dark">상품명</th>
        <td>${pvo.title }</td>
      </tr>
      <tr>
        <th  class="table-dark">등록자</th>
        <td>${pvo.writer }</td>
      </tr>
      <tr>
        <th  class="table-dark">조회수</th>
        <td>${pvo.readcount }</td>
      </tr>
      <tr>
        <th  class="table-dark">등록일자</th>
        <td>${pvo.regd8 }</td>
      </tr>
      <tr>
        <th  class="table-dark">최종수정일자</th>
        <td>${pvo.modd8 }</td>
      </tr>
      <tr>
        <th  class="table-dark">상품가격</th>
        <td>${pvo.price }</td>
      </tr>
      <tr>
        <th  class="table-dark">그림파일</th>
        <td>
        <c:if test="${pvo.imgfile ne 'NONE' }">
        <img src="/images/${pvo.imgfile }" width="500px" height="400px">
        </c:if>
        </td>
      </tr>
      <tr>
        <th  class="table-dark">상세정보</th>
        <td>${pvo.content }</td>
      </tr>
      <tr>
        <th colspan="2">
          <a href="/product/list?pageNum=${cri.pageNum}&amount=${cri.amount }&type=${cri.type}&keyword=${cri.keyword}" class="btn btn-success">목록</a>
        <sec:authorize access="isAuthenticated()"><!--isAuthenticated : 인증된 사용자  -->
	        <a href="/product/modify?pno=${pvo.pno }&pageNum=${cri.pageNum}&amount=${cri.amount }&type=${cri.type}&keyword=${cri.keyword}" class="btn btn-warning">수정</a>
	        <a href="/product/remove?pno=${pvo.pno }" class="btn btn-outline-danger" id="delBtn">삭제</a>
        </sec:authorize>
        </th>
      </tr>
      </table>
      <form action="/product/remove" id="delForm" method="POST">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
        <input type="hidden" name="pno" value="${pvo.pno }">
        <input type="hidden" name="imgfile" value="${pvo.imgfile }">
        <input type="hidden" name="pageNum" value="${cri.pageNum }">
        <input type="hidden" name="amount" value="${cri.amount }">
        <input type="hidden" name="type" value="${cri.type }">
        <input type="hidden" name="keyword" value="${cri.keyword }">
      </form><!-- 삭제버튼을 눌럿을 때 보낼 값들 -->
      
      <!-- Comment  -->
			
			 <sec:authorize access="isAuthenticated()"><!--isAuthenticated : 인증된 사용자  -->
			 <div class="input-group mt-3">
			  <input type="text" id="cmtInput" class="form-control" placeholder="댓글을 입력하세요.">
			  <div class="input-group-append">
			    <button class="btn btn-primary" type="button" id="cmtOKBtn">OK</button><!-- 댓글입력 -->
			    <button class="btn btn-danger" type="button" id="cmtResetBtn">Cancel</button><!-- 댓글입력취소 -->
			  </div>
			  </div>
			 </sec:authorize>
			       <!-- Comment List -->
	      <div id="cmtList">
	      
	       <ul class="nav nav-pills nav-justified">
	         <li class="nav-item">작성자</li>
	         <li class="nav-item">댓글내용</li>
	         <li class="nav-item">작성일</li>
	         <li class="nav-item">기능</li>
	       </ul>
	      </div>
    <div id="cmtPaging">
    </div>
			
						<!-- The Modal -->
			<div class="modal" id="myModal">
			  <div class="modal-dialog">
			    <div class="modal-content">
			
			      <!-- Modal Header -->
			      <div class="modal-header">
			        <h4 class="modal-title">Modal Heading</h4>
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>
			
			      <!-- Modal body -->
			      <div class="modal-body">
			        Modal body..
			      </div>
			
			      <!-- Modal footer -->
			      <div class="modal-footer">
			        <button type="button" id="modOkBtn" class="btn btn-primary">확인</button>
			      </div>
			
			    </div>
			  </div>
			</div>
    </div>
  </section>
<script src="/resources/js/comment.js"></script>
<script>
 $(function() {
	  $("#delBtn").on("click",function(e){
		  e.preventDefault();
		  $("#delForm").submit();
	  });
	  
	/* Comment Part */  
	
	let cmt_writer = '<sec:authorize access="isAuthenticated()"><sec:authentication property="principal.email"/></sec:authorize>';
	let cmt_pno = '<c:out value="${pvo.pno }"/>';
	
	listComment(cmt_pno,1); // 리스트 출력
	
	$(document).on("click","#cmtPaging li a",function(e){
		e.preventDefault();//a태그의 href가 작동하지않음
		listComment(cmt_pno,$(this).attr("href"));//#(this).attr("href")들어가있는 번호
		
	});//페이징 href처리
	
	
	$("#cmtOKBtn").on("click",function(){
		let cmt_content = $("#cmtInput").val();
		if(cmt_content == null || cmt_content == ''){
			alert("댓글 내용을 입력해 주세요.");
			return false;
		}else{
			let cmtData = {pno:cmt_pno,writer:cmt_writer,content:cmt_content}; /*제이슨 데이터로 보낸다.  */
			let header = $("meta[name='_csrf_header']").attr("content");
			let token = $("meta[name='_csrf']").attr("content");
			$.ajax({
				type:"POST",
				url:"/comment/new",
				data:JSON.stringify(cmtData),/* 자바스크립트 객체타입을 제이슨 데이터로 파싱 */
				contentType:"application/json; charset=utf-8",/* contextType: 제이슨 데이터를 제이슨 타입으로 만들어 줍니다.*/
				beforeSend : function(xhr){
					xhr.setRequestHeader(header,token); // requestheader에 토큰값을 세팅합니다.
				}//ajax를 보내기전에 실행할것입니다, xhr:xmlhttprequest 
			}).done(function(result){
				alert(result);//컨트롤에서보낸  ResponseEntity 값이 온다
				listComment(cmt_pno);
			});
		}
	});
	$(document).on("click",".modBtn",function(){
		let parentsUl = $(this).closest("ul"); // modBtn에서 가장 가까운 ul태그를 찾습니다.
		let writer = $(parentsUl).find("li:first-child").text(); //cvo.writer
		let content = $(parentsUl).find("li:nth-child(2)").text();//cvo.content
		let cno = $(parentsUl).find("li:last-child button:first-child").data("cno");//cvo.cno
		transferToModal(writer,content,cno);//함수로 값을 넘깁니다.
	});
	$(document).on("click","#modOkBtn",function(){
		let content = $(document).find("#modInput").val(); //modal-body에 생성된 modInput의 값.
		let cno = $(document).find("#modInput").data("cno");//modInput의 data-cno값
		modifySubmit(cmt_pno,content,cno);// 함수에 값을 넘깁니다.
		$(document).find(".close").click();
	});
	$(document).on("click",".delBtn",function(){
		let cno = $(this).data("cno");//this는 버튼객체를 가리킨다.
		removeComment(cno,cmt_pno);
	});
	
});
</script>
<jsp:include page="../common/footer.jsp"></jsp:include>