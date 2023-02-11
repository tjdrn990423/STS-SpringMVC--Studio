<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<%--
 * 게시물 등록 화면 - 게시물을 등록한다.
 *
 * @identity postC.jsp
 * @author   경성구
 * @since    2023-01-20
 * @history
 *
 --%>
 <script type="text/javascript">
 
//이벤트 바인딩 함수 ============================================================
	$(function() {
		/**
		 * [목록] 버튼 클릭
		 * @author  경성구
		 * @since 	2023-01-20
		 */
		$("#closeBtn").click(function(e) {
			var bbs_id = $("#bbsId").val();
			var subject = $("#subject").val();
			var page = $("#page").val();

			location.href="${contextPath}/post/postL?bbs_id=" + bbs_id + "&page=" + page + "&subject=" + subject;
		});
		
		
		/**
		 * [저장] 버튼 클릭
		 * @author 경성구
     	 * @since  2023-01-25
		 */
		/* $("#post-createBtn").click(function(e) {
			e.preventDefault();

			$.ajax({
				method: "POST",
				url: "${contextPath}/post/create.do",
				data : $("#postForm").serialize()
			})
			.done(function (result) {
				alert(result.MESSAGE);
				var bbs_id = $("#bbsId").val();
				
				location.href = "${contextPath}/post/postL?bbs_id=" + bbs_id ;
			}); 
		}); */
	});
	/* ================ ready 이벤트 함수 ================= */
	$(function() {
		var sessionUser_level = ${sessionScope.user_level};
		var write_level =  $("#writeLevel").val();
		
		if(sessionUser_level < write_level ){
			alert(" 쓰기 권한이 없습니다.");
			location.href="${contextPath}/";
		}
	});
	
	/* ============== 사용자 정의 함수 =============== */
		

 </script>
 <style>
 .bottom-button-area {
    border-top: 1px solid #dfd7ca;
    padding-top: 10px;
    text-align: center;
    margin-bottom: 10px;
    display: flex;
}
.bottom-button-area>.r-group{margin-left:auto;}
</style>
<%@include file="../includes/header.jsp"%>
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="page-content">
		  <div class="heading-section">
            <h4><em>작성</em> ${bbs.bbs_name}</h4>
          </div> 
          <!-- ***** Gaming Library Start ***** -->
          <div class="gaming-library" style="margin-top: 0px;">
			<input type="hidden" id="subject" name="subject" value="${subject}">
          	<!-- <form onSubmit="return false;" id="postForm" enctype="multipart/form-data"> -->
          	<form action="create.do" method="post" enctype="multipart/form-data">
         		<input type="hidden" id="page" name="page" value="${page}">
				<input type="hidden" id="bbsId" name="bbs_id" value="${bbs.bbs_id}">
				<input type="hidden" id="writeLevel" name="write_level" value="${bbs.write_level}">
				<input type="hidden" id="createPno" name="create_pno" value="${sessionScope.pno}">
				<div class="row">  
				  <div class="col">
<c:choose>
				    <c:when test="${bbs.bbs_id eq 'RESERVATION'}">
				    	<label for="exampleFormControlInput1" style="color: white">예약날짜<span style="color: red">(*)</span></label>
				    	<input type="date" class="form-control" id="subject" name="subject">
				    </c:when>
				    <c:otherwise>
				    	<label for="exampleFormControlInput1" style="color: white">제목<span style="color: red">(*)</span></label>
	            		<input type="text" class="form-control" id="subject" name="subject">
				    </c:otherwise>
</c:choose>
				  </div>
				  <div class="col">
<c:choose>
				    <c:when test="${bbs.bbs_id eq 'RESERVATION'}">
				    	<label for="exampleFormControlSelect1" style="color: white">예약자</label>
				    </c:when>
				    <c:otherwise>
					    <label for="exampleFormControlSelect1" style="color: white">작성자</label>
				    </c:otherwise>
</c:choose>
				    <input type="text" class="form-control" id="writer" name="writer" value="${sessionScope.name}" readonly>
				  </div>
				</div>
			  <div class="row">
				  <div class="col"  style="margin-top: 10px;">
<c:choose>
				    <c:when test="${bbs.bbs_id eq 'RESERVATION'}">
				    	<label for="exampleFormControlSelect1" style="color: white">내용<span style="color: red">(*)</span></label>
					    <textarea class="form-control" id="postContent" name="post_content" placeholder="시간 과  원하시는 사진 스타일 및 촬영자를 작성해주세요 (촬영자가 없으시면 미작성 해주세요)" style="height: 200px;"></textarea>
				    </c:when>
				    <c:otherwise>
				    	<label for="exampleFormControlSelect1" style="color: white">내용<span style="color: red">(*)</span></label>
					    <textarea class="form-control" id="postContent" name="post_content" style="height: 200px;"></textarea>
				    </c:otherwise>
</c:choose>
				  </div>
			  </div>
			  <div class="row">
				  <div class="col"  style="margin-top: 10px;">
			    	<label for="exampleFormControlSelect1" style="color: white">업로드</label>
				    <input type="file" class="form-control" id="uploadFile" name="uploadFile">
				  </div>
			  </div>
			  <div class="bottom-button-area">
			  	<div class="r-group">
				  <button type="submit" class="btn btn-secondary" id="post-createBtn">저장</button>
				  <button type="button" class="btn btn-dark" id="closeBtn">취소</button>
			  	</div>
			  </div>
		  </form>
		</div>
          <!-- ***** Gaming Library End ***** -->
        </div>
      </div>
    </div>
  </div>
<%@include file="../includes/footer.jsp"%>