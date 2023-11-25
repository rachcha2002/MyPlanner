package com.client;

import com.user.user;

public class Client extends user {
	private int id;
	private String name;
	private String gender;
	private String dob;
	private String email;
	private String phone;
	private String address;
	private String username;
	private String password;
	
	
	
	
	public Client(int id, String name, String gender, String dob, String email, String phone, String address,
			String username, String password) {
		
		
		
		super(id,name,email,phone,address);
		this.gender = gender;
		this.dob = dob;
		this.username = username;
		this.password = password;
	}



	public String getGender() {
		return gender;
	}




	public String getDob() {
		return dob;
	}



	public String getUsername() {
		return username;
	}




	public String getPassword() {
		return password;
	}
	
	
	
}
