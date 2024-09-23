<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content />
        <meta name="author" content />
        <title>로그인</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Custom Google font-->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@100;200;300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${pageContext.request.contextPath }/css/styles.css" rel="stylesheet" />
    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">
            
			<%@ include file="/WEB-INF/inc/navi.jsp" %>

            <!-- Page content-->
            <section class="py-5">
                <div class="container px-5">
                    <!-- Contact form-->
                    <div class="bg-light rounded-4 py-5 px-4 px-md-5">
                        <div class="text-center mb-5">
                            <div class="feature bg-primary bg-gradient-primary-to-secondary text-white rounded-3 mb-3"><i class="bi bi-envelope"></i></div>
                            <h1 class="fw-bolder">로그인</h1>
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                                <!-- * * * * * * * * * * * * * * *-->
                                <!-- * * SB Forms Contact Form * *-->
                                <!-- * * * * * * * * * * * * * * *-->
                                <!-- This form is pre-integrated with SB Forms.-->
                                <!-- To make this form functional, sign up at-->
                                <!-- https://startbootstrap.com/solution/contact-forms-->
                                <!-- to get an API token!-->
                                <form id="contactForm" method="POST" action="${pageContext.request.contextPath }/loginDo">
                                
                                	<input type="hidden" value="${fromUrl }" name="fromUrl">
                                
                                    <!-- 아이디 -->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputId" name="memId" type="text" value="${cookie.rememberId.value }" />
                                        <label for="inputId">ID</label>
                                    </div>
                                    <!-- 비밀번호 -->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputPassword" name="memPassword" type="password" />
                                        <label for="inputPassword">PASSWORD</label>
                                    </div>
                                    
                                    <div class="form-check mb-3">
                                    	<input class="form-check-input" type="checkbox" id="rememberInputId" name="rememberId" ${cookie.rememberId.value != null ? "checked" : "" }>
                                    	<label for="rememberInputId" class="form-check-label"> 아이디 기억하기</label>
                                    </div>
                                   
                                    <!-- Submit Button-->
                                    <div class="d-grid"><button class=" btn btn-primary btn-lg" id="submitButton" type="submit">로그인</button></div>
                                    
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                
            </section>
        </main>
        <%@ include file="/WEB-INF/inc/footer.jsp" %>
    </body>
</html>
