<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<%--
 * 회원 등록 화면 - 회원을 등록한다.
 *
 * @identity userC.jsp
 * @author   경성구
 * @since    2023-01-30
 * @history
 *
 --%>
 <script type="text/javascript">
 
//이벤트 바인딩 함수 ============================================================
	$(function() {
		/**
		 * [취소] 버튼 클릭
		 * @author  경성구
		 * @since 	2023-01-30
		 */
		$("#closeBtn").click(function(e) {

			location.href="${contextPath}/";
		});
		
		/**
		 * [저장] 버튼 클릭
		 * @author 경성구
     	 * @since  2023-01-25
		 */
		$("#createButton").click(function(e) {
			e.preventDefault();

			$.ajax({
				method: "POST",
				url: "${contextPath}/user/create.do",
				data : $("#userForm").serialize()
			})
			.done(function (result) {
				if(result.RESULT == 'OK') {
					alert(result.MESSAGE);
					location.href = "${contextPath}/";
				}
				else{
					alert("입력하지 않은 부분이 있습니다.");
				}
			}); 
		});
	});
	/* ================ ready 이벤트 함수 ================= */
	$(function() {
		
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
            <h4>회원가입</h4>
          </div> 
          <!-- ***** Gaming Library Start ***** -->
          <div class="gaming-library" style="margin-top: 0px;">
          	<form onSubmit="return false;" id="userForm">
				<div class="row">  
				  <div class="col">
				    	<label for="exampleFormControlInput1" style="color: white">ID<span style="color: red">(*)</span></label>
	            		<input type="text" class="form-control" id="id" name="id" placeholder="5자리 이상 입력해주세요">
				  </div>
				  <div class="col">
					    <label for="exampleFormControlSelect1" style="color: white">PW<span style="color: red">(*)</span></label>
				    	<input type="password" class="form-control" id="password" name="password" placeholder="5자리 이상 입력해주세요">
				  </div>
				</div>
			  <div class="row">
				  <div class="col"  style="margin-top: 10px;">
				    	<label for="exampleFormControlInput1" style="color: white">NAME<span style="color: red">(*)</span></label>
	            		<input type="text" class="form-control" id="name" name="name">
				  </div>			  	
				  <div class="col"  style="margin-top: 10px;">
				    	<label for="exampleFormControlInput1" style="color: white">Email</label>
	            		<input type="email" class="form-control" id="email" name="email">
				  </div>
			  </div>
			  <div class="row">
			  		<div class="col"  style="margin-top: 10px;">
				    	<label for="exampleFormControlInput1" style="color: white">PHONE</label>
	            		<input type="number" class="form-control" id="phone" name="phone" placeholder="( 010 ) , ( - )을 제외한 숫자만 입력해주세요">
				  	</div>
			  </div>
			  <div class="bottom-button-area">
			  	<div class="r-group">
				  <button type="button" class="btn btn-secondary" id="createButton">저장</button>
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