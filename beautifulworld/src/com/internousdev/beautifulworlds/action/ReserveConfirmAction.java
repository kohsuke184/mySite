package com.internousdev.beautifulworlds.action;


import java.sql.SQLException;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.beautifulworlds.dao.ReserveDAO;
import com.internousdev.beautifulworlds.dao.StaffInfoDAO;
import com.internousdev.beautifulworlds.dto.StaffInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ReserveConfirmAction extends ActionSupport implements SessionAware {
	private int day;
	private int hour;
	private int month;
	private int minute;
	private int staffId;
	private String dayOfWeek;
	private String staffName;
	private String cut;
	private String staffPr;
	private String reserveErrorMessage;
	public Map<String,Object> session;

	public String execute() throws SQLException{
		System.out.println(dayOfWeek);
		ReserveDAO reserveDao = new ReserveDAO();
		if(reserveDao.checkReserved(staffId, month, day, hour, minute) || dayOfWeek.equals("（火）"))  {
			reserveErrorMessage = "○の中から選んでください。";
			System.out.println("aa");
			return ERROR;
		}
		StaffInfoDAO staffInfoDAO = new StaffInfoDAO();
		StaffInfoDTO staffInfoDTO = staffInfoDAO.serchStaffName(staffId);
		staffName = staffInfoDTO.getStaffName();
		return SUCCESS;
	}

}
