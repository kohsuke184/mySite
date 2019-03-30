package com.internousdev.beautifulworlds.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnector {



//localhost用ゲットコネクション
	public Connection getConnection(){
		String driverName ="com.mysql.jdbc.Driver";
		String url ="jdbc:mysql://localhost/beautifulworlds";
		String user ="root";
		String password ="asdfg184";
		Connection con = null;
		try{
			Class.forName(driverName);
			con = DriverManager.getConnection(url,user,password);
		}catch (ClassNotFoundException e){
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return con;
	}

//AWS接続用ゲットコネクション
//		public Connection getConnection() {
//			Connection con = null;
//			try {
//
//			      Class.forName("com.mysql.jdbc.Driver");
//			      String dbName = "beautifulworlds";
//			      String userName = System.getProperty("RDS_USERNAME");
//			      String password = System.getProperty("RDS_PASSWORD");
//			      String hostname = System.getProperty("RDS_HOSTNAME");
//			      String port = System.getProperty("RDS_PORT");
//			      String jdbcUrl = "jdbc:mysql://" + hostname + ":" + port + "/" + dbName + "?user=" + userName + "&password=" + password;
//
//			      con = DriverManager.getConnection(jdbcUrl);
//
//
//			} catch (ClassNotFoundException e) {
//				e.printStackTrace();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//			return con;
//		}



}
