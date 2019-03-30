package com.internousdev.beautifulworlds.action;

import java.sql.SQLException;

import com.internousdev.beautifulworlds.dao.ReserveDAO;
import com.opensymphony.xwork2.ActionSupport;

public class ReserveCompleteAction extends ActionSupport {
	private int staffId;
	private String staffName;
	private int month;
	private int day;
	private int hour;
	private int minute;

	public String execute() throws SQLException{
		String result = SUCCESS;
		ReserveDAO dao = new ReserveDAO();
		dao.InsertReserve(staffId, staffName,month,day,minute,hour);



		return result;
	}

	public int getStaffId() {
		return staffId;
	}

	public void setStaffId(int staffId) {
		this.staffId = staffId;
	}

	public String getStaffName() {
		return staffName;
	}

	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public int getHour() {
		return hour;
	}

	public void setHour(int hour) {
		this.hour = hour;
	}

	public int getMinute() {
		return minute;
	}

	public void setMinute(int minute) {
		this.minute = minute;
	}



}
