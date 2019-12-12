<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
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
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
   	}         
      
   
     
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//----------------------------무한스크롤---------------------------------
		
		 $(document).ready(function () {
    		var page = 2;
  			$(document).scroll(function() {
    			var maxHeight = $(document).height();
    			var currentScroll = $(window).scrollTop() + $(window).height();
   			 	if (maxHeight <= currentScroll + 100) {
      				$.ajax({
      					url : "/product/json/listProduct",
      					method : "POST",
      					dataType : "json",
      					data : JSON.stringify({
      						currentPage : page
      					}),
      					headers : {
      						"Accept" : "application/json",
							"Content-Type" : "application/json"
      					},
      					success : function(data) {	//product 정보 data.list[i]
      						page +=1;
      						for(var j=0; j<data.list.length; j++){
      							var menu = "${param.menu}";
      							var fileName = (data.list[j].fileName).split(",");
      							var prodName = data.list[j].prodName;
      							var prodDetail = data.list[j].prodDetail;
      							var prodNo = data.list[j].prodNo;
      							var tranCode = jQuery.trim(data.list[j].proTranCode);
      							if(tranCode != ""){
      								var button = "<a class='btn btn-danger' role='button'>SOLD OUT</a>";
      							}else{
      								var button = "<a class='btn btn-info' role='button' id='test'>view Memories &raquo;</a>";
      							}
      							var view = 
      								"<div class='col-lg-6'>"
									+"<br/>"
									+"<span>"
										+"<span><img class='img-circle' src='../images/uploadFiles/"+fileName[0]+"' alt='Generic placeholder image' width='300' height='300'></span>"
										+"<br/>"
										+"<span style='font: italic bold 1.5em/1em Georgia, serif ; color: dark;'>"+prodName+"</span>"
										+"<br/>"
										+"<span style='font: italic bold 1em/1em Georgia, serif ; color: dark;'>"+prodDetail+"</span>"
										+"<br/>"
										+"<span>"
											+button
											+"<input type='hidden' id='menu' name='menu' value="+menu+">"
											+"<input type='hidden' id='prodNo' name='prodNo' value="+prodNo+">"
											+"<input type='hidden' id='tranCode' name='tranCode' value="+tranCode+">"
										+"</span>"
										+"<br/>"
									+"</span>"
									+"</div>";
								
      							$("#append").append(view);
      							
      							
      						}
      					}
      				});
    			}
  			});
		}); 
		
		
		//----------------------------무한스크롤---------------------------------
	
	
	
		//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetUserList(currentPage) {
			$("#currentPage").val(currentPage)
			var menu = $('input[id="menu"]').val().trim();
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu="+menu).submit();
		}
		
		
		//============= "검색"  Event  처리 =============	
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-default" ).on("click" , function() {
				fncGetUserList(1);
			});
		 });
		
		
		//============= userId 에 회원정보보기  Event  처리(Click) =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(document).on('click','span:nth-child(7)',function(){
				var tranCode = $(this).children("#tranCode").val();
				if(tranCode == ""){
					var menu = $(this).children("#menu").val();
					var prodNo = $(this).children('#prodNo').val();
					if(menu == 'search'){
						self.location = "/product/getProduct?prodNo="+prodNo;
					}else{
						self.location = "/product/updateProduct?prodNo="+prodNo;}
				}else{
					$(this).effect( "pulsate", {times:5}, 3000 );
				}
			});
						
		});	
	
	</script>
	
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <c:if test="${param.menu eq 'search' }">
	       		<h3>상품목록 조회</h3>
	       </c:if>
	       <c:if test="${param.menu eq 'manage' }">
	       		<h3>상품목록 관리(admin 전용 페이지)</h3>
	       </c:if>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
						<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품가격</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				 
				  
				</form>
	    	</div>
	    	
		</div>
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
	
	 	<div class="container marketing" id="scroll">
	      <div class="row" id="append">
 			<c:forEach var="product" items="${list }">
		        <div class="col-lg-6">
		        <br/>
		        <br/>
			        <span>
			          <span><img class="img-circle" src="../images/uploadFiles/${product.fileName}" alt="Generic placeholder image" width="300" height="300"></span>
			          
			          <br/>
			          
			          <span style=" font: italic bold 1.5em/1em Georgia, serif ; color: dark;">${product.prodName}</span>
			          
			          <br/>
			          
			          <span style=" font: italic bold 1em/1em Georgia, serif ; color: dark;">${product.prodDetail }</span>
			          
			          <br/>
			          
				  	  <c:if test="${product.proTranCode.trim() ne null }">
			          	<span>
			          		<a class="btn btn-danger" role="button">SOLD OUT</a>
			          		<input type="hidden" id="menu" name="menu" value="${param.menu }"/>
				  	 		<input type="hidden" id="prodNo" name="prodNo" value="${product.prodNo }"/>
				  	 		<input type="hidden" id="tranCode" name="tranCode" value="${product.proTranCode.trim() }"/>
			          	</span>
			          </c:if>
			          <c:if test="${product.proTranCode.trim() eq null }">
			          	<span>
			          		<a class="btn btn-info" role="button">View Memories &raquo;</a>
			          		<input type="hidden" id="menu" name="menu" value="${param.menu }"/>
				  	 		<input type="hidden" id="prodNo" name="prodNo" value="${product.prodNo }"/>
				  	 		<input type="hidden" id="tranCode" name="tranCode" value="${product.proTranCode.trim() }"/>
			          	</span>
			          </c:if>
			          
			          <br/>
			        </span>
		        </div><!-- /.col-lg-4 -->
      		</c:forEach>
	      </div><!-- /.row -->
	    </div>
	    
      
      
    
      
      
      
      <br/><br/><br/><br/><br/><br/>
      
      
      
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	<!-- PageNavigation Start... -->
	<%-- <jsp:include page="../common/pageNavigator_new.jsp"/> --%>
	<!-- PageNavigation End... -->
	
</body>

</html>