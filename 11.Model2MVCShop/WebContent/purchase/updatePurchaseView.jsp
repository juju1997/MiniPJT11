<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				fncUpdatePurchase();
			});
		});	
        
        $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				history.back();
			});
		});	
        
        function fncUpdatePurchase(){
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
			$('form').attr("action","/purchase/updatePurchase").submit();
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
	
		<h1 class="bg-primary text-center">구매 내역 수정</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
		  
		  <div class="form-group">
              <label for="price" class="col-sm-offset-1 col-sm-3 control-label">구매자 아이디</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="buyerId" name="buyerId" value="${param.buyerId} " readonly>
		      <input type="hidden" name="tranNo" value="${purchase.tranNo }"/>
		    </div>
		  </div>
		  
		  <div class="form-group">
              <label for="price" class="col-sm-offset-1 col-sm-3 control-label">구매 방법</label>
		      <div class="col-sm-4">
		      	<select class="form-control" name="paymentOption" id="paymentOption">
			      <c:if test="${purchase.paymentOption.trim() eq '1' }">
					<option value="1" selected="selected">현금구매</option>
					<option value="2">신용구매</option>
				  </c:if>
				  <c:if test="${purchase.paymentOption.trim() eq '2' }">
					<option value="1">현금구매</option>
					<option value="2" selected="selected">신용구매</option>
			   	  </c:if>
				</select>
		    </div>
		  </div>
		  
		  <div class="form-group">
              <label for="price" class="col-sm-offset-1 col-sm-3 control-label">받는분 이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverName" name="receiverName" value="${purchase.receiverName}">
		    </div>
		  </div>
		  
		  <div class="form-group">
              <label for="price" class="col-sm-offset-1 col-sm-3 control-label">받는분 연락처</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${purchase.receiverPhone}">
		    </div>
		  </div>
		  
		  <div class="form-group">
              <label for="price" class="col-sm-offset-1 col-sm-3 control-label">받는분 주소</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyAddr" name="divyAddr" value="${purchase.divyAddr}">
		    </div>
		  </div>
		  
		  <div class="form-group">
              <label for="price" class="col-sm-offset-1 col-sm-3 control-label">배송 요청사항</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyRequest" name="divyRequest" value="${purchase.divyRequest}">
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
		      <button type="button" class="btn btn-primary"  >수&nbsp;정</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>