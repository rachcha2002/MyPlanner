package com.Package;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class packageDBUtil {
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	public static boolean insertDetails(String pname,String pcategory,String ptype,String price,String description,String vname) {
		
		boolean isSuccess = false;
		
		try {
			con = DBConnect.getConnection();
            stmt = con.createStatement();
			
			String sql = "insert into package values(0,'"+pname+"','"+pcategory+"','"+ptype+"','"+price+"','"+description+"','"+vname+"')";
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0){
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
	
	public static List<Package> getDetails(String vname){
		
		ArrayList<Package> p = new ArrayList<>();
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from package where vname='"+vname+"'";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int pid = rs.getInt(1);
				String pname = rs.getString(2);
				String pcategory = rs.getString(3);
				String ptype = rs.getString(4);
				String price = rs.getString(5);
				String description = rs.getString(6);
				String Vname = rs.getString(7);
				
				Package pkg = new Package(pid,pname,pcategory,ptype,price,description,Vname);
				p.add(pkg);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();	
		}
		
		return p;	
	}
	
	public static boolean updateProfile(String pid,String pname,String pcategory,String ptype,String price,String description) {
		
		int convertedpid = Integer.parseInt(pid);
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "update package set pname = '"+pname+"',pcategory = '"+pcategory+"',ptype = '"+ptype+"',price='"+price+"',pdescription = '"+description+"' where pid ='"+convertedpid+"'";
			
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
	
public static List<Package> getUpdatedDetails(String pid){
	    int convertedpid = Integer.parseInt(pid);
		
		ArrayList<Package> up = new ArrayList<>();
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from package where pid='"+convertedpid+"'";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int ppid = rs.getInt(1);
				String pname = rs.getString(2);
				String pcategory = rs.getString(3);
				String ptype = rs.getString(4);
				String price = rs.getString(5);
				String description = rs.getString(6);
				String Vname = rs.getString(7);
				
				Package pack = new Package(ppid,pname,pcategory,ptype,price,description,Vname);
				up.add(pack);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();	
		}
		
		return up;	
	}
public static boolean deleteProfile(String pid) {
	int convertedpid = Integer.parseInt(pid);
	
	try {
		con = DBConnect.getConnection();
		stmt = con.createStatement();
		String sql = "delete from package where pid='"+convertedpid+"'";
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



