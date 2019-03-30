package com.internousdev.beautifulworlds.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
@Getter @Setter
public class StylingListDTO {
	private int styleId;
	private int categoryId;
	private String styleTheme;
	private String styleDescription;
	private String stylePopularYear;
	private int staffId;
	private String staffNama;
	private String staffNameKana;
	private String imageFilePath;
	private String imageFileName;
	private Date updateDate;
}
