<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>마이페이지</title>
<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/css/ststst.css"
	rel="stylesheet" />


<style type="text/css">
.margin-rt {
	margin-right: 25px;
	margin-bottom: 20px;
}

.bg-c {
	background-color: black;
	color: white;
}

.c-b {
	color: black;
}

.tab-size{
	width: 100%;
}

.row-size{
	height: 50px;
} 

.div-si{
	height: 800px;
	overflow-y: scroll;
}
</style>


</head>
<body id="page-top">
	<%@ include file="/WEB-INF/inc/navi.jsp"%>

	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-c fixed-top"
		id="sideNav">
		<a class="navbar-brand js-scroll-trigger" href="#page-top"> </a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="#buy">입찰현황</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="#sell">판매현황</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="#experience">보유금 거래내역</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="#education">정보수정</a></li>
			</ul>
		</div>
	</nav>
	<!-- Page Content-->
	<div class="container-fluid p-0">

		<!-- About-->
		<section class="resume-section" id="buy">
			<div class="resume-section-content">
				<h1 class="mb-5">입찰 현황</h1>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i>
					</div>




					<table class="table card-body cart-box" style="font-weight: bold;">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col"></th>
								<th scope="col">시작가격</th>
								<th scope="col">현재가격</th>
								<th scope="col">내 입찰가격</th>
								<th scope="col">내 마지막 입찰시간</th>
								<th scope="col">현재상황</th>
								<th scope="col">바로가기</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${keyIntList }" var="idx">
								<tr>
									<th scope="row">${idx+1 }</th>
									<td style="width: 120px;"><img
										style="width: 95%; height: 95%" id="cartImg" alt=""
										src="https://data1.pokemonkorea.co.kr/newdata/pokedex/mid/000701.png"></td>
									<td>${keyAuctionList[idx].getStartPrice() }</td>
									<td class="cur-price">${keyAuctionList[idx].getCurPrice() }</td>
									<td class="bid-price">${keyCartBid[idx].getBidPrice()}</td>
									<td>${keyCartBid[idx].getBidDate()}</td>
									<div class="left-time" hidden>${keyAuctionList[idx].getLeftTime() }</div>
									<td><p class="timer"
											style="color: red; font-weight: bold;">남은시간</p> <span
										class="span-result"></span></td>
									<td><a class="btn btn-outline-dark mt-auto"
										href="${pageContext.request.contextPath }/auctionDetailView?aucId=${keyAuctionList[idx].getAucId()}">바로가기</a>

									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>



				</div>
			</div>
		</section>
		<section class="resume-section" id="sell">
			<div class="resume-section-content">
				<h1 class="mb-5">
					판매 <span class="c-b">현황</span>
				</h1>
				<div
					class="d-flex row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4">
					<c:forEach items="${keySellList }" var="sell">

						<div class=" col card margin-rt" style="width: 15rem;">
							<img
								src="https://data1.pokemonkorea.co.kr/newdata/pokedex/mid/002701.png"
								class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">${sell.aucName }</h5>
								<p class="card-text">시작가 : ${sell.startPrice }</p>
								<p class="card-text">
									현재가: <span style="color: red; font-weight: bold;">${sell.curPrice }</span>
								</p>
								<p class="card-text" style="color: red; font-weight: bold;">${sell.finYn == "Y" ? "종료" : "진행중" }
								</p>
							</div>
						</div>


					</c:forEach>

				</div>
			</div>
		</section>
		<hr class="m-0" />
		<!-- Experience-->
		<section class="resume-section" id="experience">
			<div class="div-si resume-section-content"  >
				<h2 class="d-flex justify-content-center mb-5">보유금 거래내역</h2>
				<table class="table table-dark table-striped-columns tab-size" >
					<thead>
						<tr>
							<th scope="col">.</th>
							<th scope="col">잔액</th>
							<th scope="col">입금</th>
							<th scope="col">출금</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th class="row-size" scope="row">날짜</th>
							<td>입금</td>
							<td>출금</td>
							<td>잔액</td>
						</tr>
						
						
					</tbody>

				</table>

			</div>
		</section>
		<hr class="m-0" />
		<!-- Education-->
		<section class="d-block resume-section" id="education">
			<h1 class="mb-5">정보 수정</h1>
			<form id="contactForm" method="POST"
				action="${pageContext.request.contextPath }/editDo">

				<!-- 아이디 -->
				<div class="form-floating mb-3">
					<input class="form-control" id="inputId"
						value="${sessionScope.login.memId }" disabled name="id"
						type="text" /> <label for="inputId">ID</label>
				</div>
				<!-- 비밀번호 -->
				<div class="form-floating mb-3">
					<input class="form-control" id="inputPassword" name="password"
						type="password" value="${sessionScope.login.memPassword }" /> <label for="inputPassword">PASSWORD</label>
				</div>
				<!-- 닉네임 -->
				<div class="form-floating mb-3">
					<input class="form-control" id="inputName" name="name" type="text" value="${sessionScope.login.memName }" />
					<label for="inputName">NAME</label>
				</div>
				<!-- Phone number input-->
				<div class="form-floating mb-3">
					<input class="form-control" id="inputPhone" type="tel" name="phone" value="${sessionScope.login.memPhone }" />
					<label for="inputPhone">PHONE</label>
				</div>
				<!-- Email address input-->
				<div class="form-floating mb-3">
					<input class="form-control" id="inputEmail" name="email"
						type="email" value="${sessionScope.login.memEmail }" /> <label for="inputEmail">EMAIL</label>
					<div class="invalid-feedback" data-sb-feedback="email:email">Email
						is not valid.</div>
				</div>


				<!-- Submit Button-->
				<div class="d-grid">
					<button ${mem_ } class=" btn btn-primary btn-lg" id="submitButton"
						type="submit">정보 수정</button>
				</div>

			</form>
		</section>
		<hr class="m-0" />

	</div>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="${pageContext.request.contextPath }/js/scr.js"></script>
	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<script type="text/javascript">
		v_leftTime = document.getElementsByClassName('left-time');
		v_timer = document.getElementsByClassName('timer');
		v_badgeTime = document.getElementsByClassName('span-result');
		let dif = 0;

		function updateT() {
			for (let i = 0; i < v_timer.length; i++) {

				function timeLeft(i, h) {

					let v_alpha = v_leftTime[i].innerHTML - dif;

					if (v_alpha >= 0) {

						let v_day = Math.floor((v_alpha) / (3600000 * 24)) + "";
						let v_hour = Math
								.floor((v_alpha % (3600000 * 24)) / 3600000)
								+ "";
						let v_min = Math
								.floor(((v_alpha % (3600000 * 24)) % 3600000) / 60000)
								+ "";

						let v_sec = Math
								.floor(((v_alpha % (3600000 * 24)) % 3600000) % 60000 / 1000)
								+ "";

						v_timer[i].innerHTML = v_day.padStart(2, '0') + "일 "
								+ v_hour.padStart(2, '0') + "시간 "
								+ v_min.padStart(2, '0') + "분 "
								+ v_sec.padStart(2, '0') + "초 ";
					} else {
						v_timer[i].innerHTML = "종료"
					}

					if (v_alpha <= 0) {
						v_badgeTime[i].innerHTML = '종료!'

					}

				}
				timeLeft(i, v_timer[i].innerHTML);
			}
			dif += 1000;
		}

		window.onload = updateT;

		setInterval(updateT, 1000);
	</script>


</body>
</html>
