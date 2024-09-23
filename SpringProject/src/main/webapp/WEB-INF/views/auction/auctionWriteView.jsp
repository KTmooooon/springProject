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
<title>Shop Item - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/css/st2.css"
	rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
.img-ho {
	cursor: pointer;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/inc/navi.jsp"%>


	<!-- Product section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-6">
					<img id="inputBox" class="img-ho card-img-top mb-5 mb-md-0"
						src="https://dummyimage.com/500x500/dee2e6/6c757d.jpg" alt="..." />
				</div>
				<div class="col-md-6">
					<form id="contactForm" method="POST"
						action="${pageContext.request.contextPath }/auctionWriteDo"
						enctype="multipart/form-data">
						<input hidden id="inputImg" type="file" name="file"
							accept="image/*" required>
						<!-- 상품명 -->
						<div class="form-floating mb-3">
							<input class="form-control" id="inputAucName" name="aucName"
								type="text" /> <label for="inputAucName">상품명</label>
						</div>
						<!-- 상품설명 -->
						<div class="form-floating mb-3">
							<input class="form-control" id="inputAucContent"
								name="aucContent" type="textarea" style="height: 20rem" /> <label
								for="inputAucContent">상품설명</label>
						</div>
						<!-- 시작가격 -->
						<div class="form-floating mb-3">
							<input class="form-control" id="inputStartPrice"
								name="startPrice" type="number" /> <label
								for="inputStartPrice">시작 가격</label>
						</div>
						<div class="form-floating mb-3">
							<input class="form-control" id="inputAucDuration"
								name="aucDuration" type="number" /> <label
								for="inputAucDuration">기한(시간)</label>
						</div>


						<!-- Submit Button-->
						<div class="d-grid">
							<button class=" btn btn-primary btn-lg" id="submitButton"
								type="submit">상품 등록</button>
						</div>

					</form>

				</div>
			</div>
		</div>
	</section>


	<%@ include file="/WEB-INF/inc/footer.jsp"%>
	<script type="text/javascript">
		document.getElementById('inputBox').addEventListener('click',()=>{
			document.getElementById('inputImg').click();
		});
		
		 
		</script>
	<script type="text/javascript">
	 $(document).ready(function() {
	        $('#inputImg').on('change', function() {  // 여기 수정
	            const file = this.files[0];
	            if (file) {
	                const reader = new FileReader();
	                reader.onload = function(e) {
	                    $('#inputBox').attr('src', e.target.result);  // 여기 수정
	                }
	                reader.readAsDataURL(file);

	                // AJAX로 이미지 업로드
	                const formData = new FormData();
	                formData.append('image', file);

	                $.ajax({
	                    url: '${pageContext.request.contextPath}/upload', // 스프링 서버의 업로드 엔드포인트
	                    type: 'POST',
	                    data: formData,
	                    processData: false,
	                    contentType: false,
	                    success: function(response) {
	                        console.log('이미지 업로드 성공:', response);
	                    },
	                    error: function(xhr, status, error) {
	                        console.error('이미지 업로드 실패:', error);
	                    }
	                });
	            }
	        });
	    });
		</script>
</body>
</html>
