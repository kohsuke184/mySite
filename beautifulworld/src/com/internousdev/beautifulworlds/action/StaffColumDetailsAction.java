package com.internousdev.beautifulworlds.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.internousdev.beautifulworlds.dao.StaffColumDAO;
import com.internousdev.beautifulworlds.dao.StaffInfoDAO;
import com.internousdev.beautifulworlds.dto.StaffColumDTO;
import com.internousdev.beautifulworlds.dto.StaffInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class StaffColumDetailsAction extends ActionSupport {

	private StaffColumDAO staffColumDao = new StaffColumDAO();
	private StaffInfoDAO staffInfoDao = new StaffInfoDAO();
	private List<StaffInfoDTO> staffInfoDtoList = new ArrayList<StaffInfoDTO>();

	private int columId;
	private String columTitle;
	private String columDescription;
	private int staffId;
	private String staffName;
	private String position;
	private String cut;
	private String staffPr;
	private String staffImageFilePath;
	private String staffImageFileName;
	private String columImageFilePath;
	private String columImageFileName;
	private Date updateDate;

	public String execute() {
		staffInfoDtoList = staffInfoDao.selectStaffInfo();
		StaffColumDTO staffColumDto = staffColumDao.getColum(columId);
		columId = staffColumDto.getColumId();
		columTitle = staffColumDto.getColumTitle();
		columDescription = staffColumDto.getColumDescription();
		staffId = staffColumDto.getStaffId();
		staffName = staffColumDto.getStaffName();
		position = staffColumDto.getPosition();
		cut = staffColumDto.getCut();
		staffPr = staffColumDto.getStaffPr();
		staffImageFilePath = staffColumDto.getStaffImageFilePath();
		staffImageFileName = staffColumDto.getStaffImageFileName();
		columImageFilePath = staffColumDto.getColumImageFilePath();
		columImageFileName = staffColumDto.getColumImageFileName();
		updateDate = staffColumDto.getUpdateDate();
		return SUCCESS;
	}

}
