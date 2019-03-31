package com.internousdev.beautifulworlds.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.beautifulworlds.dao.NewsInfoDAO;
import com.internousdev.beautifulworlds.dao.ProductInfoDAO;
import com.internousdev.beautifulworlds.dao.StaffColumDAO;
import com.internousdev.beautifulworlds.dao.StylingListDAO;
import com.internousdev.beautifulworlds.dto.NewsInfoDTO;
import com.internousdev.beautifulworlds.dto.ProductInfoDTO;
import com.internousdev.beautifulworlds.dto.StaffColumDTO;
import com.internousdev.beautifulworlds.dto.StylingListDTO;
import com.opensymphony.xwork2.ActionSupport;

import lombok.Getter;
import lombok.Setter;
@Getter @Setter
public class HomeAction extends ActionSupport implements SessionAware{

	private Map<String, Object> session;
	private StaffColumDAO staffColumDao = new StaffColumDAO();
	private NewsInfoDAO newsInfoDao = new NewsInfoDAO();
	private StylingListDAO stylingListDao = new StylingListDAO();
	private ProductInfoDAO productInfoDao = new ProductInfoDAO();
	private List<StaffColumDTO> staffColumDtoList = new ArrayList<StaffColumDTO>();
	private List<StaffColumDTO> subStaffColumDtoList = new ArrayList<StaffColumDTO>();
	private List<NewsInfoDTO> newsInfoDtoList = new ArrayList<NewsInfoDTO>();
	private List<StylingListDTO> stylinListDtoList = new ArrayList<StylingListDTO>();
	private List<ProductInfoDTO> productInfoDtoList = new ArrayList<ProductInfoDTO>();
	public String execute() {
		if(!session.containsKey("logined")) {
			session.put("logined", 0);
		}
		staffColumDtoList = staffColumDao.getColumList();
		subStaffColumDtoList = staffColumDtoList.subList(0, 3);
		newsInfoDtoList = newsInfoDao.GetNewsInfo();
		stylinListDtoList = stylingListDao.getAllStylingList().subList(0, 1);
		productInfoDtoList = productInfoDao.getProductInfoListByRandom();
		return SUCCESS;
	}
}