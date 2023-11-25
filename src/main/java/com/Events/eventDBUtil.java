package com.Events;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;




public class eventDBUtil {
	private static boolean isSuccess; 
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	public static boolean insertevent(String name, String date, String time, String guestCount, String hostname,String category,String budget,String venue,String photo,String deco,String lights,String catering,String des,String email,String number,String userName) {
		
		isSuccess = false;
		String istatus="Pending";
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
		    String sql = "insert into events values (0,'"+name+"','"+date+"','"+time+"','"+guestCount+"','"+hostname+"','"+category+"','"+budget+"','"+venue+"','"+photo+"','"+deco+"','"+lights+"','"+catering+"','"+des+"','"+email+"','"+number+"','"+userName+"','"+istatus+"')";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	public static List<Event> getEvent(String userName,String eventName,String eid) {
		
		ArrayList<Event> cusEvent = new ArrayList<>();
		
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from events where userName='"+userName+"' and eventName='"+eventName+"' and eventId='"+eid+"'";
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String date = rs.getString(3);
				String time = rs.getString(4);;
				String guestCount = rs.getString(5);
				String hostName = rs.getString(6);
				String category = rs.getString(7);
				String budget = rs.getString(8);
				String venue = rs.getString(9);
				String photo = rs.getString(10);
				String deco = rs.getString(11);
				String lights = rs.getString(12);
				String catering = rs.getString(13);
				String des = rs.getString(14);
				String email = rs.getString(15);
				String number = rs.getString(16);
				String username=rs.getString(17);
				String status=rs.getString(18);
				Event cus = new Event(id,name, date, time, guestCount, hostName, category, budget, venue, photo, deco, lights, catering, des, email, number,username);
				cus.setPlanStatus(status);
				cusEvent.add(cus);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cusEvent;	
	}
public static List<UserEvent> getUserEvent(String userName) {
		
		ArrayList<UserEvent> cusEvents = new ArrayList<>();
		
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from events where userName='"+userName+"'";
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String date = rs.getString(3);
				String username=rs.getString(17);
				String venue = rs.getString(9);
				UserEvent cus = new UserEvent(id,name,username,date,venue);
				cusEvents.add(cus);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cusEvents;	
	}
	

public static boolean updateevent(String id,String name, String date, String time, String guestCount, String hostname,String category,String budget,String venue,String photo,String deco,String lights,String catering,String des,String email,String number,String userName) {
	int convId = Integer.parseInt(id);
	isSuccess = false;
	
	try {
		con = DBConnect.getConnection();
		stmt = con.createStatement();
	    String sql = "update events set eventName='"+name+"',eventDate='"+date+"',eventTime='"+time+"',numOfGuests='"+guestCount+"',hostName='"+hostname+"',category='"+category+"',budget='"+budget+"',venue='"+venue+"',photo='"+photo+"',deco='"+deco+"',lights='"+lights+"',catering='"+catering+"',description='"+des+"',email='"+email+"',number='"+number+"',userName='"+userName+"' where eventId='"+convId+"' and userName='"+userName+"'";
		int r = stmt.executeUpdate(sql);
		
		if(r > 0) {
			isSuccess = true;
		} else {
			isSuccess = false;
		}
		
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	
	return isSuccess;
}


public static boolean deleteEvent(String id) {
	
	int convId = Integer.parseInt(id);
	
	try {
		
		con = DBConnect.getConnection();
		stmt = con.createStatement();
		String sql = "delete from events where eventId='"+convId+"'";
		int r = stmt.executeUpdate(sql);
		
		if (r > 0) {
			isSuccess = true;
		}
		else {
			isSuccess = false;
		}
		
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	
	return isSuccess;
}

public static boolean checkEvent(String userName,String ename,String category) {
	boolean check=false;
	try {
		con = DBConnect.getConnection();
		stmt = con.createStatement();
		String sql = "select * from events where userName='"+userName+"' and eventName='"+ename+"'";
		rs = stmt.executeQuery(sql);
		
		if(rs.next()==true) {
			check=true;
		}
		else {
			check = false;
		}
		
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	return check;
}

public static List<UserEvent> searchEvent(String userName,String sdata) {
	ArrayList<UserEvent> cusEvents = new ArrayList<>();
	String data="%"+sdata+"%";
	
	try {
		
		con = DBConnect.getConnection();
		//stmt = con.prepareStatement();
		stmt = con.createStatement();
		String sql = "SELECT * FROM events WHERE userName = '" + userName + "' AND (eventName LIKE '"+data+"' OR description LIKE '"+data+"')";
		
		rs = stmt.executeQuery(sql);
		
		while (rs.next()) {
			int id = rs.getInt(1);
			String name = rs.getString(2);
			String date = rs.getString(3);
			String username=rs.getString(17);
			String venue = rs.getString(9);
			UserEvent cus = new UserEvent(id,name,username,date,venue);
			cusEvents.add(cus);
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return cusEvents;	
}
	

}
