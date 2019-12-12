package com.model2.mvc.web.product;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	public ProductRestController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="json/addProduct", method=RequestMethod.POST)
	public void addProduct(@RequestBody Product product, HttpServletRequest request, Model model) throws Exception{
		String temDir = "C:\\workspace\\08.Model2MVCShop(RestFul Server)\\WebContent\\images\\uploadFiles\\";
		String names="";
		product.setFileName("empty.GIF");
		
		System.out.println("들어간다");
		productService.addProduct(product);
	}
	
	@RequestMapping(value = "json/getProduct/{prodNo}", method = RequestMethod.GET)
	public Product getProduct(@PathVariable int prodNo) throws Exception {
		System.out.println("/product/getProduct GET");

		return productService.getProduct(prodNo);
	}
	
	@RequestMapping(value = "json/updateProduct", method = RequestMethod.POST)
	public void updateProduct(@RequestBody Product product) throws Exception{
		System.out.println(product);
		productService.updateProduct(product);
		System.out.println("완료");
	}
	
	@RequestMapping(value = "json/listProduct", method = RequestMethod.GET)
	public Map listProduct() throws Exception{
		Search search = new Search();
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		Map<String , Object> map = productService.getProductList(search);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		Map returnMap = new HashMap();
		
		returnMap.put("list", map.get("list"));
		returnMap.put("resultPage", resultPage);
		returnMap.put("search",search);
		return returnMap;
	}
	
	@RequestMapping(value = "json/listProduct", method = RequestMethod.POST)
	public Map listProduct(@RequestBody Search search) throws Exception{
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		Map<String , Object> map = productService.getProductList(search);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		Map returnMap = new HashMap();
		
		returnMap.put("list", map.get("list"));
		returnMap.put("resultPage", resultPage);
		returnMap.put("search",search);
		return returnMap;
	}
}
