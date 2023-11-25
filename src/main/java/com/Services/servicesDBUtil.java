package com.Services;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;

import com.Events.DBConnect;

public class servicesDBUtil {
	private static boolean isSuccess; 
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
public static List<Package> getPhoto() {
		
		ArrayList<Package> photo=new ArrayList<>();
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from package where pcategory='photography'";
			rs = stmt.executeQuery(sql);
			
			while (rs.next()){
				int pid = rs.getInt(1);
				String pname = rs.getString(2);
				String pcategory = rs.getString(3);
				String ptype = rs.getString(4);;
				String price = rs.getString(5);
				String pdescription = rs.getString(6);
				String vname = rs.getString(7);
				Package pk=new Package(pid,pname,pcategory,ptype,price,pdescription,vname);
				photo.add(pk);
				}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return photo;
		
	}
	

public static List<Package> getDeco() {
	
	ArrayList<Package> deco=new ArrayList<>();
	try {
		con = DBConnect.getConnection();
		stmt = con.createStatement();
		String sql = "select * from package where pcategory='decoration'";
		rs = stmt.executeQuery(sql);
		
		while (rs.next()){
			int pid = rs.getInt(1);
			String pname = rs.getString(2);
			String pcategory = rs.getString(3);
			String ptype = rs.getString(4);;
			String price = rs.getString(5);
			String pdescription = rs.getString(6);
			String vname = rs.getString(7);
			Package pk=new Package(pid,pname,pcategory,ptype,price,pdescription,vname);
			deco.add(pk);
			}
		
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	return deco;
	
}

public static List<Package> getCater() {
	
	ArrayList<Package> cater=new ArrayList<>();
	try {
		con = DBConnect.getConnection();
		stmt = con.createStatement();
		String sql = "select * from package where pcategory='catering'";
		rs = stmt.executeQuery(sql);
		
		while (rs.next()){
			int pid = rs.getInt(1);
			String pname = rs.getString(2);
			String pcategory = rs.getString(3);
			String ptype = rs.getString(4);;
			String price = rs.getString(5);
			String pdescription = rs.getString(6);
			String vname = rs.getString(7);
			Package pk=new Package(pid,pname,pcategory,ptype,price,pdescription,vname);
			cater.add(pk);
			}
		
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	return cater;
	
}

public static List<Package> getLights() {
	
	ArrayList<Package> landa=new ArrayList<>();
	try {
		con = DBConnect.getConnection();
		stmt = con.createStatement();
		String sql = "select * from package where pcategory='light&audio'";
		rs = stmt.executeQuery(sql);
		
		while (rs.next()){
			int pid = rs.getInt(1);
			String pname = rs.getString(2);
			String pcategory = rs.getString(3);
			String ptype = rs.getString(4);;
			String price = rs.getString(5);
			String pdescription = rs.getString(6);
			String vname = rs.getString(7);
			Package pk=new Package(pid,pname,pcategory,ptype,price,pdescription,vname);
			landa.add(pk);
			}
		
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	return landa;
	
}

public static List<Venue> getVenues() {
	
	ArrayList<Venue> venue=new ArrayList<>();
	try {
		con = DBConnect.getConnection();
		stmt = con.createStatement();
		String sql = "select * from venue";
		rs = stmt.executeQuery(sql);
		
		while (rs.next()){
			int vid = rs.getInt(1);
			String vname = rs.getString(2);
			String location = rs.getString(3);
			String owner = rs.getString(4);
			int seating = rs.getInt(5);
			String price = rs.getString(6);
			String description = rs.getString(7);
			String link = rs.getString(8);
			Venue v=new Venue(vid,vname,location,owner,seating,price,description,link);
			venue.add(v);
			}
		
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	return venue;
	
}



}
