package com.vendor;

import com.user.user;

public class vendor extends user {
	
	private int id;
	private String name;
	private String email;
	private String phone;
	private String address;
	private String services;
	private String username;
	private String password;
	
	
	
	public vendor(int id, String name, String email, String phone, String address, String services, String username,
			String password) {
		super(id,name,email,phone,address);
		this.id = id;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.services = services;
		this.username = username;
		this.password = password;
	}





	public String getServices() {
		return services;
	}



	public String getUsername() {
		return username;
	}



	public String getPassword() {
		return password;
	}
	
	
	
	

}
;