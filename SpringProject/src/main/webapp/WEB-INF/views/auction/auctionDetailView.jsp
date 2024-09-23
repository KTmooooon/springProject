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
        <title>Shop Item - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${pageContext.request.contextPath }/css/st2.css" rel="stylesheet" />
        <style type="text/css">
        .rrred{
  			color: red;
  		}
  		.nbsppppp{
  			width: 500px;
  			overflow: hidden;
  		}
  		
  		.teduri{
  			border: 1px solid black;
  		}
  		
  		.green-btn{
  			background-color: green;
  			color: white;
  			font-weight: bold;
  			margin-left: 10px;
  			height: 40px;
  			width: 40px;
  		}
  		
  		.red-btn{
  			color: white;
  			background-color: red;
  			font-weight: bold; 
  			margin-left: 10px;
  		}
  		#bidList{
  			width: 100%;
  			height: 300px;
  			overflow: hidden;
  		}
  		
  		#ynalert{
  			visibility: hidden;
  		}
  		
        </style>
        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    </head>
    <body>
        <!-- Navigation-->
        <%@ include file="/WEB-INF/inc/navi.jsp" %>
        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="teduri col-md-5"><img class="card-img-top mb-5 mb-md-0" src="https://data1.pokemonkorea.co.kr/newdata/pokedex/mid/000401.png" alt="..." /></div>
                    <div class="teduri col-md-6 ">
                        <div class="small mb-5">등록일: ${keyAuction.aucDate }</div>
                        <h1 class="display-5 fw-bolder mb-5">${keyAuction.aucName }</h1>
                        <div class="fs-5 mb-5">
                            <span id="spanStartPrice" class="text-decoration-line-through">${keyAuction.startPrice }</span>
                            <span>원</span>
                            <span id="spanCurPrice">${keyAuction.curPrice }</span>
                            <span>원</span>
                            <span id="spanPercent" class="rrred">(${ Math.round((keyAuction.curPrice-keyAuction.startPrice) / keyAuction.startPrice * 100) }% ↑)</span>
                        </div>
                        <div class="nbsppppp lead mb-3" >${keyAuction.aucContent }
                        </div>
                        <div>
                        <form name="form" id="contactForm" method="POST" action="${pageContext.request.contextPath }/bidDo">
                        	<div class="d-flex mb-1"> 
                            <input class="form-control text-center me-3" id="inputBid" name="bidPrice" type="number" value="${keyAuction.curPrice + 100 }" style="max-width: 10rem" />
                            <p  id="alertOpenBtn" class=" btn btn-outline-dark flex-shrink-0">
                                <i class="bi-cart-fill me-1"></i>
                                입찰하기
                            </p>
                        	</div>
                        	<c:if test="${sessionScope.login == null}">
                            <div class="pt-1" style="color: red; font-weight: bold">로그인 후 이용가능</div>
                            </c:if>
                        	<c:if test="${sessionScope.login.memId == sessionScope.auctionMemId}">
                            <div class="pt-1" style="color: red; font-weight: bold">본인 물건엔 참여불가</div>
                            </c:if>
                        	<c:if test="${keyAuction.leftTime <= 0}">
                            <div class="pt-1" style="color: red; font-weight: bold">거래 종료</div>
                            </c:if>
                            <c:if test="${sessionScope.login.memId == keyAuction.lastBidId }">
                            <div class="pt-1" id="lastBid" style="color: red; font-weight: bold">이미 입찰한 건이 가장 유력합니다</div>
                            </c:if>
                            <div class="pt-1" id="lastBid" hidden style="color: red; font-weight: bold">이미 입찰한 건이 가장 유력합니다</div>
                        	<!-- alert 버튼 -->
                            <div class=" alert alert-danger d-flex " id="ynalert" >
                             
							  낙찰에 참여하시겠습니까 
							  <button ${sessionScope.login.memId == keyAuction.lastBidId ? "disabled" : "" } ${sessionScope.login == null || sessionScope.login.memId == sessionScope.auctionMemId ? "disabled" : "" } ${keyAuction.leftTime<=0 ? "disabled" : "" } class="green-btn btn btn-outline-dark flex-shrink-0" id="bidBtn" type="button" >예</button>
							  <p class="red-btn btn btn-outline-dark flex-shrink-0" id="alertCloseBtn">아니오</p> 
							</div>
							
							
                           </form>
                        </div>
                            
                        <div class="row pt-3">
					    	<div class="col">
						      입찰 id
						    </div>
						    <div class="col">
						      입찰 가격
						    </div>
						    <div class="col">
						      입찰 시간
						    </div>
					  </div>
					 
					  <div id="bidList">
					  <c:forEach items="${keyBidList }" var="bid">
					  	<div class="row pt-3">
					    	<div class="col">
						      ${bid.memId }
						    </div>
						    <div class="col">
						      ${bid.bidPrice }
						    </div>
						    <div class="col">
						      ${bid.bidDate }
						    </div>
					  	</div>
					  </c:forEach>
					  </div>
                    </div>
                </div>
            </div>
        </section>
        
        <%@ include file="/WEB-INF/inc/footer.jsp" %>
        <script type="text/javascript">
        	let v_bidBtn = document.getElementById('bidBtn')
        	let v_contactForm = document.getElementById('contactForm');
        	let scp = document.getElementById('spanCurPrice');
        	let ssp = document.getElementById('spanStartPrice');
        	let sp = document.getElementById('spanPercent');
        	
        	let v_ynalert = document.getElementById('ynalert');
        	let v_alertOpenBtn = document.getElementById('alertOpenBtn');
        	let v_alertCloseBtn = document.getElementById('alertCloseBtn');
        	let a = 0; // ajax로 일시적으로 보유금액 나타내기
        	
        	let v_navMoney = document.getElementById('navMoney');
        	
        	
        	
        	v_alertOpenBtn.addEventListener('click',()=>{
        		v_ynalert.style.visibility = "visible"	;
        	})
        	v_alertCloseBtn.addEventListener('click',()=>{
        		v_ynalert.style.visibility = "hidden"	
        	})
        	
        	
        	
        	v_bidBtn.addEventListener('click', () => {
                let iscp = parseInt(scp.innerHTML);
                let issp = parseInt(ssp.innerHTML);
                
                let v_inputBid = $('#inputBid');
                
                if (parseInt(v_inputBid.val()) < iscp + 100) {
                    alert('현재 가격보다 100원 높은 가격으로만 입찰 가능합니다.');
                }else {
                
                    let v_contactForm = $('#contactForm');
                    let v_url = v_contactForm.attr('action');
                    let v_formData = v_contactForm.serialize();
                    
                    v_ynalert.style.visibility = "hidden"
                    
                    $.ajax({
                        type: 'POST',
                        url: v_url,
                        data: v_formData,
                        success: function(data) {
                        	console.log(data)
                        	
                        	if(data.bidPrice - data.preBid > ${sessionScope.login.money}){
                        		alert('보유금액이 부족합니다!')
                        	}else{
                        		
                        		 let v_bidList = document.getElementById('bidList');
                                 
                                 let v_alpha = '<div class="row pt-3"><div class="col">' + data.memId;
                                 v_alpha += '</div><div class="col">' + data.bidPrice + '</div><div class="col">' + data.bidDate + '</div></div>';
                                 
                                 v_bidList.innerHTML = v_alpha + v_bidList.innerHTML;
                                 v_inputBid.val( data.bidPrice + 100);  
                                 
                                 scp.innerHTML = data.bidPrice;
                                 sp.innerHTML ="(" + Math.round((data.bidPrice - issp) / issp * 100) + "% ↑)";
                                 
                                 
                                 
                                 v_navMoney.innerHTML = ${sessionScope.login.money } + a - data.bidPrice + data.preBid + "&#129689";
                                 a += data.preBid - data.bidPrice // 뒤에 놔야함	
                                 
                                 document.getElementById('lastBid').outerHTML = '<div class="pt-1" id="lastBid" style="color: red; font-weight: bold">이미 입찰한 건이 가장 유력합니다</div>'
                                 document.getElementById('bidBtn').outerHTML = '<button disabled class="green-btn btn btn-outline-dark flex-shrink-0" id="bidBtn" type="button" >예</button>'
                        	}
                        	
                        	
                           
                        }
                    });
                }
            });
        	
        	
        	
        </script>
    </body>
</html>
