<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
        
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
		function fncGetUserList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();
		}
		
		//============= userId �� ȸ����������  Event  ó��(Click) =============	
		$(function(){
		$("td:nth-child(1)").on("click",function(){
			var tranNo = $(this).children("#tranNo").val();
			self.location = "/purchase/getPurchase?tranNo="+tranNo;
		});
		$("td:nth-child(2)").on("click",function(){
			var userId = $(this).children("#userId").val();
			self.location = "/user/getUser?userId="+userId;
		});
		
	
		$("td:nth-child(6)").on("click",function(){
			if($(this).children("#tranNo").val() != null){
				var tranNo = $(this).children("#tranNo").val();
				self.location = "/purchase/updateTranCodeByProd?tranNo="+tranNo+"&tranCode=3"
			}
		});
		
		
	});
		
	</script>
	
</head>

<body>
	<form>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       		<h3>���� ��� ��ȸ</h3>
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    <input type="hidden" id="currentPage" name="currentPage" value=""/>
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >ȸ��ID</th>
            <th align="left">ȸ����</th>	
            <th align="left">��ȭ��ȣ</th>
            <th align="left">�����Ȳ</th>
            <th align="left">��������</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="purchase" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">
			 		${ i }
			 		<input type="hidden" id="tranNo" name="tranNo" value="${purchase.tranNo }"/>
			  </td>
			  <td align="left">
			  		${purchase.buyer.userId}
			  		<input type="hidden" id="userId" name="userId" value="${purchase.buyer.userId }"/>
			  </td>
			  <td align="left">${purchase.receiverName}</td>
			  <td align="left">${purchase.receiverPhone}</td>
			  <td align="left">
			  		<c:if test="${purchase.tranCode.trim() eq '1' }">
			  			���ſϷ� 
			  		</c:if>
			  		<c:if test="${purchase.tranCode.trim() eq '2' }">
			  			�����
			  		</c:if>
			  		<c:if test="${purchase.tranCode.trim() eq '3' }">
			  			��ۿϷ�
			  		</c:if>
			  </td>
			  <td align="left">
			  		<c:if test="${purchase.tranCode.trim() eq '2' }">
			  			<input type="hidden" id="tranNo" name="tranNo" value="${purchase.tranNo }">
			  			�޾Ҿ��!!
			  		</c:if>
			  </td>
			</tr>
          </c:forEach>
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	</form>
</body>

</html>