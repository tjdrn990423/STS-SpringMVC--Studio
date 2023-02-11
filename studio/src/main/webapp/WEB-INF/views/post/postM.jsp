<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<%--
 * 게시물 수정 화면 - 게시물을 수정한다.
 *
 * @identity postM.jsp
 * @author   경성구
 * @since    2023-01-25
 * @history
 * @attribute bbs
 *			  post
 *
 --%>
 <script type="text/javascript">
 
//이벤트 바인딩 함수 ============================================================

	$(function() {

		/**
		 *  [수정] 버튼 클릭 - > 게시물 수정 
		 * @author 경성구
     	 * @since  2023-01-16
		 */
		$("#postM-modifyBtn").click(function(e) {
			e.preventDefault();

			$.ajax({
				method: "POST",
				url: "${contextPath}/post/modify.do",
				data : $("#postM-postForm").serialize()
			})
			.done(function (result) {
				if (result.RESULT == 'OK') {
					var post_no = $("#postM-postNo").val();
					var bbs_id = $("#postM-bbsId").val();
					var subject	= $("#postM-searchSubject").val();
					var page	= $("#postM-page").val();
					
					location.href="${contextPath}/post/postD?bbs_id=" + bbs_id + "&post_no=" + post_no + "&page=" + page + "&subject=" + subject;
				}
				alert(result.MESSAGE);
			}); 
		});
		
		/**
		 * [닫기] 버튼 클릭
		 * @author 경성구
    	 * @since  2023-01-25
		 */
		 $("#postM-modalCloseBtn").click(function(e){
			e.preventDefault();
			$("#postM").hide();
			$("#postM-background").css("display","none");
			$("#postM-content").empty();
		 });
	});
	
	/* ================ ready 이벤트 함수 ================= */
	$(function() {

		var sessionUser_level = ${sessionScope.user_level};
		var write_level =  $("#writeLevel").val();
		var read_level =  $("#readLevel").val();
		
		if(sessionUser_level < write_level ){
			$("#postM-modifyBtn").remove();
		}
		if(sessionUser_level < read_level ){
			alert("읽기 권한이 없습니다.");
			location.href="${contextPath}/";
		}
	});
	
 </script>
<form onSubmit="return false;" id="postM-postForm">
	<div class="modal-header">
	  <h4 class="modal-title" id="myModalLabel" style="color:black;">${bbs.bbs_name}  <small>수정</small></h4>
	</div>
	<div class="modal-body">
	  	<input type="hidden" id="postM-page" name="page" value="${page}">
		<input type="hidden" id="postM-searchSubject" name="searchSubject" value="${subject}">
		<input type="hidden" id="postM-postNo" name="post_no" value="${post.post_no}" />
		<input type="hidden" id="postM-bbsId" name="bbs_id" value="${post.bbs_id}">
		<input type="hidden" id="writeLevel" name="write_level" value="${bbs.write_level}">
		<input type="hidden" id="readLevel" name="read_level" value="${bbs.read_level}">
		<div class="row">  
		  <div class="col">
<c:choose>
    <c:when test="${bbs.bbs_id eq 'RESERVATION'}">
			<label for="exampleFormControlInput1"><b>예약 날짜</b></label>
	        <input type="date" class="form-control" id="postM-subject" name="subject" value="${post.subject}" style="background-color: white;">
    </c:when>
    <c:otherwise>
		    <label for="exampleFormControlInput1"><b>제목</b></label>
	        <input type="text" class="form-control" id="postM-subject" name="subject" value="${post.subject}" style="background-color: white;">
    </c:otherwise>
</c:choose>		  
		  </div>
		  <div class="col">
<c:choose>
    <c:when test="${bbs.bbs_id eq 'RESERVATION'}">
			<label for="exampleFormControlSelect1"><b>예약자</b> <small><span style="color: red">(수정이 불가능합니다.)</span></small></label>
		    <input type="text" class="form-control" id="postM-writer" name="writer" value="${post.writer}" readonly>
    </c:when>
    <c:otherwise>
		    <label for="exampleFormControlSelect1"><b>작성자</b></label>
		    <input type="text" class="form-control" id="postM-writer" name="writer" value="${post.writer}" readonly>
    </c:otherwise>
</c:choose>
		  </div>
		</div>
		<div class="row">
		  <div class="col"  style="margin-top: 10px;">
		    <label for="exampleFormControlSelect1" ><b>내용</b></label>
		    <textarea class="form-control" id="postM-postContent" name="post_content" style="height: 300px;">${post.post_content}</textarea>
		  </div>
	  </div>
	</div>
	<div class="modal-footer">
	  <button type="submit" id="postM-modifyBtn" class="btn btn-secondary">저장</button>
	  <button type="button" id="postM-modalCloseBtn" class="btn btn-dark">닫기</button>
	</div>
</form>