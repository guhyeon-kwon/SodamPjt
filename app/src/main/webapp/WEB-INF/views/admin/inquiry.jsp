<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
<title>Oculux | Form Drag & Drop</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="description" content="Oculux Bootstrap 4x admin is super flexible, powerful, clean &amp; modern responsive admin dashboard with unlimited possibilities.">
<meta name="author" content="GetBootstrap, design by: puffintheme.com">

<link rel="icon" href="favicon.ico" type="image/x-icon">
<!-- VENDOR CSS -->
<link rel="stylesheet" href="/oculux/assets_vendor/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/oculux/assets_vendor/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="/oculux/assets_vendor/vendor/animate-css/vivify.min.css">

<link rel="stylesheet" href="/oculux/assets_vendor/vendor/dropify/css/dropify.min.css">

<link rel="stylesheet" href="/oculux/assets_vendor/vendor/jquery-datatable/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="/oculux/assets_vendor/vendor/jquery-datatable/fixedeader/dataTables.fixedcolumns.bootstrap4.min.css">
<link rel="stylesheet" href="/oculux/assets_vendor/vendor/jquery-datatable/fixedeader/dataTables.fixedheader.bootstrap4.min.css">

<link rel="stylesheet" href="/oculux/assets_vendor/vendor/sweetalert/sweetalert.css"/>

<!-- MAIN CSS -->
<link rel="stylesheet" href="/oculux/assets/css/site.min.css">

</head>
<body class="theme-cyan font-montserrat light_version theme-orange">
	<!-- Page Loader -->
	<div class="page-loader-wrapper">
		<div class="loader">
			<div class="bar1"></div>
			<div class="bar2"></div>
			<div class="bar3"></div>
			<div class="bar4"></div>
			<div class="bar5"></div>
		</div>
	</div>

	<!-- Overlay For Sidebars -->
	<div class="overlay"></div>
	<div id="wrapper">
	
		<jsp:include page="../include/admin_nav.jsp"></jsp:include>
		
		<div id="main-content">
			<div class="container-fluid">
				<div class="block-header">
					<div class="row clearfix">
						<div class="col-md-6 col-sm-12">
							<h1>문의사항 관리</h1>
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#">소담소담</a></li>
									<li class="breadcrumb-item active" aria-current="page">문의사항</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>

				<div class="row clearfix">
					<div class="col-lg-12">
						<div class="card">
							<table class="table table-hover js-basic-example dataTable table-custom spacing5">
                                    <thead>
                                        <tr>
                                            <th class="col-3">제목</th>
                                            <th class="col-3">문의유형</th>
                                            <th class="col-3">등록일</th>
                                            <th class="col-3">처리상태</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="item" items="${list}">
                                    		<c:choose>
												<c:when test="${item.qtype == '0'}">
													<c:set var="qtype" value="배송" />
												</c:when>
												<c:when test="${item.qtype == '1'}">
													<c:set var="qtype" value="포인트" />
												</c:when>
												<c:when test="${item.qtype == '2'}">
													<c:set var="qtype" value="결제/환불" />
												</c:when>
												<c:when test="${item.qtype == '3'}">
													<c:set var="qtype" value="쿠폰" />
												</c:when>
												<c:when test="${item.qtype == '4'}">
													<c:set var="qtype" value="상품문의" />
												</c:when>
												<c:when test="${item.qtype == '5'}">
													<c:set var="qtype" value="기타" />
												</c:when>
											</c:choose>
											<c:choose>
												<c:when test="${item.qstatus == '0'}">
													<c:set var="qstatus" value="처리중" />
												</c:when>
												<c:when test="${item.qstatus == '1'}">
													<c:set var="qstatus" value="처리완료" />
												</c:when>
											</c:choose>
	                                    	<tr>
	                                            <td><a href="/admin/inquiry_write?qno=${item.qno }">${item.title}</a></td>
	                                            <td>${qtype}</td>
	                                            <td>${item.col}</td>
	                                            <td>${qstatus}</td>
	                                        </tr>
                                    	</c:forEach>
                                    </tbody>
                                </table>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

<!-- Javascript -->
<script src="/oculux/assets/bundles/libscripts.bundle.js"></script>    
<script src="/oculux/assets/bundles/vendorscripts.bundle.js"></script>

<script src="/oculux/assets_vendor/vendor/sweetalert/sweetalert.min.js"></script>
<script src="/oculux/assets_vendor/vendor/dropify/js/dropify.js"></script>
<script src="/oculux/assets/bundles/mainscripts.bundle.js"></script>
<script src="/oculux/assets/js/pages/forms/dropify.js"></script>
<script src="/oculux/assets/js/pages/tables/table-filter.js"></script>
<script src="/oculux/assets/js/pages/ui/dialogs.js"></script>

<script src="/oculux/assets/bundles/datatablescripts.bundle.js"></script>
<script src="/oculux/assets_vendor/vendor/jquery-datatable/buttons/dataTables.buttons.min.js"></script>
<script src="/oculux/assets_vendor/vendor/jquery-datatable/buttons/buttons.bootstrap4.min.js"></script>
<script src="/oculux/assets_vendor/vendor/jquery-datatable/buttons/buttons.colVis.min.js"></script>
<script src="/oculux/assets_vendor/vendor/jquery-datatable/buttons/buttons.html5.min.js"></script>
<script src="/oculux/assets_vendor/vendor/jquery-datatable/buttons/buttons.print.min.js"></script>
<script src="/oculux/assets/js/pages/tables/jquery-datatable.js"></script>
<script type="text/javascript">
		
</script>
</body>
</html>


