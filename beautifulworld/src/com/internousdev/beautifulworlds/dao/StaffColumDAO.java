package com.internousdev.beautifulworlds.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.internousdev.beautifulworlds.dto.StaffColumDTO;
import com.internousdev.beautifulworlds.util.CommonUtility;
import com.internousdev.beautifulworlds.util.DBConnector;

public class StaffColumDAO {
	public List<StaffColumDTO> getColumList(){
		List<StaffColumDTO> staffColumDtoList = new ArrayList<StaffColumDTO>();
		String sql = "SELECT cl.*,info.* FROM staff_colum AS cl "
				+ "LEFT JOIN staff_info AS info "
				+ "ON cl.staff_id = info.staff_id "
				+ "ORDER BY cl.update_date DESC";
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();
		CommonUtility commonUtility = new CommonUtility();
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				StaffColumDTO staffInfoDto = new StaffColumDTO();
				staffInfoDto.setColumId(rs.getInt("colum_id"));
				staffInfoDto.setColumTitle(rs.getString("colum_title"));
				staffInfoDto.setColumDescription(rs.getString("colum_description"));
				staffInfoDto.setEditedColumDescription(commonUtility.cutDescription(rs.getString("colum_description"),0,100));
				staffInfoDto.setShortEditedColumDescription(commonUtility.cutDescription(rs.getString("colum_description"),0,30));
				staffInfoDto.setStaffId(rs.getInt("staff_id"));
				staffInfoDto.setColumImageFilePath(rs.getString("cl.image_file_path"));
				staffInfoDto.setColumImageFileName(rs.getString("cl.image_file_name"));
				staffInfoDto.setUpdateDate(rs.getDate("cl.update_date"));
				staffInfoDto.setStaffName(rs.getString("info.staff_name"));
				staffInfoDto.setPosition(rs.getString("info.position"));
				staffInfoDto.setCut(rs.getString("info.cut"));
				staffInfoDto.setStaffPr(rs.getString("info.staff_pr"));
				staffInfoDto.setStaffImageFilePath(rs.getString("info.image_file_path"));
				staffInfoDto.setStaffImageFileName(rs.getString("info.image_file_name"));
				staffColumDtoList.add(staffInfoDto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return staffColumDtoList;
	}



	public List<StaffColumDTO> getColumListByStaffId(String staffId){
		List<StaffColumDTO> staffColumDtoList = new ArrayList<StaffColumDTO>();
		String sql = "SELECT cl.*,info.* FROM staff_colum AS cl "
				+ "LEFT JOIN staff_info AS info "
				+ "ON cl.staff_id = info.staff_id "
				+ "WHERE cl.staff_id = ? "
				+ "ORDER BY cl.update_date DESC";
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();
		CommonUtility commonUtility = new CommonUtility();
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, staffId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				StaffColumDTO staffInfoDto = new StaffColumDTO();
				staffInfoDto.setColumId(rs.getInt("colum_id"));
				staffInfoDto.setColumTitle(rs.getString("colum_title"));
				staffInfoDto.setColumDescription(rs.getString("colum_description"));
				staffInfoDto.setEditedColumDescription(commonUtility.cutDescription(rs.getString("colum_description"),0,100));
				staffInfoDto.setStaffId(rs.getInt("staff_id"));
				staffInfoDto.setColumImageFilePath(rs.getString("cl.image_file_path"));
				staffInfoDto.setColumImageFileName(rs.getString("cl.image_file_name"));
				staffInfoDto.setUpdateDate(rs.getDate("cl.update_date"));
				staffInfoDto.setStaffName(rs.getString("info.staff_name"));
				staffInfoDto.setPosition(rs.getString("info.position"));
				staffInfoDto.setCut(rs.getString("info.cut"));
				staffInfoDto.setStaffPr(rs.getString("info.staff_pr"));
				staffInfoDto.setStaffImageFilePath(rs.getString("info.image_file_path"));
				staffInfoDto.setStaffImageFileName(rs.getString("info.image_file_name"));
				staffColumDtoList.add(staffInfoDto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return staffColumDtoList;
	}

	public StaffColumDTO getColum(int columId){
		StaffColumDTO staffInfoDto = new StaffColumDTO();
		String sql = "SELECT cl.*,info.* FROM staff_colum AS cl "
				+ "LEFT JOIN staff_info AS info "
				+ "ON cl.staff_id = info.staff_id "
				+ "WHERE cl.colum_id = ?";
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();
		CommonUtility commonUtility = new CommonUtility();

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, columId);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				staffInfoDto.setColumId(rs.getInt("colum_id"));
				staffInfoDto.setColumTitle(rs.getString("colum_title"));
				staffInfoDto.setColumDescription(rs.getString("colum_description"));
				staffInfoDto.setEditedColumDescription(commonUtility.cutDescription(rs.getString("colum_description"),0,100));
				staffInfoDto.setShortEditedColumDescription(commonUtility.cutDescription(rs.getString("colum_description"),0,30));
				staffInfoDto.setStaffId(rs.getInt("staff_id"));
				staffInfoDto.setColumImageFilePath(rs.getString("cl.image_file_path"));
				staffInfoDto.setColumImageFileName(rs.getString("cl.image_file_name"));
				staffInfoDto.setUpdateDate(rs.getDate("cl.update_date"));
				staffInfoDto.setStaffName(rs.getString("info.staff_name"));
				staffInfoDto.setPosition(rs.getString("info.position"));
				staffInfoDto.setCut(rs.getString("info.cut"));
				staffInfoDto.setStaffPr(rs.getString("info.staff_pr"));
				staffInfoDto.setStaffImageFilePath(rs.getString("info.image_file_path"));
				staffInfoDto.setStaffImageFileName(rs.getString("info.image_file_name"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return staffInfoDto;
	}


}
