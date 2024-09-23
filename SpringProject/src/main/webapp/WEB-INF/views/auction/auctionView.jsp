<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Auction</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${pageContext.request.contextPath }/css/st.css" rel="stylesheet" />
        
        <style type="text/css">
        .time-check{
        	color: red;
        	cursor: pointer;
        }
        
        .rrred{
        	color: red;
        }
        
        .img-sg{
        	width: 100%;
        	height: 45%;
        }
       
        
        </style>
        
        
    </head>
    <body>
        <!-- Navigation-->
        
		<%@ include file="/WEB-INF/inc/navi.jsp" %>
        <!-- Header-->
        <header class="bg-dark py-2">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Shop in style</h1>
                    <div class=" d-flex justify-content-center pt-5">
                    	<a href="${pageContext.request.contextPath }/auctionWriteView">
                    		<button class="btn btn-primary btn-xl ">상품 등록</button>
                    	</a>
                    </div>
                </div>
            </div>
            
            
          
        </header>
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 ">
                    
                    
                    
                    
                    
                    
                    <c:forEach items="${keyAucList }" var="auc">
                    
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                             
                            <div class="badge bg-dark text-white position-absolute badge-time" style="top: 0.5rem; right: 0.5rem"></div>
                            
                            <!-- Product image-->
                            <img class="card-img-top img-sg" src="${pageContext.request.contextPath }/assets${auc.aucImg}" alt="" />   
                            <!-- Product details-->    
                            <div class="card-body p-4">  
                                <div class="text-center"> 
                                	<div class="time-check"></div>  
                                	
                                	<c:if test="${auc.leftTime <= 0  && auc.lastBidId != null }">
                                	<div style="color: green; font-weight: bold;">낙찰ID = ${auc.lastBidId }</div>
                                	</c:if>
                                	
                                	<div class="start-time" hidden>${auc.leftTime }</div>
                                	
                                	<div class="find-auc-id" style="display: none;">${auc.aucId }</div> 
                                	
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${auc.aucName }</h5>
                                    <!-- Product reviews-->
                                    
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">${auc.startPrice }원</span>
                                    ${auc.curPrice }원
                                    <div class="rrred">(${ Math.round((auc.curPrice-auc.startPrice) / auc.startPrice * 100) }%↑)</div>
                                </div>
                            </div> 
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="${pageContext.request.contextPath }/auctionDetailView?aucId=${auc.aucId}">참여하기</a></div>
                            </div>
                        </div>
                    </div>
                    
                    
                    </c:forEach>
                    
                    
                    
                    
                    
                    
                    
                    
                </div>
            </div>
        </section>
        
		<%@ include file="/WEB-INF/inc/footer.jsp" %>
		
		<script type="text/javascript">
		
			let v_badgeTime = document.getElementsByClassName('badge-time')
			
			let v_findAucId = document.getElementsByClassName('find-auc-id');
			let v_timeCheck = document.getElementsByClassName('time-check');
			let v_startTime = document.getElementsByClassName('start-time');
			let dif = 0;
		
		function updateT(){
			for(let i = 0; i < v_timeCheck.length ; i ++){
				
				function timeLeft(i,h){
					
					let v_alpha = v_startTime[i].innerHTML -dif ;
					
					if(v_alpha >= 0){
						
						let v_day = Math.floor((v_alpha) / (3600000 * 24)) + "";
						let v_hour = Math.floor((v_alpha %(3600000*24)) / 3600000) + "";
						let v_min = Math.floor(((v_alpha %(3600000*24)) % 3600000) / 60000) + "";
						
						let v_sec = Math.floor(((v_alpha %(3600000*24)) % 3600000) % 60000 / 1000) + "";
						
						
						v_timeCheck[i].innerHTML = v_day.padStart(2,'0') + "일 " + v_hour.padStart(2,'0') + "시간 " + v_min.padStart(2,'0') + "분 " + v_sec.padStart(2,'0') + "초 ";
					}else{
						v_timeCheck[i].innerHTML = "종료"
					}
					
					
					if(v_alpha <= 0){
						v_badgeTime[i].outerHTML = '<div class="badge bg-light  text-black position-absolute badge-time" style="top: 0.5rem; right: 0.5rem">종료!</div>'
							
					}else if(v_alpha <= 2*1000*60*60){
						v_badgeTime[i].outerHTML = '<div class="badge bg-dark text-white position-absolute badge-time" style="top: 0.5rem; right: 0.5rem">마감 임박!</div>'
					}else{
						v_badgeTime[i].outerHTML = '<div class="badge bg-light  text-black position-absolute badge-time" style="top: 0.5rem; right: 0.5rem">진행중~</div>'
					}
					
				}
				timeLeft(i,v_timeCheck[i].innerHTML);
			}
			dif += 1000;
		}
		
		window.onload = updateT;
		
		setInterval(updateT,1000);
		</script>

    </body>
</html>
