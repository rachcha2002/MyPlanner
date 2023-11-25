package com.Package;

public class Service {
	
	protected int sid;
	protected String sname;
	protected String price;
	protected String description;
	protected String uname;
	
	
	
	public Service(int sid, String sname, String price, String description, String uname) {
		
		this.sid = sid;
		this.sname = sname;
		this.price = price;
		this.description = description;
		this.uname = uname;
	}

	public int getSid() {
		return sid;
	}
	
	public String getSname() {
		return sname;
	}
	
	public String getPrice() {
		return price;
	}
	
	public String getDescription() {
		return description;
	}
	
	public String getUname() {
		return uname;
	}
	
	
}
