package com.Package;

public class Package extends Service{
	
	private String pcategory;
	private String ptype;
	
	public Package(int pid, String pname, String pcategory, String ptype, String price, String description,String vname) {
		super(pid,pname,price,description,vname);
		
		this.pcategory = pcategory;
		this.ptype = ptype;
		
	}

	public int getPid() {
		return super.sid;
	}

	public String getPname() {
		return super.sname;
	}
	
	public String getPcategory() {
		return pcategory;
	}

	public String getPtype() {
		return ptype;
	}

	public String getPrice() {
		return super.price;
	}

	public String getDescription() {
		return super.description;
	}
	
	public String getVname() {
		return super.uname;
	}

}
