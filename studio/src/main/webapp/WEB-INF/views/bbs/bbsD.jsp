<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<%--
 * 게시판관리 화면 - 게시판의 환경설정을 조회/수정한다.
 *
 * @identity bbsM.jsp
 * @author   경성구
 * @since    2023-01-14
 * @history
 * @attribute bbsList
 *
 --%>
 <script type="text/javascript">
 
//이벤트 바인딩 함수 ============================================================

	$(function() {

		/**
		 * 게시판 환경설정 수정
		 * @author 경성구
     	 * @since  2023-01-16
		 */
		$("#modifyBtn").click(function(e) {
			e.preventDefault();

			$.ajax({
				method: "POST",
				url: "${contextPath}/bbs/modifyBbs.do",
				data : $("#detailBbsForm").serialize()
			})
			.done(function (result) {
				if (result.RESULT == 'OK') {

					var bbsName = $("#detailBbsForm input[name='bbs_name']").val();
					$("#bbsList>tr.table-primary>td").eq(2).text(bbsName);
				}
				alert(result.MESSAGE);
			}); 
		});
	});
	
 </script>
          <!-- ***** Gaming Library Start ***** -->
              <div class="heading-section">
                <h4><em>게시판 상세 관리</em> BBS</h4>
              </div>
              <form onSubmit="return false;" id="detailBbsForm">
				  <div class="form-group">
				    <label for="exampleFormControlInput1" style="color: white">게시판ID</label>
	            	<input type="text" class="form-control" name="bbs_id" value="${bbs.bbs_id}" readonly>
				  </div>
				  <div class="form-group"  style="margin-top: 10px;">
				    <label for="exampleFormControlSelect1" style="color: white">게시판명<span style="color: red">(*)</span></label>
				    <input type="text" class="form-control" name="bbs_name" value="${bbs.bbs_name}">
				  </div>
				  <div class="form-group" style="margin-top: 10px;">
				    <label for="exampleFormControlSelect1" style="color: white">읽기 권한<span style="color: red">(*)</span></label>
				    <select class="form-control" id="readLevel" name="read_level">
				      <option value="1" <c:if test ="${bbs.read_level eq 1}">selected="selected"</c:if>>준회원</option>
				      <option value="2" <c:if test ="${bbs.read_level eq 2}">selected="selected"</c:if>>회원</option>
				      <option value="3" <c:if test ="${bbs.read_level eq 3}">selected="selected"</c:if>>관리자</option>
				    </select>
				  </div>
				  <div class="form-group" style="margin-top: 10px;">
				    <label for="exampleFormControlSelect1" style="color: white">쓰기 권한<span style="color: red">(*)</span></label>
				    <select class="form-control" id="exampleFormControlSelect1" name="write_level">
				      <option value="1" <c:if test ="${bbs.write_level eq 1}">selected="selected"</c:if>>준회원</option>
				      <option value="2" <c:if test ="${bbs.write_level eq 2}">selected="selected"</c:if>>회원</option>
				      <option value="3" <c:if test ="${bbs.write_level eq 3}">selected="selected"</c:if>>관리자</option>
				    </select>
				  </div>
				  <button type="submit" class="btn btn-secondary" id="modifyBtn" style="margin-top: 10px;float: right; ">저장</button>
			 </form>
          <!-- ***** Gaming Library End ***** -->
