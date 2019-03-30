package com.internousdev.beautifulworlds.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class UserInfoDTO {

	private String userId;
	private String password;
	private String familyName;
	private String firstName;
	private String familyNameKana;
	private String firstNameKana;
	private int sex;
	private String email;
	private int id;

	private String status;
	private int logined;
	private Date registDate;
	private Date updateDate;
}
