package com.venue;

import com.Package.Service;

public class Venue extends Service{
	
	private String location;
	private String owner;
	private int seating;
	
	private String link;
	
	
	public Venue(int vid, String vname, String location, String owner, int seating, String price, String description,String link,String uname){
		super(vid,vname,price,description,uname);
		
		this.location = location;
		this.owner = owner;
		this.seating = seating;
		
		this.link = link;
		
	}

	public int getVid() {
		return super.sid;
	}

	public String getVname() {
		return super.sname;
	}

	public String getLocation() {
		return location;
	}

	public String getOwner() {
		return owner;
	}

	public int getSeating() {
		return seating;
	}

	public String getPrice() {
		return super.price;
	}

	public String getDescription() {
		return super.description;
	}

	public String getLink() {
		return link;
	}

	public String getUname() {
		return super.uname;
	}

	
}



