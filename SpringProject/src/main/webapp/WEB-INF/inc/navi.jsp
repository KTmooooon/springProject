<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Navigation-->
            <nav class="navbar navbar-expand-lg navbar-light bg-white py-3">
                <div class="container px-5">
                    <a class="navbar-brand" href="${pageContext.request.contextPath }/"><span class="fw-bolder text-primary">경매사이트</span></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0 small fw-bolder">
                            
                            
                            <c:if test="${sessionScope.login != null }">
                            <li class="nav-item"><a id="navMoney" class="nav-link" href="#" }/myPageView">${sessionScope.login.money } &#129689</a></li>
                           	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/auctionView">상품</a></li>
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/myPageView">마이페이지</a></li>
                            <li class="nav-item"><a class="nav-link" href="#">${sessionScope.login.memName } 님</a></li>
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/logoutDo">로그아웃</a></li>
                            </c:if>
                            <c:if test="${sessionScope.login == null }">
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/auctionView">상품</a></li>
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/loginView">로그인</a></li>
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/registView">회원가입</a></li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </nav>