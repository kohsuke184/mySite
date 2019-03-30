package com.internousdev.beautifulworlds.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.beautifulworlds.dao.StaffColumDAO;
import com.internousdev.beautifulworlds.dto.StaffColumDTO;
import com.opensymphony.xwork2.ActionSupport;

import lombok.Getter;
import lombok.Setter;
@Getter @Setter
public class HomeAction extends ActionSupport implements SessionAware{

	private Map<String, Object> session;
	private StaffColumDAO staffColumDao = new StaffColumDAO();
	private List<StaffColumDTO> staffColumDtoList = new ArrayList<StaffColumDTO>();
	private List<StaffColumDTO> subStaffColumDtoList = new ArrayList<StaffColumDTO>();
	public String execute() {
		if(!session.containsKey("logined")) {
			session.put("logined", 0);
		}
		staffColumDtoList = staffColumDao.getColumList();
		subStaffColumDtoList = staffColumDtoList.subList(0, 3);
		return SUCCESS;
	}
}