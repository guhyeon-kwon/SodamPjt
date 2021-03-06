<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>가게등록</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/storeAdd.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
.required-star {
	color: red;
	font-weight: bolder;
}
</style>

<title>가게 등록</title>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>

	<div class="container_1">
		<h1 class="title-name">가게 등록</h1>
	</div>

	<form id="store-form" action='/store/add' method='post' enctype="multipart/form-data" accept-charset="UTF-8">
		<div class="container mt-5">
			<div class="row">
				<div class="col-sm-12">
					<div class="d-flex justify-content-center">
						<div class="col-sm-2">
							<p class="text-left" style="padding: 7px;">
								<font class="required-star">*</font>상호명
							</p>
							<p class="text-left" style="padding: 7px;">
								<font class="required-star">*</font>전화번호
							</p>
							<p class="text-left"
								style="padding-bottom: 77px; padding-left: 7px; padding-top: 5px;">
								<font class="required-star">*</font>주소
							</p>
							<p class="text-left" style="padding: 7px;">
								<font class="required-star">*</font>업종
							</p>
							<p class="text-left" style="padding: 7px;">
								<font class="required-star">*</font>영업시간
							</p>
							<p class="text-left" style="padding: 7px;">이미지</p>
							<p class="text-left" style="padding: 7px;">가게소개</p>
						</div>
						<div class="col-sm-6">
							<p>
								<input type="text" name="sname" class="form-control text-center"
									id="exampleFormControlInput1" placeholder="상호명"
									style="width: 500px">
							</p>
							<p>
								<input type="text" name="stel" class="form-control text-center"
									id="exampleFormControlInput2" placeholder="전화번호"
									style="width: 500px">
							</p>
							<div style="margin-bottom: 10px;">
								<input type="text" class="text-center" id="sample6_postcode"
									placeholder="우편번호" style="width: 200px"> <input
									type="button" onclick="sample6_execDaumPostcode()" value="찾기"
									style="width: 100px"><br>
							</div>
							<div style="margin-bottom: 10px;">
								<input type="text" name="saddr" class="text-center"
									id="sample6_address" placeholder="주소" style="width: 300px">
								<input type="text" name="s_det_addr" class="text-center"
									id="sample6_detailAddress" placeholder="상세주소"
									style="margin-left: 15px; width: 180px">
							</div>
							<div style="margin-bottom: 20px;">
								<input type="text" class="text-center" id="sample6_extraAddress"
									placeholder="참고항목" style="width: 200px">
							</div>
							
							 <div style="margin-top: 10px; margin-bottom: 10px; padding: 0px;">
							<c:forEach items="${list}" var="c">
									<input type="checkbox" name="categoryName" value="${c.ctno }">${c.ctname }
							</c:forEach>
							</div>
							 
							<p>
								<input type="time" name="sdt" class="text-center"
									id="exampleFormControlInput1" placeholder="영업시간"
									style="width: 250px"> ~ <input type="time" name="edt"
									class="text-center" id="exampleFormControlInput1"
									placeholder="영업시간" style="width: 250px">
							</p>  
							<div>
								<input type="file" name="upload_image" accept="image/*">
							</div>
							<p>
								<textarea name="sint" class="form-control text-center"
									id="exampleFormControlInput1" placeholder="가게소개"
									style="width: 500px"></textarea>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container_1" style="padding: 0px;"></div>
		<div class="container mt-5">
			<div class="row">
				<div class="col-sm-12">
					<div class="d-flex justify-content-center">
						<div class="col-sm-2">
							<p class="text-left">
								<font class="required-star">*</font>이용약관동의
							</p>
						</div>
						<div class="container" style="padding: 0px;">
							<input type="radio"
								style="width: 30px; height: 30px; border: 1px;">전체
							동의합니다.
						</div>
					</div>
				</div>
			</div>
		</div>
		<div>
			<button type="submit" class="btn btn-outline-warning btn-lg"
				style="margin: 10px;" form="store-form">가게 등록</button>
			<button type="button" class="btn btn-warning btn-lg">목록으로</button>
		</div>
	</form>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>
</html>