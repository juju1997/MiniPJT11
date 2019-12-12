package com.model2.mvc.web.purchase;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.puchase.PurchaseService;
import com.model2.mvc.service.user.UserService;

@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	
	public PurchaseController() {
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
		//==> 아래의 두개를 주석을 풀어 의미를 확인 할것
		@Value("#{commonProperties['pageUnit']}")
		//@Value("#{commonProperties['pageUnit'] ?: 3}")
		int pageUnit;
		
		@Value("#{commonProperties['pageSize']}")
		//@Value("#{commonProperties['pageSize'] ?: 2}")
		int pageSize;
		
		@RequestMapping(value="addPurchase", method=RequestMethod.GET)
		public String addPurchase(@RequestParam("prod_no") int prodNo, Model model) throws Exception{
			System.out.println("/purchase/addPurchase GET");
			System.out.println(prodNo);
			Product product = productService.getProduct(prodNo);
			
			model.addAttribute("product",product);
			return "forward:/purchase/addPurchaseView.jsp";
		}
		
		@RequestMapping(value="addPurchase", method=RequestMethod.POST)
		public String addPruchase(@ModelAttribute("purchase") Purchase purchase, HttpServletRequest request, Model model) throws Exception{
			System.out.println("/purchase/addPurchase");
			int prodNo = Integer.parseInt(request.getParameter("prodNo"));
			Product product = productService.getProduct(prodNo);
			String userId = request.getParameter("buyerId");
			User user = userService.getUser(userId);
			
			purchase.setBuyer(user);
			purchase.setPurchaseProd(product);
			
			purchaseService.addPurchase(purchase);
			model.addAttribute("purchase",purchase);
			
			return "forward:/purchase/addPurchase.jsp";
		}
		
		@RequestMapping(value="listPurchase")
		public String listPurchase(@ModelAttribute("search") Search search, Model model, HttpSession session) throws Exception{
			System.out.println("purchase/listPurchase");
			if(search.getCurrentPage() ==0 ){
				search.setCurrentPage(1);
			}
			search.setPageSize(pageSize);
			
			User user = (User)session.getAttribute("user");
			
			// Business logic 수행
			Map<String , Object> map = purchaseService.getPurchaseList(search, user.getUserId());
			
			Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
			System.out.println(resultPage);
			
			// Model 과 View 연결
			model.addAttribute("list", map.get("list"));
			model.addAttribute("resultPage", resultPage);
			model.addAttribute("search", search);
			
			return "forward:/purchase/listPurchase.jsp";
		}
		
		@RequestMapping(value="getPurchase", method=RequestMethod.GET)
		public String getPurcase(@RequestParam("tranNo") int tranNo, Model model, HttpSession session) throws Exception{
			System.out.println("/purchase/getPurchase");
			
			Purchase purchase = purchaseService.getPurchase(tranNo);
			User user = (User)session.getAttribute("user");
			
			model.addAttribute("purchase",purchase);
			return "forward:/purchase/getPurchase.jsp?buyerId="+user.getUserId();
		}
		
		@RequestMapping(value="listSale")
		public String listSale(@ModelAttribute("search") Search search, Model model, HttpSession session, HttpServletRequest request) throws Exception{
			System.out.println("/purchase/listSale");
			if(search.getCurrentPage() ==0 ){
				search.setCurrentPage(1);
			}
			search.setPageSize(pageSize);
			Map<String, Object> map = purchaseService.getSaleList(search);
			
			Page resultPage	= new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
			
			request.setAttribute("list", map.get("list"));	//map안에 있는 값을 보낸다
			request.setAttribute("resultPage", resultPage);
			request.setAttribute("search", search);
			
			return "forward:/purchase/listSale.jsp";
		}
		
		@RequestMapping(value="updatePurchase", method=RequestMethod.GET)
		public String updatePurchase(@RequestParam("tranNo") int tranNo, Model model, HttpSession session) throws Exception{
			System.out.println("/purchase/updatePurchase GET");
			Purchase purchase = purchaseService.getPurchase(tranNo);
			User user = (User)session.getAttribute("user");
			model.addAttribute("purchase",purchase);
			
			return "forward:/purchase/updatePurchaseView.jsp?buyerId="+user.getUserId();
		}
		
		@RequestMapping(value="updatePurchase", method=RequestMethod.POST)
		public String updatePurchase(@RequestParam("buyerId") String userId, @ModelAttribute("purchase") Purchase purchase, Model model) throws Exception{
			System.out.println("/purchase/updatePurchase POST");
			purchaseService.updatePurchase(purchase);
			Purchase purchaseDate = purchaseService.getPurchase(purchase.getTranNo());
			model.addAttribute("purchase",purchaseDate);
			return "forward:/purchase/updatePurchase.jsp?buyerId="+userId+"&date="+purchaseDate.getOrderDate();
		}
		
		@RequestMapping(value="updateTranCodeByProd", method=RequestMethod.GET)
		public String updateTranCodeByProd(@RequestParam("tranCode") String tranCode,@RequestParam("tranNo") int tranNo, Model model, HttpServletRequest request) throws Exception{
			System.out.println("/purchase/updatePurchase POST");
			Purchase purchase = new Purchase();
			purchase.setTranCode(tranCode);
			purchase.setTranNo(tranNo);
			purchaseService.updateTranCode(purchase);
			
			model.addAttribute(purchase);
			
			if(tranCode.equals("2")) {
				return "forward:/purchase/listSale";
			}else {
				return "forward:/purchase/listPurchase";
			}
		}
}
