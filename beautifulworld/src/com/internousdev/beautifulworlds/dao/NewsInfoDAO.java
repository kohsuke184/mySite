package com.internousdev.beautifulworlds.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.internousdev.beautifulworlds.dto.NewsInfoDTO;
import com.internousdev.beautifulworlds.util.DBConnector;

public class NewsInfoDAO {


	public List<NewsInfoDTO> GetNewsInfo() {
		List<NewsInfoDTO> newsInfoDtoList = new ArrayList<NewsInfoDTO>();
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();
		String sql = "SELECT * FROM news_table";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				NewsInfoDTO newsInfoDto = new NewsInfoDTO();
				newsInfoDto.setNewsId(rs.getInt("news_id"));
				newsInfoDto.setNewsTitle(rs.getString("news_title"));
				newsInfoDto.setNewsDescription(rs.getString("news_description"));
				newsInfoDto.setUpdateDate(rs.getDate("update_date"));
				newsInfoDtoList.add(newsInfoDto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return newsInfoDtoList;
	}

}
