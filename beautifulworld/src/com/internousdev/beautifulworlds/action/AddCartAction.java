package com.internousdev.beautifulworlds.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.beautifulworlds.dao.CartInfoDAO;
import com.internousdev.beautifulworlds.dao.ProductInfoDAO;
import com.internousdev.beautifulworlds.dto.CartInfoDTO;
import com.internousdev.beautifulworlds.dto.ProductInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class AddCartAction extends ActionSupport implements SessionAware{

	private int productId;
	private String productName;
	private String productNameKana;
	private String imageFilePath;
	private String imageFileName;
	private int price;
	private int productCount;
	private String releaseCompany;
	private Date releaseDate;
	private String productDescription;
	private String categoryId;
	private String userId;
	private List<CartInfoDTO> cartInfoDtoList = new ArrayList<CartInfoDTO>();
	private Map<String, Object> session;
	@SuppressWarnings("unchecked")

	public String execute() {
		CartInfoDAO dao = new CartInfoDAO();
		String result = SUCCESS;
		if(session.containsKey("loginId")){
			userId = session.get("loginId").toString();
			if(dao.isExistsCartInfo(userId, productId)){
				dao.updateProductCount(userId, productId, productCount);
			}else{
				dao.regist(userId, productId, productCount, price);
			}
			cartInfoDtoList = dao.getCartInfoDtoList(userId);
			session.remove("cartInfoDtoList");
			session.put("cartInfoDtoList", cartInfoDtoList);

		}else{
			ProductInfoDAO productInfoDao = new ProductInfoDAO();
			List<CartInfoDTO> notLoginCartInfoDtoList =new ArrayList<CartInfoDTO>();
			List<ProductInfoDTO> productInfoDtoList = productInfoDao.getProductInfoList();

			if(session.containsKey("notLoginCartInfoDtoList")) {
				notLoginCartInfoDtoList = (List<CartInfoDTO>) session.get("notLoginCartInfoDtoList");
				List<CartInfoDTO> newNotLoginCartInfoDtoList = new ArrayList<CartInfoDTO>();
				boolean matchProductId=false;
				for(CartInfoDTO notLoginCartInfoDto : notLoginCartInfoDtoList) {
					CartInfoDTO cartInfoDto = new CartInfoDTO();
					cartInfoDto.setProductId(notLoginCartInfoDto.getProductId());
					cartInfoDto.setPrice(notLoginCartInfoDto.getPrice());
					if(productId == notLoginCartInfoDto.getProductId()) {
						cartInfoDto.setProductCount(notLoginCartInfoDto.getProductCount()+productCount);
						matchProductId = true;
					}else {
						cartInfoDto.setProductCount(notLoginCartInfoDto.getProductCount());
					}
					newNotLoginCartInfoDtoList.add(cartInfoDto);
				}
				if(!matchProductId) {
					CartInfoDTO cartInfoDto = new CartInfoDTO();
					cartInfoDto.setProductId(productId);
					cartInfoDto.setProductCount(productCount);
					cartInfoDto.setPrice(price);
					newNotLoginCartInfoDtoList.add(cartInfoDto);
				}
				session.remove("notLoginCartInfoDtoList");
				session.put("notLoginCartInfoDtoList", newNotLoginCartInfoDtoList);
			}else {
				CartInfoDTO cartInfoDto = new CartInfoDTO();
				cartInfoDto.setProductId(productId);
				cartInfoDto.setProductCount(productCount);
				cartInfoDto.setPrice(price);
				notLoginCartInfoDtoList.add(cartInfoDto);
				session.put("notLoginCartInfoDtoList", notLoginCartInfoDtoList);
			}
			if(session.containsKey("notLoginCartInfoDtoList")) {
				for(CartInfoDTO notLoginCartInfoDto : (List<CartInfoDTO>) session.get("notLoginCartInfoDtoList")) {
					for(ProductInfoDTO productInfoDto : productInfoDtoList) {
						if(notLoginCartInfoDto.getProductId()==productInfoDto.getProductId()) {
							CartInfoDTO dto = new CartInfoDTO();
							dto.setProductId(productInfoDto.getProductId());
							dto.setProductName(productInfoDto.getProductName());
							dto.setProductNameKana(productInfoDto.getProductNameKana());
							dto.setImageFilePath(productInfoDto.getImageFilePath());
							dto.setImageFileName(productInfoDto.getImageFileName());
							dto.setPrice(productInfoDto.getPrice());
							dto.setReleaseCompany(productInfoDto.getReleaseCompany());
							dto.setReleaseDate(productInfoDto.getReleaseDate());
							dto.setProductCount(notLoginCartInfoDto.getProductCount());
							dto.setSubtotal(productInfoDto.getPrice() * notLoginCartInfoDto.getProductCount());
							cartInfoDtoList.add(dto);
						}
					}
				}
				session.put("cartInfoDtoList", cartInfoDtoList);
			}
		}
		return result;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductNameKana() {
		return productNameKana;
	}
	public void setProductNameKana(String productNameKana) {
		this.productNameKana = productNameKana;
	}
	public String getImageFilePath() {
		return imageFilePath;
	}
	public void setImageFilePath(String imageFilePath) {
		this.imageFilePath = imageFilePath;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getProductCount() {
		return productCount;
	}
	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}
	public String getReleaseCompany() {
		return releaseCompany;
	}
	public void setReleaseCompany(String releaseCompany) {
		this.releaseCompany = releaseCompany;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public List<CartInfoDTO> getCartInfoDtoList() {
		return cartInfoDtoList;
	}
	public void setCartInfoDtoList(List<CartInfoDTO> cartInfoDtoList) {
		this.cartInfoDtoList = cartInfoDtoList;
	}




	}
