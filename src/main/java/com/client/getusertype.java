package com.client;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class getusertype {
	private static boolean isSuccess;
	private static Connection con=null;
	private static Statement stmt=null;
	private static ResultSet rs=null;
	
	
	
	public static String usertype(String username) {
	    String usertype = "Vendor"; // Default to "Vendor" in case of an error

	    try {
	        con = DBConnection.getConnection();
	        stmt = con.createStatement();

	        String sql = "SELECT COUNT(*) AS user_count FROM clientdata WHERE username = '" + username + "'";
	        
	        rs = stmt.executeQuery(sql);
	        if (rs.next()) {
	            int count = rs.getInt("user_count");

	            if (count > 0) {
	                usertype = "Client";
	            }
	            
	            else {
	            	usertype="Vendor";
	            	
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return usertype;
	}
}