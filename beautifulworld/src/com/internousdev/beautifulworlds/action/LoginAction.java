package com.internousdev.beautifulworlds.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.beautifulworlds.dao.CartInfoDAO;
import com.internousdev.beautifulworlds.dao.UserInfoDAO;
import com.internousdev.beautifulworlds.dto.CartInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements SessionAware {
	private String userId;
	private String password;
	private int saveUserId;
	private Map<String, Object> session;
	private UserInfoDAO dao = new UserInfoDAO();
	private CartInfoDAO cartInfoDao = new CartInfoDAO();
	private List<CartInfoDTO> cartInfoDtoList = new ArrayList<CartInfoDTO>();

	@SuppressWarnings("unchecked")
	public String execute() throws SQLException{
		String result=ERROR;
		if(dao.isExistsUserInfo(userId, password)) {
			if(dao.login(userId, password) > 0) {
				// カートの情報をユーザーに紐づける。

				result = SUCCESS;
				session.put("loginId",userId);
				session.put("logined", 1);

				if(session.containsKey("notLoginCartInfoDtoList")) {

					List<CartInfoDTO> newCartInfoDtoList = new ArrayList<CartInfoDTO> ();
					List<CartInfoDTO> notLoginCartInfoDtoList =(List<CartInfoDTO>) session.get("notLoginCartInfoDtoList");
					List<CartInfoDTO> loginCartInfoDtoList = cartInfoDao.getCartInfoDtoList(userId);
					int productId;
					int price;
					int productCount;

					//未ログイン時に作成したカート情報リスト更新（ログイン時のカート情報に重複する商品idがあった場合の個数変更）
					for (CartInfoDTO notLoginCartInfoDto : notLoginCartInfoDtoList) {
						productId = notLoginCartInfoDto.getProductId();
						price = notLoginCartInfoDto.getPrice();
						productCount = notLoginCartInfoDto.getProductCount();
						for (CartInfoDTO loginCartInfoDto : loginCartInfoDtoList) {
							if(notLoginCartInfoDto.getProductId()== loginCartInfoDto.getProductId()){
								productCount += loginCartInfoDto.getProductCount(); ;
							}
						}
						CartInfoDTO  cartInfoDto = new CartInfoDTO ();
						cartInfoDto.setProductId(productId);
						cartInfoDto.setProductCount(productCount);
						cartInfoDto.setPrice(price);
						newCartInfoDtoList.add(cartInfoDto);
					}

					//ログイン時に作成したリストの中で
					for (CartInfoDTO loginCartInfoDto : loginCartInfoDtoList) {
						boolean matchProductId = false;
						productId = loginCartInfoDto.getProductId();
						price = loginCartInfoDto.getPrice();
						productCount = loginCartInfoDto.getProductCount();
						for (CartInfoDTO notLoginCartInfoDto : notLoginCartInfoDtoList) {
							if(notLoginCartInfoDto.getProductId()== loginCartInfoDto.getProductId()){
								matchProductId = true;
							}
						}
						if(!matchProductId) {
							CartInfoDTO  cartInfoDto = new CartInfoDTO ();
							cartInfoDto.setProductId(productId);
							cartInfoDto.setProductCount(productCount);
							cartInfoDto.setPrice(price);
							newCartInfoDtoList.add(cartInfoDto);
						}
					}
					//ユーザーidに紐づく全てのカート情報を削除
					cartInfoDao.deleteAll(userId);
					for (CartInfoDTO newCartInfodto : newCartInfoDtoList) {
						cartInfoDao.regist(userId,newCartInfodto.getProductId() , newCartInfodto.getProductCount(),newCartInfodto.getPrice());
					}
					session.remove("notLoginCartInfoDtoList");
				}
				// 次の遷移先を設定
				if (session.containsKey("cartFlag")) {
					session.remove("cartFlag");
					result = "cart";
					cartInfoDtoList = cartInfoDao.getCartInfoDtoList(userId);
					session.put("cartInfoDtoList", cartInfoDtoList);
				}
			}
		}


		return result;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public int getSaveUserId() {
		return saveUserId;
	}


	public void setSaveUserId(int saveUserId) {
		this.saveUserId = saveUserId;
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
