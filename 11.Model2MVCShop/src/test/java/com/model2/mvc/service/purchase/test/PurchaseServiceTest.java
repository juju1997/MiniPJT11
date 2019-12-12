package com.model2.mvc.service.purchase.test;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.puchase.PurchaseService;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
																	"classpath:config/context-aspect.xml",
																	"classpath:config/context-mybatis.xml",
																	"classpath:config/context-transaction.xml" })

public class PurchaseServiceTest {
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
//	@Test
	public void testAddPurchase() throws Exception{
		Purchase purchase = new Purchase();
		purchase.setPaymentOption("1");
		purchase.setReceiverName("조형진");
		purchase.setReceiverPhone("123-123-123");
		purchase.setDivyAddr("서울시 서울동");
		purchase.setDivyRequest("신속하고 정확하게");
		purchase.setDivyDate("1997-07-12");
		User buyer = new User();
		buyer.setUserId("user14");
		Product prodNo = new Product();
		prodNo.setProdNo(10007);
		purchase.setBuyer(buyer);
		purchase.setPurchaseProd(prodNo);
		
		
		purchaseService.addPurchase(purchase);
		Assert.assertEquals("조형진", purchase.getReceiverName());
	}
	
//	@Test
	public void testGetPurchase() throws Exception{
		Product prodNo = new Product();
		prodNo.setProdNo(10008);
		Purchase purchase = new Purchase();
		purchase.setPurchaseProd(prodNo);
		
		purchase = purchaseService.getPurchase(purchase.getPurchaseProd().getProdNo());
		System.out.println(purchase);
		Assert.assertEquals("조형진", purchase.getReceiverName());
	}
	
//	@Test
	public void testGetPurchaseList() throws Exception{
		Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	Map<String,Object> map = purchaseService.getPurchaseList(search, "user14");
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
		//==> console 확인
	 	//System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("");
	 	map = purchaseService.getPurchaseList(search,"user14");
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
	 	//==> console 확인
	 	//System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	}
	
//	@Test
	public void testGetSaleList() throws Exception{
		Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	Map<String,Object> map = purchaseService.getSaleList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
		//==> console 확인
	 	System.out.println(list.size());
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	map = purchaseService.getSaleList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
	 	//==> console 확인
	 	//System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	}
	
//	@Test
	public void testUpdatePurchase() throws Exception{
		Purchase purchase = new Purchase();
		purchase.setTranNo(10007);
		
		purchase.setPaymentOption("2");
		purchase.setReceiverName("좌형진");
		purchase.setReceiverPhone("1029284821");
		purchase.setDivyAddr("서울시 서울동 서울리");
		purchase.setDivyRequest("누구보다빠르게");
		purchase.setDivyDate("1997/10/11");
		
		purchaseService.updatePurchase(purchase);
	}
	
//	@Test
	public void testUpdateTranCode() throws Exception{
		Purchase purchase = new Purchase();
		Product product = new Product();
		product.setProdNo(10008);
		purchase.setTranCode("3");
		purchase.setPurchaseProd(product);
		
		purchaseService.updateTranCode(purchase);
	}
}

