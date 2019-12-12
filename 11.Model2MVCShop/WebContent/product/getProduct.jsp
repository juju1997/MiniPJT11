<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= 회원정보수정 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button:contains('구매')" ).on("click" , function() {
				var link = "/purchase/addPurchase"
				$('form').attr("method","get");
				$('form').attr("action",link).submit();
			});
			$("button:contains('뒤로')").on("click",function(){
				history.back();
			});
		});
		
	</script>
	
</head>

<body>
	<form>
		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="/layout/toolbar.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->
		
		<!--  화면구성 div Start /////////////////////////////////////-->
		<div class="container">
		
			<div class="page-header">
		       <h3 class=" text-info">상품 조회</h3>
		       <h5 class="text-muted"><strong>상품 상세 조회하기</strong></h5>
		    </div>
			<input type="hidden" name="prod_no" value="${product.prodNo }" />
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>상 품 명</strong></div>
				<div class="col-xs-8 col-md-4">${product.prodName}</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>상품 상세정보</strong></div>
				<div class="col-xs-8 col-md-4">${product.prodDetail }</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>제조일자</strong></div>
				<div class="col-xs-8 col-md-4">${product.manuDate }</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>가격</strong></div>
				<div class="col-xs-8 col-md-4">${product.price}	원</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>상품 이미지</strong></div>
				<div class="col-xs-8 col-md-4">
					<c:forEach var="list" items="${product.fileNames }">
							<img src="../images/uploadFiles/${list }" width="200" height="200"/>
					</c:forEach>
				</div>
			</div>
			
			<hr/>
			
			
			<div class="row">
		  		<div class="col-md-12 text-center ">
		  			<button type="button" class="btn btn-primary">구매</button>
		  			<button type="button" class="btn btn-primary">뒤로</button>
		  		</div>
		  		
			</div>
			
			<br/>
			
	 	</div>
	 	<!--  화면구성 div Start /////////////////////////////////////-->
	</form>
</body>

</html>