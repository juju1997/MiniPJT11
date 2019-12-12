package com.model2.mvc.web.product;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {

	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	public ProductController() {
		System.out.println(this.getClass());
	}

	// ==> classpath:config/common.properties , classpath:config/commonservice.xml
	// 참조 할것
	// ==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;

	// 입력
	@RequestMapping(value = "addProduct", method = RequestMethod.GET)
	public String addProduct() throws Exception {
		System.out.println("/product/addProduct GET");
		return "redirect:/product/addProductView.jsp";
	}

	// 입력수행
	@RequestMapping(value="addProduct", method=RequestMethod.POST)
		public String addProduct(@ModelAttribute("product") Product product, HttpServletRequest request, Model model , @RequestParam("fileNamee") MultipartFile[] files) throws Exception{
			String temDir = "C:\\workspace\\11.Model2MVCShop\\WebContent\\images\\uploadFiles\\";
			String names="";
			for(MultipartFile file:files) {
				if(!file.getOriginalFilename().isEmpty()) {
					file.transferTo(new File(temDir, file.getOriginalFilename()));
					names += file.getOriginalFilename()+",";
				}else {
					model.addAttribute("msg","please select at least one mdediaFile...");
					product.setFileName("empty.jpg");
					model.addAttribute("product", product);
					productService.addProduct(product);
					return "forward:/product/readProduct.jsp";
				}
			}
			
			product.setFileName(names);
			productService.addProduct(product);
			product.setFileNames(names.split(","));
			model.addAttribute("product",product);
			model.addAttribute("msg","multiple files uploaded successfully");
			return "forward:/product/readProduct.jsp";
	}
//			String temDir = "C:\\Users\\82104\\git\\MiniPJT07\\07.Model2MVCShop(URI,pattern)\\WebContent\\images\\uploadFiles\\";
//			System.out.println(file.getOriginalFilename());
//		// Save mediaFile on system
//		   if (!file.getOriginalFilename().isEmpty()) {
//		      file.transferTo(new File(temDir, file.getOriginalFilename()));
//		      System.out.println(file.getOriginalFilename());
//		      product.setFileName(file.getOriginalFilename());
//		      model.addAttribute("product",product);
//		      productService.addProduct(product);
//		      model.addAttribute("msg", "File uploaded successfully.");
//		      return "forward:/product/readProduct.jsp";
//		   } else {
//			   product.setFileName("../../images/empty.GIF");
//			   model.addAttribute("product",product);
//			   productService.addProduct(product);
//			   model.addAttribute("msg", "Please select a valid mediaFile..");
//			   return "forward:/product/readProduct.jsp";
//		   }
//		}
		
//			완전 수작업 파일 업로드
//			if(FileUpload.isMultipartContent(request)) {
//				String temDir = "C:\\Users\\82104\\git\\MiniPJT07\\07.Model2MVCShop(URI,pattern)\\WebContent\\images\\uploadFiles\\";
//				//project바꿀때 마다 바꿔줘야함 && 컴퓨터 바뀔때도
//				
//				
//				DiskFileUpload fileUpload = new DiskFileUpload();
//				fileUpload.setRepositoryPath(temDir);
//				fileUpload.setSizeMax(1024*1024*10);
//				fileUpload.setSizeThreshold(1024*100);
//				
//				if(request.getContentLength()<fileUpload.getSizeMax()) {
//					StringTokenizer token = null;
//					
//					List fileItemList = fileUpload.parseRequest(request);
//					int Size = fileItemList.size();
//					for(int i=0; i<Size; i++) {
//						FileItem fileItem = (FileItem) fileItemList.get(i);
//						if(fileItem.isFormField()) {
//							if(fileItem.getFieldName().equals("manuDate")) {
//								token = new StringTokenizer(fileItem.getString("utf-8"),"-");
//								String manuDate = token.nextToken()+token.nextToken()+token.nextToken();
//								product.setManuDate(manuDate);
//							}
//							else if(fileItem.getFieldName().equals("prodName")) {
//								product.setProdName(fileItem.getString("utf-8"));
//							}
//							else if(fileItem.getFieldName().equals("prodDetail")) {
//								product.setProdDetail(fileItem.getString("utf-8"));
//							}
//							else if(fileItem.getFieldName().equals("price")) {
//								product.setPrice(Integer.parseInt(fileItem.getString("utf-8")));
//							}
//							}else {
//								if(fileItem.getSize()>0) {
//									int idx = fileItem.getName().lastIndexOf("\\");
//									if(idx==-1) {
//										idx = fileItem.getName().lastIndexOf("/");
//									}
//									String fileName = fileItem.getName().substring(idx+1);
//									product.setFileName(fileName);
//									try {
//										File uploadFile = new File(temDir, fileName);
//										fileItem.write(uploadFile);
//									}catch(IOException e) {
//										System.out.println(e);
//									}
//								}else {
//									product.setFileName("../../images/empty.GIF");
//								}
//							}
//						}
//						
//						productService.addProduct(product);
//						///////
//						model.addAttribute("product",product);
//						///////
//					}else {
//						int overSize = (request.getContentLength()/1000000);
//						System.out.println("<script>alert('파일의 크기는 1MB까지 입니다. 올리신 파일 용량은 "+overSize+"MB입니다");
//						System.out.println("history.back();</script>");
//					}
//				}else {
//					System.out.println("인코딩 타입이 multipart/form-data가 아닙니다.");
//				}
//				return "forward:/product/readProduct.jsp";
//			}
		
		
//			원래 addProduct
//			System.out.println("/product/addProduct POST");
//			//Business Logic
//			productService.addProduct(product);
//			return "forward:/product/readProduct.jsp";
//		}

	// 물건조회
	@RequestMapping(value = "getProduct", method = RequestMethod.GET)
	public String getProduct(@RequestParam("prodNo") int prodNo, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("/product/getProduct GET");

		// cookies(history)
		String prodNoLine = "";
		Cookie cookies[] = request.getCookies();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("history")) {
					prodNoLine += cookies[i].getValue() + ",";
				}
			}
		}
		prodNoLine += prodNo;
		Cookie cookie = new Cookie("history", prodNoLine);
		response.addCookie(cookie);
		// Business Logic
		Product product = productService.getProduct(prodNo);
		product.setFileNames(product.getFileName().split(","));
		// Model 과 View 연결
		model.addAttribute("product", product);
		return "forward:/product/getProduct.jsp";
	}

	// 물건리스트조회
	@RequestMapping(value = "listProduct")
	public String getProductList(@ModelAttribute("search") Search search, Model model, HttpServletRequest request)
			throws Exception {
		System.out.println("/product/listProduct GET");
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		// Business Logic
		Map<String, Object> map = productService.getProductList(search);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);
		// Model 과 View 연결
		
		List files = new ArrayList();
		List prodFiles = new ArrayList();
		prodFiles = (List) map.get("list");
		for(int i=0; i<prodFiles.size(); i++) {
			Product product = (Product)prodFiles.get(i);
			product.setFileName(product.getFileName().split(",")[0]);
			files.add(product);
		}
		System.out.println(files);
		model.addAttribute("list", files);
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		return "forward:/product/listProduct.jsp";
	}

	// 물건수정창
	@RequestMapping(value = "updateProduct", method = RequestMethod.GET)
	public String updateProduct(@RequestParam("prodNo") int prodNo, Model model) throws Exception {
		System.out.println("/product/updateProduct GET");
		// Business Logic
		Product product = productService.getProduct(prodNo);
		// Model 과 View 연결
		model.addAttribute("product", product);
		return "forward:/product/updateProduct.jsp";
	}

	// 물건수정수행
	@RequestMapping(value = "updateProduct", method = RequestMethod.POST)
	public String updateProduct(@ModelAttribute("product") Product product, HttpServletRequest request, Model model , @RequestParam("fileNamee") MultipartFile[] files) throws Exception {
		System.out.println("/product/updateProduct POST");
		// Business Logic
		String temDir = "C:\\workspace\\11.Model2MVCShop\\WebContent\\images\\uploadFiles\\";
		String names="";
		for(MultipartFile file:files) {
			if(!file.getOriginalFilename().isEmpty()) {
				file.transferTo(new File(temDir, file.getOriginalFilename()));
				names += file.getOriginalFilename()+",";
			}else {
				model.addAttribute("msg","please select at least one mdediaFile...");
				product.setFileName("sonboy.jpg");
				model.addAttribute("product", product);
				model.addAttribute("update", true);
				productService.updateProduct(product);
				return "forward:/product/readProduct.jsp";
			}
		}
		
		product.setFileName(names);
		productService.updateProduct(product);
		product.setFileNames(names.split(","));
		model.addAttribute("product",product);
		model.addAttribute("update", true);
		model.addAttribute("msg","multiple files uploaded successfully");
		return "forward:/product/readProduct.jsp";
	}
}
