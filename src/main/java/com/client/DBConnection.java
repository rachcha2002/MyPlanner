package com.client;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	public static String url="jdbc:mysql://localhost:3306/myplanner";
	public static String user="root";
	public static String pass="1234";
	private static Connection con;
	
	public static Connection getConnection() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection(url, user, pass);
			
			
		} catch (Exception e) {
			System.out.println("Database connection is unsuccesful!!!");
		}
		
		
		
		
		return con;
		
		
	}



	


}
