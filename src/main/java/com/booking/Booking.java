package com.booking;

public class Booking {
	private int booking_id;
	private String client_username;
	private String rname;
	private String venue;
	private String edate;
	private String etime;
	
	
	public Booking(int booking_id, String client_username, String rname, String venue, String edate, String etime) {
		super();
		this.booking_id = booking_id;
		this.client_username = client_username;
		this.rname = rname;
		this.venue = venue;
		this.edate = edate;
		this.etime = etime;
	}


	public int getBooking_id() {
		return booking_id;
	}


	public String getClient_username() {
		return client_username;
	}


	public String getRname() {
		return rname;
	}


	public String getVenue() {
		return venue;
	}


	public String getEdate() {
		return edate;
	}


	public String getEtime() {
		return etime;
	}

	
	
	
	
	
	

}