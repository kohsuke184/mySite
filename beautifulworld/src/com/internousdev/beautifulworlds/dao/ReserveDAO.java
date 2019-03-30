package com.internousdev.beautifulworlds.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.internousdev.beautifulworlds.dto.ReserveDTO;
import com.internousdev.beautifulworlds.util.DBConnector;

public class ReserveDAO {


	private DBConnector db = new DBConnector();
	private Connection con = db.getConnection();
	Map<String,Object> Session;
	public List<ReserveDTO> reservationList = new ArrayList<ReserveDTO>();


	public List<ReserveDTO> selectAllReservation(int staffId) throws SQLException{
		String sql = "SELECT * FROM reservation_info WHERE staff_id = ? ";

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, staffId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				ReserveDTO dto = new ReserveDTO();
				dto.setStaffId(rs.getInt("staff_id"));
				dto.setStaffName(rs.getString("staff_name"));
				dto.setResDay(rs.getInt("day"));
				dto.setResMonth(rs.getInt("month"));
				dto.setResHour(rs.getInt("hour"));
				dto.setResMinute(rs.getInt("minute"));
				reservationList.add(dto);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		con.close();
		return reservationList;

	}

	public boolean checkReserved(int staffId,int month,int day,int hour,int minute) throws SQLException{
		boolean result = false;
		String sql = "SELECT COUNT(*) AS count FROM reservation_info WHERE staff_id = ? AND month = ? AND day = ? AND hour = ? AND minute = ?";
		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, staffId);
			ps.setInt(2, month);
			ps.setInt(3, day);
			ps.setInt(4, hour);
			ps.setInt(5, minute);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				if(rs.getInt("count")>0) {
					result = true;
				}
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		con.close();
		return result;

	}




public void InsertReserve(int staffId,String staffName,int month,int day,int minute,int hour) throws SQLException{
		String sql = "INSERT INTO reservation_info "
				+ "(staff_id,staff_name,month,day,hour,minute) VALUES(?, ?, ?, ?, ?, ?)";
		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, staffId);
			ps.setString(2, staffName);
			ps.setInt(3, month);
			ps.setInt(4, day);
			ps.setInt(5, hour);
			ps.setInt(6, minute);
			ps.execute();


		}catch(SQLException e){
			e.printStackTrace();
		}
		con.close();

	}

}




















