package com.user;

public class user {
	private int id; 
	private  String name;
	private String email;
	private String phone;
	private String address;
	
	
	public user(int id,String name,String email,String phone, String address) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.address = address;
	}


	


	public String getName() {
		return name;
	}


	public int getId() {
		return id;
	}


	public String getPhone() {
		return phone;
	}


	public String getEmail() {
		return email;
	}


	public String getAddress() {
		return address;
	}
	
	
	

}
