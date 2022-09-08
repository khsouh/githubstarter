<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Final Jsp</p>
    </div>
    <!-- /.container -->
  </footer>

<script>
	$(function(){
		$("#chkemail").on("blur",function(){
			let emailVal = $("#chkemail").val();
			$.ajax({
				url:"/member/checkDuple",
				type:"GET",
				data:{email:emailVal},
				success:function(result){
					if(result>0){
						$("#chkEmail").text("중복된 이메일 입니다.").css("color","#f00");				
					}else{
						$("#chkEmail").text("사용 가능한 이메일 입니다.").css("color","#0f0");
					}
				}
			});
		});
	});
	
	  let pSign = '<c:out value="${pSign }"/>'; // psign은 product에 수정의 플래시어트리뷰트로 온다
	  if(pSign !=''){ 
	  alert(pSign);
	  }
	  let msg = '<c:out value="${msg}"/>'; // 로그인이나 회원탈퇴 후  flashattribute로 나오는 메시지값을 받는다
	  if(msg !=''){ 
	  alert(msg);
	  }
</script>
</body>

</html>