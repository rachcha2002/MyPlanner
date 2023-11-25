package com.Services;

public class Package {
	private int pid;
	private String pname;
	private String pcategory;
	private String ptype;
	private String price;
	private String description;
	private String vname;
	
	public Package(int pid, String pname, String pcategory, String ptype, String price, String description,String vname) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.pcategory = pcategory;
		this.ptype = ptype;
		this.price = price;
		this.description = description;
		this.vname = vname;
	}

	public int getPid() {
		return pid;
	}

	public String getPname() {
		return pname;
	}
	
	public String getPcategory() {
		return pcategory;
	}

	public String getPtype() {
		return ptype;
	}

	public String getPrice() {
		return price;
	}

	public String getDescription() {
		return description;
	}
	
	public String getVname() {
		return vname;
	}

}
