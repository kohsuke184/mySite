package com.internousdev.beautifulworlds.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class StaffColumDTO {
	private int columId;
	private String columTitle;
	private String columDescription;
	private String editedColumDescription;
	private String shortEditedColumDescription;
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
}
