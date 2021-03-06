<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="ctx" value="${pageContext.request.servletContext.contextPath }" />
<%-- <!DOCTYPE html>
<!-- -------------------------Head---------------------------------  -->
<head><!-- 헤드에 css를 참조하는 이유  -->
<meta charset="UTF-8">
<!-- head title  -->
<title>infoList</title>

<link href="${ctx}/css/styleList.css" type="text/css" rel="stylesheet"/>
</head>
 --%>
<!-- -------------------------body---------------------------------- -->

	<!-- ------------------------------------body main 영역 시작------------------------------------------ -->
	<main id=top>
	
	<!-- ----------------------------------------body 메인페이지-------------------------------------------------- -->

	<section>
		<h1 class="hidden">상품정보</h1>

		<section>
			<h1 class="hidden">상품정보 메인</h1>
			<div>
				<div class="box box-mainimg"></div>
			</div>
			<div class="btn-heart"></div>
			<div class="box box-main-content">
				<table class="">
					<tr class="">
						<td style="font-size: 10px; font-style: italic;">
						핸드메이드 > ${product.categoryName}</td>
					</tr>
					<tr>
						<td style="font-size: 20px">
						${product.name}
						<!-- 석고방향제 가성비 짱_고급스러움을 한껏 담아 맞춤 제작 해 드립니다. --></td>
					</tr>
					</br>
					<tr>
						<td style="font-size: 20px; font-weight: bold">￦${product.price}(vat포함)</td>
					</tr>

				</table>

			</div>
		</section>

		<section>
			<h1 class="hidden">페이지 하단 지속노출상자</h1>
			<div class="box footbar">
				<div class="left">문의하기</div>
				<div class="right">구매하기 ${product.price}원</div>
			</div>
		</section>
	</section>

	<div>
		<section>
			<h1 class="hidden">상품정보 상세</h1>

			<div class="box menubar">
				<a href="#서비스설명"><input class="btn-menubar" type="sumit"
					value="서비스설명"></a> <a href="#가격정보"><input
					class="btn-menubar" type="sumit" value="가격정보"></a> <a
					href="#환불"><input class="btn-menubar" type="sumit"
					value="A/S및환불"></a> <a href="#평가"><input
					class="btn-menubar" type="sumit" value="서비스평가"></a> <a
					href="#프로필"><input class="btn-menubar" type="sumit" value="프로필"></a>
			</div>

			<div>
				<a class="btn-top" href="#top"></a>
				<!-- 페이지 스크롤 따라 같이내려올 것. -->

<!------------서비스 설명-------------------------------------------------------------------  -->

				<div class="box box-menu">
					<a name="서비스설명"></a>
					<div class="menu-name">서비스 설명</div>
					<!-- 답례품이나 집들이 선물, 지인 선물 등으로 인기가 많은 제품이에요!!<br> <br> 저렴한 가격대에
					비해 고급스러운 패키징으로 선물하시는 분도, 받는분도 기분 좋으실 수 있는 제품입니다.<br>
					----------------------------향 선택------------------------------<br>
					<br> 1. 체리 블라썸<br> <br> 2. 클린코튼<br> <br>
					3. 다우니<br> <br> 4. 잉글리시 페어<br> <br> 5. 코코마드모아젤<br>
					<br> 6.끌로에<br> <br> -->
					${product.content}
				</div>

				<div class="box box-menuimg">
					<div class="menu-name">상세 이미지</div>
					<div class="img1"></div>
					<div class="img2"></div>
					
					<!-- <div class="box box-menu-content">
						<div class="img1"></div>
						<div class="img2"></div>
					</div> -->
				</div>
	</div>
			
<!------------가격정보-------------------------------------------------------------------  -->

			<div class="box box-menu">
				<a name="가격정보"></a>
				<div class="menu-name">가격정보</div>
				<div class="box box-menu-content">
					<div class="content1">
						<label style="margin-left: 10px">기본 서비스(${product.workingPeriod}일)<input
							class="main-numform" type="number" value="1" max="50" min="1" /></label>
					</div>
					<div class="content2">

						<table class="table">
							<tr class="tr">

								<td>${product.name}<!-- 아이언맨 석고 방향제 --></td>
							</tr>
							<tr>
								<td class="td"><!-- 센스있는 방향제! --></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="선물포장 체크박스">선물 포장</td>
							</tr>
							<tr>
								<td>작업일 ${product.workingPeriod}일</td>
							</tr>
						

						</table>

					</div>

					<div class="content3">
						<input type="checkbox" name="추가옵션 체크박스"> ${product.optionName} + ￦${product.optionPrice}
					</div>

					<div class="content3">
						<label style="margin-left: 10px">수량 선택<input
							class="option-numform" type="number" value="1" max="50" min="1" /></label>
					</div>

				</div>
			</div>
<!------------환불-------------------------------------------------------------------  -->

			<div class="box box-menu">
				<a name="환불"></a>
				<div class="menu-name">A/S 및 환불</div>
				<div class="box box-menu-content">
					${product.as}
				</div>
			</div>
<!------------서비스 평가-------------------------------------------------------------------  -->

			<div class="box box-menu">
				<a name="평가"></a>
				<div class="menu-name">서비스 평가</div>
				<div class="box-star">
 			<!------------별점-------------------------------------------------------------------  -->
						<div class="avg-star"></div>
						<div class="avg-star"></div>
						<div class="avg-star"></div>
						<div class="avg-star"></div>
						<div class="avg-star"></div>
				</div>
<br>
				<div class="box-menu-review">
					<div class="box review"><!-- 리뷰상자 -->
					
						<div class="time"><div>17.12.25 12:26 |</div>
						<div class="star"></div>
						<div class="star"></div>
						<div class="star"></div>
						<div class="star"></div>
						<div class="star"></div>
						</div>
						
						<div class="box-review-content">
							너무 예쁘고 어떤 향으로 해야 할지 몰라 문의드렸는데....................
						</div>
						
						<div class="box profile">
							<div>
								<div class="box box-review">
								</div>
							</div>
							<div class="detail"><div>구매자 아이디</div></div>
							
							<div class="detail2">
							<div class="box modify"><div>수정</div></div>
							<div class="box delete"><div>삭제</div></div>
							</div>
							
						</div>
						
					</div>

					<div class="box review">
					<div class="time">17.12.25 12:26</div>
						
						<div class="box-review-content">
							이용해주셔서 갑사합니다.
						</div>
						
						<div class="box profile">
							<div>
								<div class="box box-respond">
								</div>
							</div>
							<div class="detail"><div>판매자 아이디</div></div>
							
							<div class="detail2">
							<div class="box modify"><div>수정</div></div>
							<div class="box delete"><div>삭제</div></div>
							</div>
							
						</div>
					</div><!--답변상자-->
										
					<div class="option">
						<div class="box btn-review">댓글 남기기</div>
						<div class="box btn-moreReview">평가 더보기</div>
					</div>
				</div>
			</div>
<!------------ 프로필 ---------------------------------->
			<div class="box box-menu">
				<a name="프로필"></a>
				<div class="menu-name">프로필</div>
				
					<div class="box box-menu-content-profile">
						<div class="box-profile">
						   <div style="height:100%; width:40%;">
							<div class="box img"></div>
						   </div>	
							<div class="box id">
								<div><a href="${ctx}/Category/productInfo/seller/service/serviceList?id=${product.regCMemberId}">${product.regCMemberId}</div>
							</div>
						</div>
					
						<div class="box box-profile-detail">
							<div class="detailbox">
								<div class="flex">
									<div>총 작업개수</div>
								</div>
								<div class="flex">
									<div>14개</div>
								</div>
							</div>

							<div class="detailbox">
								<div class="flex">
									<div>만족도</div>
								</div>
								<div class="box-star flex">
									<div class="avg-star"></div>
									<div class="avg-star"></div>
									<div class="avg-star"></div>
									<div class="avg-star"></div>
									<div class="avg-star"></div>
								</div>
							</div>

							<div class="detailbox">
								<div class="flex">
									<div>평균응답시간</div>
								</div>
								<div class="flex">
									<div>18시간</div>
								</div>
							</div>
						</div>
					</div></a>					
			</div>
		</section>
	</div>
	</main>
	
<script>
var mainNumform = document.querySelector("main-numform");
var optionNumform = document.querySelector("option-numform");
mainNumform.onclick = function(){
	
}

</script>
	<!-- -----------------------------------------------footer--------------------------------------------- -->
