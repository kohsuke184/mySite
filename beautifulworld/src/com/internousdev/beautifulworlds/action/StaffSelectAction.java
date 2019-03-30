package com.internousdev.beautifulworlds.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.beautifulworlds.dao.StaffInfoDAO;
import com.internousdev.beautifulworlds.dto.StaffInfoDTO;
import com.opensymphony.xwork2.ActionSupport;


public class StaffSelectAction extends ActionSupport implements SessionAware {
	public StaffInfoDAO staffInfoDAO = new StaffInfoDAO();
	public List<StaffInfoDTO> staffInfoDTOList = new ArrayList<StaffInfoDTO>();

	public String execute() throws SQLException{
		String result = SUCCESS;
		staffInfoDTOList = staffInfoDAO.selectStaffInfo();
		return result;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO 自動生成されたメソッド・スタブ

	}

	public List<StaffInfoDTO> getStaffInfoDTOList() {
		return staffInfoDTOList;
	}

	public void setStaffInfoDTOList(List<StaffInfoDTO> staffInfoDTOList) {
		this.staffInfoDTOList = staffInfoDTOList;
	}






}
