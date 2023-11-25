package com.Services;

public class Venue {
	private int vid;
	private String vname;
	private String location;
	private String owner;
	private int seating;
	private String price;
	private String description;
	private String link;
	
	

	public Venue(int vid, String vname, String location, String owner, int seating, String price, String description,
			String link) {
		super();
		this.vid = vid;
		this.vname = vname;
		this.location = location;
		this.owner = owner;
		this.seating = seating;
		this.price = price;
		this.description = description;
		this.link = link;
	}


	public int getVid() {
		return vid;
	}

	
	public String getVname() {
		return vname;
	}

	
	public String getOwner() {
		return owner;
	}

	
	public String getLocation() {
		return location;
	}

	

	public int getSeating() {
		return seating;
	}

	

	public String getPrice() {
		return price;
	}

	

	public String getDescription() {
		return description;
	}

	

	public String getLink() {
		return link;
	}

	
	
	

}
