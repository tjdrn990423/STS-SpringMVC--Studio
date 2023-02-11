<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<%--
 * 게시물 상세 화면 - 게시물의 상세정보를 조회한다.
 *
 * @identity postD.jsp
 * @author   경성구
 * @since    2023-01-20
 * @history
 * @attribute bbs
 *			  post	
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
		$("#listBtn").click(function(e) {
			var bbs_id = $("#bbsId").val();
			var subject = $("#subject").val();
			var page = $("#page").val();

			location.href="${contextPath}/post/postL?bbs_id=" + bbs_id + "&page=" + page + "&subject=" + subject;
		});
		
		/**
		 * [수정] 버튼 클릭
		 * @author  경성구
		 * @since 	2023-01-20
		 */
		 $("#modifyBtn").click(function(e) {
			 e.preventDefault();

			var bbs_id = $("#bbsId").val();
			var subject	= $("#subject").val();
			var page	= $("#page").val();
			var post_no = $("#postNo").val();
				
			 $.ajax({
				method: "GET",
				url: "${contextPath}/post/postM?bbs_id=" + bbs_id + "&post_no=" + post_no + "&page=" + page + "&subject=" + subject,
				data: {
					"post_no" : $("#postNo").val()
				}
			 })
			 .done(function(html){
				 $("#postM-content").html(html);
				 $("#postM").show();
				 $("#postM-background").css("display","block");
			 });
		 });
		
		
		 /**
		 * [삭제] 버튼 클릭
		 * @author  경성구
		 * @since 	2023-01-25
		 */
		 $("#removeBtn").click(function(e){
			if(confirm("정말로 삭제하시겠습니까?")){
				$.ajax({
					method: "GET",
					url: "${contextPath}/post/remove.do",
					data: {
						post_no : $("#postNo").val()
					}
				})
				.done(function(result){
					alert(result.MESSAGE);
					var bbs_id = $("#bbsId").val();
					
					location.href="${contextPath}/post/postL?bbs_id=" + bbs_id;
				});
			}			 
		 });
	});
	/* ================ ready 이벤트 함수 ================= */
	$(function() {

		var sessionUser_level = ${sessionScope.user_level};
		var sessionUser_pno = ${sessionScope.pno};
		var createPno = $("#createPno").val();
		var read_level =  $("#readLevel").val();
		
		if(sessionUser_pno != createPno ){
			$("#modifyBtn").remove();
			$("#removeBtn").remove();
		}
		if(sessionUser_level < read_level ){
			alert("읽기 권한이 없습니다.");
			location.href="${contextPath}/";
		}
	});

 </script>
 <style>
 .bottom-button-area {
    border-top: 1px solid #dfd7ca;
    padding-top: 10px;
    text-align: center;
    margin-bottom: 10px;
    display: flex;
}
.bottom-button-area>.l-group{float:left;}
.bottom-button-area>.r-group{margin-left:auto;}
input[type="text"].form-control {
  background-color: gray;
}

.modal-background{
    background-color: rgba(140,140,140,60%);
    display:none;
    position: absolute;
    width: 100%;
    height: calc(100% + 45px);
    top: 0px;
    left: 0;
}
.modal {
	position: absolute;
	overflow: visible;
}
.md-width-modal{
	width:900px !important;
	max-width:2200px !important;
}

</style>
<%@include file="../includes/header.jsp"%>
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="page-content">
		  <div class="heading-section">
            <h4><em>상세 정보</em> ${bbs.bbs_name}</h4>
          </div> 
          <!-- ***** Gaming Library Start ***** -->
          <div class="gaming-library" style="margin-top: 0px;">
         		<input type="hidden" id="page" name="page" value="${page}">
				<input type="hidden" id="subject" name="subject" value="${subject}">
				<input type="hidden" id="postNo" name="post_no" value="${post.post_no}" />
				<input type="hidden" id="bbsId" name="bbs_id" value="${post.bbs_id}">
				<input type="hidden" id="writeLevel" name="write_level" value="${bbs.write_level}">
				<input type="hidden" id="readLevel" name="read_level" value="${bbs.read_level}">
				<input type="hidden" id="createPno" name="create_pno" value="${post.create_pno}">	
				<div class="row">  
				  <div class="col">
 <c:choose>
				    <c:when test="${bbs.bbs_id eq 'RESERVATION'}">
						<label for="exampleFormControlInput1" style="color: white">예약 날짜</label>
				    </c:when>
				    <c:otherwise>
				    	<label for="exampleFormControlInput1" style="color: white">제목</label>
				    </c:otherwise>
</c:choose>
	            	<input type="text" class="form-control" id="subject" name="subject" value="${post.subject}" readonly>
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
				    <input type="text" class="form-control" id="writer" name="writer" value="${post.writer}" readonly>
				  </div>
				</div>
				<div class="row">  
				  <div class="col"  style="margin-top: 10px;">
				  	<label for="exampleFormControlSelect1" style="color: white">작성일시</label>
				    <input type="text" class="form-control" id="createDate" name="create_date" value="${post.create_date}" readonly>
				  </div>
				  <div class="col"  style="margin-top: 10px;">
				    <label for="exampleFormControlSelect1" style="color: white">수정일시</label>
				    <input type="text" class="form-control" id="modifyDate" name="modify_date" value="${post.modify_date}" readonly>
				  </div>
				  <div class="col"  style="margin-top: 10px;">
				    <label for="exampleFormControlSelect1" style="color: white">조회수</label>
				    <input type="text" class="form-control" id="readCnt" name="read_cnt" value="${post.read_cnt}" readonly>
				  </div>
			  </div>
			  <div class="row">
				  <div class="col"  style="margin-top: 10px;">
				    <label for="exampleFormControlSelect1" style="color: white">내용</label>
				    <textarea class="form-control" id="postContent" name="post_content" style="height: 200px; background-color: gray;" readonly>${post.post_content}</textarea>
				  </div>
			  </div>
			  <div class="row">
				  <div class="col"  style="margin-top: 10px;">
				    <label for="exampleFormControlSelect1" style="color: white">업로드</label>
				    <input type="text" class="form-control" id="uploadFile" name="uploadFile" value="${post.file_name}"readonly>
				  </div>
			  </div>
			  <div class="bottom-button-area">
			  	<div class="l-group">
				  <button type="button" class="btn btn-outline-secondary btn-sm" id="listBtn" style="color:white;">목록</button>
			  	</div>
			  	<div class="r-group">
				  <button type="button" class="btn btn-secondary btn-sm" id="modifyBtn" data-toggle="modal" data-target="#myModal">수정</button>
				  <button type="button" class="btn btn-dark btn-sm" id="removeBtn">삭제</button>
			  	</div>
			  </div>
		</div>
          <!-- ***** Gaming Library End ***** -->
        </div>
      </div>
    </div>
  </div>
  
  <!-- 게시물 수정 팝업 -->
	<div class="modal-background" id="postM-background"></div>
	<div class="modal" id="postM">
		<div class="modal-dialog md-width-modal" role="document">
			<div class="modal-content" id="postM-content"></div>
		</div>
	</div>
	
	
	
	
<%@include file="../includes/footer.jsp"%>