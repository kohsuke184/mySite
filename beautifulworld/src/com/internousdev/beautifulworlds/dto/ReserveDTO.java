package com.internousdev.beautifulworlds.dto;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ReserveDTO {
	private int staffId;
	private String staffName;
	private int resMonth;
	private int resDay;
	private int resHour;
	private int resMinute;
}
