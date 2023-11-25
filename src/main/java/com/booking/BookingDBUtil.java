package com.booking;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.client.DBConnection;
import com.mysql.jdbc.PreparedStatement;

public class BookingDBUtil {
	
	private static boolean isSuccess;
	private static Connection con=null;
	private static Statement stmt=null;
	private static ResultSet rs=null;
	
//public static List<Booking> getBookingDetails (String client_id){
//		
//		ArrayList <Booking> booking = new ArrayList<>();
//		
//		
//		try {
//			con=DBConnection.getConnection();
//			stmt=con.createStatement();
//		
//			
//			String sql="select * from bookingdata where cid='"+client_id+"'";
//			
//			rs= stmt.executeQuery(sql);
//			
//			while(rs.next()) {
//				
//				int booking_id=rs.getInt(1);
//				String c_id=rs.getString(2);
//				String hotel=rs.getString(3);
//				String hall=rs.getString(4);
//				String edate=rs.getString(5)	;
//				String etime=rs.getString(6);;
//				
//				
//				Booking b=new Booking(booking_id,c_id,hotel,hall,edate,etime);
//				booking.add(b);
//				
//			}
//			
//			
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//	
//		
//		
//		return booking;
//	}
	
	public static List<Booking> getBookingDetails(String cusername) {
	    List<Booking> booking = new ArrayList<>();

	   try {
		   con=DBConnection.getConnection();
		   stmt=con.createStatement();
		   
		   String sql="select * from bookingdata where cusername='"+cusername+"';";
		   rs=stmt.executeQuery(sql);
		   
		   
		   while (rs.next()) {
       	 	int booking_id = rs.getInt("booking_id"); // Replace with the actual column name
               String c_username = rs.getString("cusername");
               String rname = rs.getString("reservation_name");
               String venue = rs.getString("venue");
               String edate = rs.getString("edate");
               String etime = rs.getString("etime");


           Booking b = new Booking(booking_id, c_username, rname, venue, edate, etime);
           booking.add(b);
       }
				   
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	   
	   
	   return booking;
	}

	
	public static List<Booking> getAllBookings() {
	    List<Booking> booking = new ArrayList<>();

	    try (Connection con = DBConnection.getConnection();
	         Statement stmt = con.createStatement();
	         ResultSet rs = stmt.executeQuery("SELECT * FROM bookingdata WHERE booking_id=?")) {
	        while (rs.next()) {
	        	 	int booking_id = rs.getInt("booking_id"); // Replace with the actual column name
	                String c_username = rs.getString("cusername");
	                String rname = rs.getString("reservation_name");
	                String venue = rs.getString("venue");
	                String edate = rs.getString("edate");
	                String etime = rs.getString("etime");


	            Booking b = new Booking(booking_id, c_username, rname, venue, edate, etime);
	            booking.add(b);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return booking;
	}



public static boolean bookingevent(String cusername, String rname,String venue,String edate,String etime) {
	
	 isSuccess=false;

	
	
	try {
		con=DBConnection.getConnection();
		stmt=con.createStatement();
		
		
		
		String sql="insert into bookingdata values(0,'"+cusername+"','"+rname+"','"+venue+"','"+edate+"','"+etime+"');";
		int rs=stmt.executeUpdate(sql);
		
		if(rs>0) {
			isSuccess=true;
		}
		else {
			isSuccess=false;
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	
	
	return isSuccess;
	
	
}
public static boolean updateBooking(String booking_id, String cusername, String rname, String venue, String edate, String etime) {
    boolean isSuccess = false;

    try {
        con = DBConnection.getConnection();

        String sql = "UPDATE bookingdata SET cusername=?, reservation_name=?, venue=?, edate=?, etime=? WHERE booking_id=?";
        PreparedStatement pstmt = (PreparedStatement) con.prepareStatement(sql);
        
        // Set the parameters for the prepared statement
        pstmt.setString(1, cusername);
        pstmt.setString(2, rname);
        pstmt.setString(3, venue);
        pstmt.setString(4, edate);
        pstmt.setString(5, etime);
        pstmt.setString(6, booking_id);

        int rowsUpdated = pstmt.executeUpdate();

        if (rowsUpdated > 0) {
            isSuccess = true;
        } else {
            isSuccess = false;
        }

    } catch (SQLException e) {
        e.printStackTrace();
        // Handle the exception, possibly log it, and provide user feedback
    } finally {
        // Close the database connection and prepared statement in a "finally" block
        // to ensure resources are properly released.
       // DBConnection.close(con);
    }

    return isSuccess;
}


public static boolean deletebooking(String bid) {
	isSuccess=false;
		int convId=Integer.parseInt(bid);
	
	
	try {
		con=DBConnection.getConnection();
		stmt=con.createStatement();
		String sql="delete from bookingdata where booking_id='"+convId+"'";
		int rs=stmt.executeUpdate(sql);
		
		if(rs>0) {
			isSuccess=true;
		}
		else {
			isSuccess=false;
		}
		
		
		
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
		
		
	
	
	return isSuccess;
}

}
