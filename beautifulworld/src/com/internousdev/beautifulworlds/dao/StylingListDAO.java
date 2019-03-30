package com.internousdev.beautifulworlds.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.internousdev.beautifulworlds.dto.StylingListDTO;
import com.internousdev.beautifulworlds.util.DBConnector;
public class StylingListDAO{


	private List<StylingListDTO> stylingListDtoList = new ArrayList<StylingListDTO>();


	public List<StylingListDTO> getAllStylingList(){
		DBConnector dbconnector = new DBConnector();
		Connection connection = dbconnector.getConnection();
		String sql = "SELECT style.*,info.* FROM styling_list AS style "
				+ "LEFT JOIN staff_info AS info "
				+ "ON style.staff_id = info.staff_id";;
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				StylingListDTO stylingListDto = new StylingListDTO();
				stylingListDto.setStyleId(rs.getInt("style_id"));
				stylingListDto.setCategoryId(rs.getInt("style.category_id"));
				stylingListDto.setStyleTheme(rs.getString("style_theme"));
				stylingListDto.setStyleDescription(rs.getString("style_description"));
				stylingListDto.setStylePopularYear(rs.getString("style_popular_year"));
				stylingListDto.setStaffId(rs.getInt("info.staff_id"));
				stylingListDto.setImageFilePath(rs.getString("style.image_file_path"));
				stylingListDto.setImageFileName(rs.getString("style.image_file_name"));
				stylingListDto.setUpdateDate(rs.getDate("style.update_date"));
				stylingListDtoList.add(stylingListDto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				connection.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return stylingListDtoList;
	}
}
