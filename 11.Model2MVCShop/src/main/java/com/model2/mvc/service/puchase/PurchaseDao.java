package com.model2.mvc.service.puchase;

import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;

public interface PurchaseDao {
	
	//�������� �߰�
	public void addPurchase(Purchase purchase) throws Exception;
	
	//�������� ��������
	public Purchase getPurchase(int tranNo) throws Exception;
	
	//�����̷� ��ȸ
	public List<Purchase> getPurchaseList(Search search, String buyerId) throws Exception;
	
	//�Ǹ��̷� ��ȸ
	public List<Purchase> getSaleList(Search search) throws Exception;
	
	//���ų�������
	public void updatePurchase(Purchase purchase) throws Exception;
	
	//tranCode����
	public void updateTranCode(Purchase purchase) throws Exception;

	//total count
	public int getTotalCount(Purchase purchase) throws Exception;
}
