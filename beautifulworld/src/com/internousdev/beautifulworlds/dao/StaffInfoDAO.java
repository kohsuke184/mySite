package com.internousdev.beautifulworlds.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.internousdev.beautifulworlds.dto.StaffInfoDTO;
import com.internousdev.beautifulworlds.util.DBConnector;

public class StaffInfoDAO {

	private DBConnector db = new DBConnector();
	private Connection con = db.getConnection();
	public Map<String,Object> Session;




	public List<StaffInfoDTO> selectStaffInfo() {
		List<StaffInfoDTO> staffInfoList = new ArrayList<StaffInfoDTO>();
		String sql ="SELECT * FROM staff_info";
		try{
			PreparedStatement ps =con.prepareStatement(sql);
			ResultSet rs =ps.executeQuery();
			while(rs.next()){
				StaffInfoDTO staffInfoDTO = new StaffInfoDTO();
				staffInfoDTO.setStaffId(rs.getInt("staff_id"));
				staffInfoDTO.setStaffName(rs.getString("staff_name"));
				staffInfoDTO.setStaffNameKana(rs.getString("staff_name_kana"));
				staffInfoDTO.setPosition(rs.getString("position"));
				staffInfoDTO.setCut(rs.getString("cut"));
				staffInfoDTO.setStaffPr(rs.getString("staff_pr"));
				staffInfoDTO.setImageFilePath(rs.getString("image_file_path"));
				staffInfoDTO.setImageFileName(rs.getString("image_file_name"));
				staffInfoList.add(staffInfoDTO);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			try {
				con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return staffInfoList;
	}



	public StaffInfoDTO serchStaffName(int staffId) throws SQLException{
		StaffInfoDTO staffInfoDTO = new StaffInfoDTO();
		String sql ="SELECT staff_name FROM staff_info WHERE staff_id = ?";

		try{
			PreparedStatement ps =con.prepareStatement(sql);
			ps.setInt(1, staffId);
			ResultSet rs =ps.executeQuery();

			if(rs.next()){

				staffInfoDTO.setStaffName(rs.getString("staff_name"));

			}


		}catch(SQLException e){
			e.printStackTrace();
		}
		con.close();
		return staffInfoDTO;


	}

}
