<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>소담소담</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/storeDetail.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<div class="container mt-5"
		style="height: 260px; overflow: hidden; position: relative;">
		<h2 id="title-name">${store.sname }</h2>
		<img src="/filestorepath/${store.sphoto}" width="100%">
	</div>
	<div class="container mt-5" style="min-height: calc(100vh - 450px);">
		<div class="container-fluid">
			<h3>상품목록</h3>
			<div class="row">
				<c:forEach var="item" items="${product}" varStatus="status">
					<div class="col-4">
						<div class="card mb-3">
							<div class="card-img-top" style="border: 1px solid light-gray;">

								<img class="card-img-top" src="/fileproductpath/${item.photo}"
									alt="Card image cap" height="229">
								<div class="card-body">
									<h5 class="card-title"
										style="max-height: 50px; margin-top: 11px; font-size: 16px;">
										<a href="/product/detail?pno=${item.pno}">${item.pname}</a>
									</h5>
									<p class="card-text"
										style="padding-top: 6px; font-weight: 700; font-size: 16px; line-height: 20px;">${item.price}</p>
									<button type="button" class="btn btn-outline-primary"
										onclick="addBasket(${item.pno})">장바구니</button>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
<script src="https://kit.fontawesome.com/d1fe297f63.js"
	crossorigin="anonymous"></script>
<script src="js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/typed.js@2.0.11"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/d1fe297f63.js"
	crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
		const addBasket = (no) => {
			$.post("/basket/insert", {
				pno : no,
				bcnt : 1
			}).done((data) => {
				swal({
					  title: "감사합니다!",
					  text: "장바구니에 상품을 담았습니다.",
					  icon: "success",
					  button: "닫기",
					})
			})
		}
	</script>
</html>