package com.internousdev.beautifulworlds.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.beautifulworlds.dao.StylingListDAO;
import com.internousdev.beautifulworlds.dto.StylingListDTO;
import com.opensymphony.xwork2.ActionSupport;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class StylingListAction extends ActionSupport implements SessionAware {

	private Map<String,Object> session;
	private List<StylingListDTO> stylingListDtoList = new ArrayList<StylingListDTO> ();
	private StylingListDAO stylingListDao = new StylingListDAO();

	public String execute() {
		stylingListDtoList = stylingListDao.getAllStylingList();
		return SUCCESS;
	}

}
