package com.internousdev.beautifulworlds.dto;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class StaffInfoDTO {

	private int staffId;
	private String staffName;
	private String staffNameKana;
	private String position;
	private String cut;
	private String staffPr;
	private String imageFilePath;
	private String imageFileName;
}
