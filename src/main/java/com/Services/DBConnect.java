package com.Services;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	//create DB connection parameters
	private static String url="jdbc:mysql://localhost:3306/myplanner";
	private static String userName="root";
	private static String password="1234";
	private static Connection con;

	public static Connection getConnection() {
		
		try {
			//database connection driver
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection(url, userName, password);
			
		}
		catch (Exception e) {
			System.out.println("Database connection is not success!!!");
			e.printStackTrace();
		}
		
		return con;
	}
}
