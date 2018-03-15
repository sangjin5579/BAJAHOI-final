﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="aa" uri="http://java.sun.com/jsp/jstl/core" %> 
 <aa:set var="ctx" value="${pageContext.request.servletContext.contextPath }" />
 
 <section class="transform">	
 <section class="cate">
	<div id="category" >
		${list1[0].categoryName	 }
	</div>
</section>

<!-- ------------------- 상품 정렬-------------------- -->
<section class="aside">
<div class="sort">
	<button class="sort-btn">정렬</button>
	<div class="sort-content">
		<a>신상품</a>
		<a>판매량 많은 순</a>
		<a>낮은 가격</a>
		<a>높은 가격</a>
		<a>상품평 많은 순</a>
	</div>
</div>

<!-- ------------------- 상품 보기방식-------------------- -->
<div id="display-change">
	<img src="${ctx}/img/icon/padnote.png" alt=목록>
	<a href="../1/00thumb"><img src="${ctx}/img/icon/layout.png" alt=썸네일></a>
</div>
</section>  
<main id="main">

<section class="root-container">
	
		
	<aa:forEach var="ai" items="${list1 }" varStatus="st">
	<div class="content" id="content${st.index }" onscroll="scr(${st.index})">
			
			<div class="content-top">
				<div class="content-top-image">
					<a href ="${ctx}/Category/productInfo/infoList?id=${ai.id}"><img class =top-image src="${ctx}/img/${ai.imgName}.${ai.imgEx}" alt=상품이미지></a>
				</div>
				<div class="content-middle">
					<div class="content-middle-sellword">
						<p>${ai.content }</p>
					</div>
					<div class="content-middle-wish">
						<%-- <input type="checkbox"" id="like-check">
						<a  class="like-hidden" ><img src="${ctx}/img/icon/like.png" alt=찜목록></a>
						<label for="like-check" class="like"> --%>
						<form action="${ctx}/Category/home/add" method="get">
						<input class="hidden" type="text" name="pid" value="${ai.id}">
			        	<img id="img${st.index }" onclick="img(${st.index })" src="${ctx}/img/icon/like1.png" alt=찜목록 >
						</form><!-- </label> -->
					</div>
				</div>
			</div>
			<div class="content-bottom">
				<div class="content-bottom-seller">
					<span>${ai.memId }</span>
				</div>
				<div class="content-bottom-price">
					<span>${ai.price }</span>
				</div>
				<div class="content-bottom-star">
						<div class="bottom-star-img">
							<img src="${ctx}/img/icon/star1.png" alt=별점>
							<img src="${ctx}/img/icon/star1.png" alt=별점>
							<img src="${ctx}/img/icon/star1.png" alt=별점>
							<img src="${ctx}/img/icon/halfstar.png" alt=별점>
						</div>
				</div>
			</div>
		</div>
	</aa:forEach>
	
</section>

</main>
</section>

<script>
	var imgchange = document.querySelectorAll(".content-middle-wish img");
	var count = 0;
	function img(name){
		count++;
		if(count%2 == 1)
			imgchange[name].src = "${ctx}/img/icon/like.png";
		else
			imgchange[name].src = "${ctx}/img/icon/like1.png";
	
	};

	
</script>