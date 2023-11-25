package com.venue;

import java.sql.Connection;


import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;




public class venueDBUtil {
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	public static boolean insertDetails(String vname,String location,String owner,String seating,String price,String description,String link,String uname) {
		
		
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "insert into venue values(0,'"+vname+"','"+location+"','"+owner+"','"+seating+"','"+price+"','"+description+"','"+link+"','"+uname+"')";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}	
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	  return isSuccess;
	}
	
public static List<Venue> getDetails(String Uname){
	
		
		ArrayList<Venue> p = new ArrayList<>();
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from venue where uname='"+Uname+"'";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int vid = rs.getInt(1);
				String Vname = rs.getString(2);
				String location = rs.getString(3);
				String owner = rs.getString(4);
				int seating = rs.getInt(5);
				String price = rs.getString(6);
				String description = rs.getString(7);
				String link = rs.getString(8);
				String uname=rs.getString(9);
				
				Venue pkg = new Venue(vid,Vname,location,owner,seating,price,description,link,uname);
				p.add(pkg);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();	
		}
		
		return p;	
	}

public static boolean updateVenue(String vid,String vname,String location,String owner,String seating,String price,String description,String link) {
	
	int convertedvid = Integer.parseInt(vid);
	//int convertedseating = Integer.parseInt(seating);
	
	try {
		con = DBConnect.getConnection();
		stmt = con.createStatement();
		
		String sql = "update venue set vname ='"+vname+"',location = '"+location+"',owner= '"+owner+"',seating='"+seating+"',price='"+price+"',description = '"+description+"',link='"+link+"' where vid ='"+convertedvid+"'";
		
		int rs = stmt.executeUpdate(sql);
		
		if(rs > 0) {
			isSuccess = true;
		}
		else {
			isSuccess = false;
		}
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	
	
	return isSuccess;
}



public static boolean deleteVenue(String vid) {
	int convertedvid = Integer.parseInt(vid);
	
	try {
		con = DBConnect.getConnection();
		stmt = con.createStatement();
		String sql = "delete from venue where vid='"+convertedvid+"'";
		int rs = stmt.executeUpdate(sql);
		
		if(rs > 0) {
			isSuccess = true;
		}
		else {
			isSuccess = false;
		}
		
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	return isSuccess;
}	
	
}


