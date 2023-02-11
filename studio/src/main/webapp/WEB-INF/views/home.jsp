<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<%@include file="includes/header.jsp"%>

  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="page-content">

          <!-- ***** Banner Start ***** -->
          <div class="main-banner">
            <div class="row">
              <div class="col-lg-7">
                <div class="header-text">
                  <h6>Welcome To Studio</h6>
                  <h4><em>강남역에 뜬 별</em><br> Photo Studio</h4>
                  <div class="main-button">
                  <c:choose>
				    <c:when test="${not empty sessionScope.pno}">
						    <a href="/post/postL?bbs_id=RESERVATION">예약 신청</a>
				    </c:when>
				    <c:otherwise>
						    <a href="/user/userC">회원가입 후 사이트를 이용하실 수 있습니다</a>
				    </c:otherwise>
				  </c:choose>	
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- ***** Banner End ***** -->

          <!-- ***** Most Popular Start ***** -->
          <div class="most-popular">
            <div class="row">
              <div class="col-lg-12">
                <div class="heading-section">
                  <h4><em>사진</em> PHOTO</h4>
                </div>
                <div class="row">
                  <c:forEach items="${photo}" var="photo">
                  <div class="col-lg-3 col-sm-6">
                    <div class="item">
                      <img src="/resources/assets/images/photo.jpg" alt="">
                      <h4>${photo.subject}<br><span>${photo.create_date}</span></h4>
                      <ul>
                        <li><i class="fa fa-star"></i> ${photo.read_cnt}</li>
                        <li><i class="fa fa-download"></i> ${photo.writer}</li>
                      </ul>
                    </div>
                  </div>
                  </c:forEach>
                  <div class="col-lg-12">
                    <div class="main-button">
                      <a href="/post/postL?bbs_id=PHOTO">더보기</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- ***** Most Popular End ***** -->

          <!-- ***** Gaming Library Start ***** -->
          <div class="gaming-library">
            <div class="col-lg-12">
              <div class="heading-section">
                <h4><em>직원</em> EMPLOYEE</h4>
              </div>
              <div class="item">
                <ul>
                  <li><img src="/resources/assets/images/employee.jpg" alt="" class="templatemo-item"></li>
                  <li><h4>김혜진</h4><span>NAME</span></li>
                  <li><h4>010-4464-0425</h4><span>PHONE</span></li>
                  <li><h4>TEST @ naver.com</h4><span>E-MAIL</span></li>
                  <li><h4>촬영-보정</h4><span>WORK</span></li>
                  <li><div class="main-border-button"><a href="/post/postC?bbs_id=RESERVATION">Reservation</a></div></li>
                </ul>
              </div>
              <div class="item">
                <ul>
                  <li><img src="/resources/assets/images/employee2.jpg" alt="" class="templatemo-item"></li>
                  <li><h4>경성구</h4><span>NAME</span></li>
                  <li><h4>010-9911-8334</h4><span>PHONE</span></li>
                  <li><h4>tjdrn4023 @ naver.com</h4><span>E-MAIL</span></li>
                  <li><h4>촬영-보정</h4><span>WORK</span></li>
                  <li><div class="main-border-button"><a href="/post/postC?bbs_id=RESERVATION">Reservation</a></div></li>
                </ul>
              </div>
              <div class="item last-item">
                <ul>
                  <li><img src="/resources/assets/images/employee3.jpg" alt="" class="templatemo-item"></li>
                  <li><h4>손흥민</h4><span>NAME</span></li>
                  <li><h4>010-1234-5678</h4><span>PHONE</span></li>
                  <li><h4>TEST @ gmail.com</h4><span>E-MAIL</span></li>
                  <li><h4>촬영-보정</h4><span>WORK</span></li>
                  <li><div class="main-border-button border-no-active"><a href="#">출장</a></div></li>
                </ul>
              </div>
            </div>
          </div>
          <!-- ***** Gaming Library End ***** -->
        </div>
      </div>
    </div>
  </div>

<%@include file="includes/footer.jsp"%>