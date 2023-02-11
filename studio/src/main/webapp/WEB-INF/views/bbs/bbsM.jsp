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
 * @attribute list
 *
 --%>
 <script type="text/javascript">
 
//이벤트 바인딩 함수 ============================================================

	$(function() {

		/**
		 * 게시판 목록 테이블의 tr 클릭
		 * @author 경성구
     	 * @since  2022-10-25
		 */
		$("#bbsTable>tbody>tr").click(function(e) {
			e.preventDefault();

			// 선택된 게시판 상세정보 조회
			//var bbs_id = $(this).attr("data-key");
			//detailBbsForm(bbs_id);
			if (!$(".dataTables_empty").length) {
				$("#bbsTable>tbody>tr").removeClass("table-primary");
				$(this).addClass("table-primary");

				// 선택된 게시판 상세정보 조회
				var bbs_id = $(this).attr("data-key");
				detailBbsForm(bbs_id);
			}
		});
	});
	
	// ready 이벤트 함수 =============================================================

	$(function() {
		// 첫번째 게시판 선택
		$("#bbsTable>tbody>tr").removeClass("table-primary");
		$($("#bbsTable>tbody>tr").eq(0)).addClass("table-primary");

		// 첫번째 게시판 상세정보 조회
		var bbs_id = $("#bbsTable>tbody>tr").eq(0).attr("data-key");
		detailBbsForm(bbs_id);
	});
	// 사용자정의 함수 ===============================================================

	/**
	 * 게시판 상세정보 조회 -> 영역(폼) 생성
	 * @author 경성구
  * @since  2022-10-25
	 */
	function detailBbsForm(bbs_id) {
		$.ajax({
			method: "GET",
			url: "${contextPath}/bbs/bbsD",
			data : {
				"bbs_id" : bbs_id
			}
		})
		.done(function (html) {
			$("#detailBbs").html(html);
		});
	};
	
 </script>
<%@include file="../includes/header.jsp"%>
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="page-content">
		  <div class="heading-section">
            <h4><em>게시판 관리</em> BBS</h4>
          </div> 
          <!-- ***** Gaming Library Start ***** -->
          <div class="gaming-library" style="margin-top: 0px;">
           <div class="row">
	          	<c:choose>
				    <c:when test="${sessionScope.user_level == 3}">
	          	<div class="col-7">
		          	<table class="table table-hover table-dark" id="bbsTable">
					  <thead>
					    <tr>
					      <th scope="col">번호</th>
					      <th scope="col">게시판ID</th>
					      <th scope="col">게시판명</th>
					      <th scope="col">등록글수</th>
					    </tr>
					  </thead>
					  <tbody id="bbsList">
					    <c:forEach items="${list}" var="bbs">
							<tr data-key="${bbs.bbs_id}">
								<td>${bbs.num}</td>
								<td>${bbs.bbs_id}</td>
								<td>${bbs.bbs_name}</td>
								<td>${bbs.post_cnt}</td>
							</tr>
						</c:forEach>
					  </tbody>
					</table>
				</div>
				<div class="col-5">
					<div id="detailBbs"></div>
				</div>
				    </c:when>
				    <c:otherwise>
                        <div> 관리자가 아닙니다.</div>>
				    </c:otherwise>
				</c:choose>
		 </div>	
		</div>
          <!-- ***** Gaming Library End ***** -->
        </div>
      </div>
    </div>
  </div>
<%@include file="../includes/footer.jsp"%>