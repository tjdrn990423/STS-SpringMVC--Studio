<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>강남역에 뜬별 스튜디오</title>

    <!-- Bootstrap core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="/resources/assets/css/fontawesome.css">
    <link rel="stylesheet" href="/resources/assets/css/templatemo-cyborg-gaming.css">
    <link rel="stylesheet" href="/resources/assets/css/owl.css">
    <link rel="stylesheet" href="/resources/assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
    
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!--

TemplateMo 579 Cyborg Gaming

https://templatemo.com/tm-579-cyborg-gaming

-->
 <script type="text/javascript">
 
//이벤트 바인딩 함수 ============================================================
	$(function() {
		/**
		 * [저장] 버튼 클릭
		 * @author 경성구
     	 * @since  2023-01-25
		 */
		$("#createBtn").click(function(e) {
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
		});
	});
		

 </script>
  </head>
<body>

  <!-- ***** Preloader Start ***** -->
  <div id="js-preloader" class="js-preloader">
    <div class="preloader-inner">
      <span class="dot"></span>
      <div class="dots">
        <span></span>
        <span></span>
        <span></span>
      </div>
    </div>
  </div>
  <!-- ***** Preloader End ***** -->

  <!-- ***** Header Area Start ***** -->
  <header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="/" class="logo">
                        <img src="/resources/assets/images/logo2.jpg" alt="">
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Search End ***** -->
                    
                    <!-- 
                    <div class="search-input">
                      <form id="search" action="#">
                        <input type="text" placeholder="Type Something" id='searchText' name="searchKeyword" onkeypress="handle" />
                        <i class="fa fa-search"></i>
                      </form>
                    </div>
                     -->
                    
                    <!-- ***** Search End ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                        <li><a href="/" class="active">Home</a></li>
                        <c:if test="${not empty sessionScope.pno}">
                        <li><a href="/post/postL?bbs_id=NOTICE">NOTICE</a></li>
                        <li><a href="/post/postL?bbs_id=FAQ">FAQ</a></li>
                        <li><a href="/post/postL?bbs_id=PHOTO">PHOTO</a></li>
                        <li><a href="/post/postL?bbs_id=RESERVATION">RESERVATION</a></li>
                        </c:if>
                        <c:choose>
						    <c:when test="${sessionScope.user_level == 1|| sessionScope.user_level == 2}">
		                        <li><a href="/user/userM?pno=${sessionScope.pno}">회원정보수정</a></li>
		                        <li><a href="/user/logout.do">${sessionScope.name} 님<img src="/resources/assets/images/profile-header.jpg" alt=""></a></li>
						    </c:when>
						    <c:when test="${sessionScope.user_level == 3}">
						    	<li><a href="/bbs/bbsM">SYSTEM</a></li>
		                        <li><a href="/user/userM?pno=${sessionScope.pno}">회원정보수정</a></li>
		                        <li><a href="/user/logout.do">${sessionScope.name} 님<img src="/resources/assets/images/profile-header.jpg" alt=""></a></li>
						    </c:when>
						    <c:otherwise>
		                        <li><a href="/user/userC">회원가입</a></li>
		                        <li><a href="/user/login" >LOGIN <img src="/resources/assets/images/profile-header.jpg" alt=""></a></li>
						    </c:otherwise>
						</c:choose>
                    </ul>   
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- ***** Menu End ***** -->
                </nav>
            </div>
        </div>
    </div>
  </header>
  <!-- ***** Header Area End ***** -->