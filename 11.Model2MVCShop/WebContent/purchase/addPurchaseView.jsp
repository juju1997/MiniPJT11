<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="UTF-8">
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<link rel="stylesheet" href="/css/jquery-ui.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
    <script src="/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	   $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncUpdateProduct();
			});
		});	
        
        $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				history.back();
			});
		});	
        
        function fncUpdateProduct(){
			var paymentOption = $("select[name='paymentOption']").val();
			var receiverName = $("input[name='receiverName']").val();
			var receiverPhone = $("input[name='receiverPhone']").val();
			var divyAddr = $("input[name='divyAddr']").val();
			var divyRequest = $("input[name='divyRequest']").val();
			var divyDate = $("input[name='divyDate']").val();
			
			if(paymentOption == null || paymentOption.length<1){
				alert("결제 방법은 반드시 입력하셔야 합니다.");
				return;
			}
			if(receiverName == null || receiverName.length<1){
				alert("받는분 이름은 반드시 입력하셔야 합니다.");
				return;
			}
			if(receiverPhone == null || receiverPhone.length<1){
				alert("받는분 연락처는 반드시 입력하셔야 합니다.");
				return;
			} 
			if(divyAddr == null || divyAddr.length<1){
				alert("받는분 주소는 반드시 입력하셔야 합니다.");
				return;
			}
			if(divyRequest == null || divyRequest.length<1){
				alert("구매 요청사항은 반드시 입력하셔야 합니다.");
				return;
			}
			if(divyDate == null || divyDate.length<1){
				alert("배송희망일자는 반드시 입력하셔야 합니다.");
				return;
			}
			$('form').attr("method","POST");
			$('form').attr("action","/purchase/addPurchase").submit();
        }
        
       $(function(){

        $('#divyDate').datepicker({

            calendarWeeks: false,

            todayHighlight: true,

            autoclose: true,

            format: "yyyy-mm-dd",

            language: "kr"

        });
        
        
    });
       
</script>		
    
</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">상 품 구 매</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
		  <input type="hidden" name="prodNo" value="${product.prodNo }"/>
		  <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품번호</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodNo" name="prodNo" value="${product.prodNo }" readonly>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName }" readonly>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품 상세정보</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" value="${product.prodDetail }" readonly>
		    </div>
		  </div>
	    
		  
		 
		  
		  <div class="form-group">
              <label for="price" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="manuDate" name="manuDate" value="${product.manuDate }" readonly>
		    </div>
		  </div>
		  
		   <div class="form-group">
              <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" value="${product.price }" readonly>
		    </div>
		  </div>
		 
		 
		 <div class="form-group">
              <label for="price" class="col-sm-offset-1 col-sm-3 control-label">등록일자</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="regDate" name="regDate" value="${product.regDate }" readonly>
		    </div>
		  </div>
		  
		  <div class="form-group">
              <label for="price" class="col-sm-offset-1 col-sm-3 control-label">구매자 아이디</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" value="${user.userId }" readonly>
		    </div>
		  </div>
		  <input type="hidden" name="buyerId" value="${user.userId}" />
		  <input type="hidden" name="product" value="${product}"/>
		 
		 
		 <div class="form-group">
			<label for="price" class="col-sm-offset-1 col-sm-3 control-label">결제 방법</label>
			<div class="col-sm-4">
				<select class="form-control" name="paymentOption" id="paymentOption">
		    		<option value="1" selected="selected">현금구매</option>
					<option value="2">신용구매</option>
				</select> 
			</div>
		</div>
		  
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">받는분 이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverName" name="receiverName" value="${user.userName}">
		    </div>
		  </div>
		  
		  <div class="form-group">
              <label for="price" class="col-sm-offset-1 col-sm-3 control-label">받는분 연락처</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${user.phone }">
		    </div>
		  </div>
		  
		  <div class="form-group">
              <label for="price" class="col-sm-offset-1 col-sm-3 control-label">받는분 주소</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyAddr" name="divyAddr" value="${user.addr}">
		    </div>
		  </div>
		  
		  <div class="form-group">
              <label for="price" class="col-sm-offset-1 col-sm-3 control-label">구매 요청사항</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyRequest" name="divyRequest">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">배송 희망일자</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyDate" name="divyDate" readonly="readonly">
		  </div>
            </div>


		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >구&nbsp;매</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>