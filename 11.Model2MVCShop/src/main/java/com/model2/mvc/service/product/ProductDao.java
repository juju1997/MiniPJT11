package com.model2.mvc.service.product;

import java.util.List;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;

public interface ProductDao {
	//Insert
	public void addProduct(Product product) throws Exception;
	
	//get(find)
	public Product getProduct(int prodNo) throws Exception;
	
	//getList
	public List<Product> getProductList(Search search) throws Exception;
	
	//updateProduct
	public void updateProduct(Product product) throws Exception;
	
	//게시판 page처리를 위한 row
	public int getTotalCount(Search search) throws Exception ;
}
