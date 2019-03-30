package com.internousdev.beautifulworlds.action;

import java.util.ArrayList;
import java.util.List;

import com.internousdev.beautifulworlds.dao.StaffColumDAO;
import com.internousdev.beautifulworlds.dao.StaffInfoDAO;
import com.internousdev.beautifulworlds.dto.StaffColumDTO;
import com.internousdev.beautifulworlds.dto.StaffInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class GoStaffColumAction extends ActionSupport {
	private StaffColumDAO staffColumDao = new StaffColumDAO();
	private StaffInfoDAO staffInfoDao = new StaffInfoDAO();
	private List<StaffColumDTO> staffColumDtoList = new ArrayList<StaffColumDTO>();
	private List<StaffInfoDTO> staffInfoDtoList = new ArrayList<StaffInfoDTO>();
	private String staffId;

	public String execute() {
		staffInfoDtoList = staffInfoDao.selectStaffInfo();
		if(staffId == null) {
			staffColumDtoList = staffColumDao.getColumList();
		}else{
			staffColumDtoList = staffColumDao.getColumListByStaffId(staffId);
		}
		return SUCCESS;
	}
}
