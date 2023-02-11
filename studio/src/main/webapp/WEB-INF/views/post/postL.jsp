<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- <script src="/resources/assets/js/pagenation.js"></script> -->
<%--
 * 게시물 목록 화면 - 각각의 게시물의 목록을 조회한다.
 *
 * @identity postL.jsp
 * @author   경성구
 * @since    2023-01-18
 * @history
 * @attribute bbs
 *
 --%>
 <script type="text/javascript">
 
//이벤트 바인딩 함수 ============================================================
	$(function() {
		/**
		 * [검색] 버튼 클릭
		 * @author 	경성구
		 * since 	2023-01-19
		 */
		 $("#searchBtn").click(function(e){
			 e.preventDefault();
			 $("#searchValue").val($("#searchForm").serialize());
			 searchPost();
		 });
		
		/**
		 * 게시물 리스트 tr 클릭
		 * @author 	경성구
		 * since 	2023-01-19
		 */
		$("#postTable>tbody").on("click", "tr", function(e) {
			e.preventDefault();

			if (!$(".dataTables_empty").length) {
				$("#postTable>tbody>tr").removeClass("table-primary");
				$(this).addClass("table-primary");
				detailPost($(this).attr("data-key"));
			}
		});
		
		/**
		 * [글쓰기] 버튼 클릭
		 * @author 	경성구
		 * since 	2023-01-19
		 */
		$("#writeBtn").click(function(e) {
			var bbs_id = $("#bbsId").val();
			var subject = $("#subject").val();
			var page = $("#page").val();
			location.href="${contextPath}/post/postC?bbs_id=" + bbs_id + "&page=" + page + "&subject=" + subject;
		});
	});
	/* ================ ready 이벤트 함수 ================= */
	$(function() {

		// 게시물 검색
		var searchValue = $("#searchForm").serialize();
		var page = $("#page").val();
		searchValue += "&num=" + page;
		$("#searchValue").val(searchValue);
		searchPost();
		
		var sessionUser_level = ${sessionScope.user_level};
		var write_level =  $("#writeLevel").val();
		var read_level =  $("#readLevel").val();
		
		if(sessionUser_level < write_level ){
			$("#writeBtn").remove();
		}
		if(sessionUser_level < read_level ){
			alert("읽기 권한이 없습니다.");
			location.href="${contextPath}/";
		}
	});
	
	/* ============== 사용자 정의 함수 =============== */
	/**
	 * 게시물 검색
	 * @author 	경성구
	 * since 	2022-10-12
	 */
	var postTable;
	function searchPost() {
		if(typeof(postTable) != 'undefined') postTable.destroy();

		$.ajax({
			method: "GET",
			url: "${contextPath}/post/search.do",
			data : $("#searchValue").val()
		})
		.done(function (result) {
			var listStr = "";

			if (result != null) {
				if (result.postList != null && result.postList.length > 0) {
					var postList = result.postList;

					for (var i = 0; i < postList.length; i++) {
						listStr += "<tr data-key='" + postList[i].post_no + "'>";
						listStr += "<td style='width:5% !important; text-align: center;'>" + postList[i].rn + "</td>";
						listStr += "<td style='width:50% !important; text-align: center;'>" + postList[i].subject + "</td>";
						listStr += "<td style='width:15% !important; text-align: center;'>" + postList[i].create_date + "</td>";
						listStr += "<td style='width:10% !important; text-align: center;'>" + postList[i].read_cnt + "</td>";
						listStr += "<td style='width:20% !important; text-align: center;'>" + postList[i].writer + "</td>";
						listStr += "</tr>";
					}
				}

				// 페이지를 리로드하지 않고 현재 페이지 주소만 변경
				//$("#page").val(result.pagenation.num);
				//var bbs_id = $("#bbsId").val();
				//history.pushState(null, null, "postL?bbs_id="+ bbs_id + "&page=" + result.pagenation.num);
			}
			$("#postList").html(listStr);

             // 페이징 부분 표시
			//makePagenation(result.pagenation);
		});
	};
	
	/**
	 * 게시물 상세조회
	 * @author 	경성구
	 * since 	2023-01-20
	 */
	 function detailPost(post_no){
		var bbs_id = $("#bbsId").val();
		var subject	= $("#subject").val();
		var page	= $("#page").val();
		
		location.href="${contextPath}/post/postD?bbs_id=" + bbs_id + "&post_no=" + post_no + "&page=" + page + "&subject=" + subject;
	};
	
		

 </script>
<%@include file="../includes/header.jsp"%>
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="page-content">
		  <div class="heading-section">
            <h4><em>${bbs.bbs_name}</em> ${bbs.bbs_id}</h4>
          </div> 
          <!-- ***** Gaming Library Start ***** -->
          <div class="gaming-library" style="margin-top: 0px;">
           <div class="row">
	          	<div class="col-12">
	          		<input type="hidden" id="searchValue" value="">
	          		<nav class="navbar navbar-dark bg-dark" style="margin-bottom: 10px;float: right; ">
					  <form class="form-inline" onSubmit="return false;" id="searchForm">
					    <input type="hidden" id="bbsId" name="bbs_id" value="${bbs.bbs_id}">
		          		<input type="hidden" id="page" name="page" value="${page}">
		          		<input type="hidden" id="writeLevel" name="write_level" value="${bbs.write_level}">
						<input type="hidden" id="readLevel" name="read_level" value="${bbs.read_level}">
		          		<div class="input-group">
<c:choose>
				    <c:when test="${bbs.bbs_id eq 'RESERVATION'}">
						    <input class="form-control mr-sm-2" type="text"  id="subject" placeholder="예약 날짜" aria-label="Search" value="${subject}">
				    </c:when>
				    <c:otherwise>
						    <input class="form-control mr-sm-2" type="text"  id="subject" placeholder="제목" aria-label="Search" value="${subject}">
				    </c:otherwise>
</c:choose>	
						    <button class="btn btn-outline-secondary my-2 my-sm-0" id="searchBtn">검색</button>
					    </div>
					  </form>
					</nav>
		          	<table class="table table-hover table-dark" id="postTable">
					  <thead>
					    <tr>
					      <th scope="col" style="width:5% !important; text-align: center;">번호</th>
<c:choose>
				    <c:when test="${bbs.bbs_id eq 'RESERVATION'}">
					      <th scope="col" style="width:50% !important; text-align: center;">예약 날짜</th>
				    </c:when>
				    <c:otherwise>
					      <th scope="col" style="width:50% !important; text-align: center;">제목</th>
				    </c:otherwise>
</c:choose>					      
					      <th scope="col" style="width:15% !important; text-align: center;">등록일</th>
					      <th scope="col" style="width:10% !important; text-align: center;">조회수</th>
<c:choose>
				    <c:when test="${bbs.bbs_id eq 'RESERVATION'}">
					      <th scope="col" style="width:20% !important; text-align: center;">예약자</th>
				    </c:when>
				    <c:otherwise>
					      <th scope="col" style="width:20% !important; text-align: center;">작성자</th>
				    </c:otherwise>
</c:choose>					    
					    </tr>
					  </thead>
					  <tbody id="postList">
					  </tbody>
					</table>
					<!-- <div class="btn-toolbar pagenation-area" role="toolbar" aria-label="Toolbar with button groups">
						<div class="total-cnt-area"></div>
						<div class="btn-group mr-2" role="group" aria-label="First group">
						</div>
					</div> -->
					<button type="button" class="btn btn-secondary" id="writeBtn" style="margin-top: 10px;float: right; ">글쓰기</button>
				</div>
		 </div>	
		</div>
          <!-- ***** Gaming Library End ***** -->
        </div>
      </div>
    </div>
  </div>
<%@include file="../includes/footer.jsp"%>