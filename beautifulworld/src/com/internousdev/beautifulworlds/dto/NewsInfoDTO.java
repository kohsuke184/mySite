package com.internousdev.beautifulworlds.dto;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class NewsInfoDTO {
	private int newsId;
	private String newsTitle;
	private String newsDescription;
	private Date updateDate;

}
