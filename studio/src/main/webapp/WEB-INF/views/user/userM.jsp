<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<%--
 * 회원 수정 화면 - 회원을 수정한다.
 *
 * @identity userM.jsp
 * @author   경성구
 * @since    2023-02-04
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
     	 * @since  2023-02-04
		 */
		$("#modifyBtn").click(function(e) {
			e.preventDefault();

			$.ajax({
				method: "POST",
				url: "${contextPath}/user/modify.do",
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
		
		/**
		 * [탈퇴] 버튼 클릭
		 * @author 경성구
     	 * @since  2023-02-04
		 */
		$("#removeBtn").click(function(e){
			if(confirm("정말로 탈퇴하시겠습니까?")){
				$.ajax({
					method: "GET",
					url: "${contextPath}/user/remove.do",
					data: {
						pno : $("#pno").val()
					}
				})
				.done(function(result){
					alert(result.MESSAGE);
					location.href="${contextPath}/";
				});
			}			 
		 });
	});
	/* ================ ready 이벤트 함수 ================= */
	$(function() {
		var sessionPno = ${sessionScope.pno};
		var pno =  $("#pno").val();
		
		if(sessionPno != pno){
			alert("다른이용자를 수정할 수 없습니다.");
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
            <h4>회원가입</h4>
          </div> 
          <!-- ***** Gaming Library Start ***** -->
          <div class="gaming-library" style="margin-top: 0px;">
          	<form onSubmit="return false;" id="userForm">
				<input type="hidden" id="pno" name="pno" value="${user.pno}">
				<div class="row">  
				  <div class="col">
				    	<label for="exampleFormControlInput1" style="color: white">ID<span style="color: red">(*)</span></label>
	            		<input type="text" class="form-control" id="id" name="id" value="${user.id}" placeholder="5자리 이상 입력해주세요" style="background-color: gray;" readonly>
				  </div>
				  <div class="col">
					    <label for="exampleFormControlSelect1" style="color: white">PW<span style="color: red">(*)</span></label>
				    	<input type="password" class="form-control" id="password" name="password" value="${user.password}" placeholder="5자리 이상 입력해주세요">
				  </div>
				</div>
			  <div class="row">
				  <div class="col"  style="margin-top: 10px;">
				    	<label for="exampleFormControlInput1" style="color: white">NAME<span style="color: red">(*)</span></label>
	            		<input type="text" class="form-control" id="name" name="name" value="${user.name}">
				  </div>			  	
				  <div class="col"  style="margin-top: 10px;">
				    	<label for="exampleFormControlInput1" style="color: white">Email</label>
	            		<input type="email" class="form-control" id="email" name="email" value="${user.email}">
				  </div>
			  </div>
			  <div class="row">
			  		<div class="col"  style="margin-top: 10px;">
				    	<label for="exampleFormControlInput1" style="color: white">PHONE</label>
	            		<input type="number" class="form-control" id="phone" name="phone" value="${user.phone}" placeholder="( 010 ) , ( - )을 제외한 숫자만 입력해주세요">
				  	</div>
				  	<div class="col"  style="margin-top: 10px;">
				    	<label for="exampleFormControlInput1" style="color: white">생성날짜</label>
	            		<input type="text" class="form-control" id="create_date" name="create_date" style="background-color: gray;" value="${user.create_date}" readonly>
				  	</div>
			  </div>
			  <div class="bottom-button-area">
			  	<div class="r-group">
				  <button type="button" class="btn btn-secondary" id="modifyBtn">저장</button>
				  <button type="button" class="btn btn-danger" id="removeBtn">탈퇴</button>
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