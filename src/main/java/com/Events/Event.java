package com.Events;

public class Event extends UserEvent {
	
	private String time;
	private String guestCount;
	private String hostName;
	private String category;
	private String budget;
	
	private String photo;
	private String deco;
	private String lights;
	private String catering;
	private String des;
	private String email;
	private String number;
	
	private String planStatus;
	
	
	
	public Event(int id, String name, String date, String time, String guestCount, String hostName, String category,
			String budget, String venue, String photo, String deco, String lights, String catering, String des,
			String email, String number,String username) {
		super(id, name, username, date, venue);
		
		this.time = time;
		this.guestCount = guestCount;
		this.hostName = hostName;
		this.category = category;
		this.budget = budget;
		
		this.photo = photo;
		this.deco = deco;
		this.lights = lights;
		this.catering = catering;
		this.des = des;
		this.email = email;
		this.number = number;
		
		
	}

	public int getId() {
		return super.id;
	}

	

	public String getName() {
		return super.name;
	}

	

	public String getDate() {
		return super.date;
	}

	
	public String getTime() {
		return time;
	}

	

	public String getGuestCount() {
		return guestCount;
	}

	

	public String getHostName() {
		return hostName;
	}

	

	public String getCategory() {
		return category;
	}

	

	public String getBudget() {
		return budget;
	}

	

	public String getVenue() {
		return super.venue;
	}

	

	public String getPhoto() {
		return photo;
	}

	

	public String getDeco() {
		return deco;
	}

	

	public String getLights() {
		return lights;
	}

	

	public String getCatering() {
		return catering;
	}

	

	public String getDes() {
		return des;
	}

	

	public String getEmail() {
		return email;
	}

	

	public String getNumber() {
		return number;
	}
	
	public String getUsername() {
		return super.username;
	}

	public String getPlanStatus() {
		return planStatus;
	}

	public void setPlanStatus(String planStatus) {
		this.planStatus = planStatus;
	}

	

	
	
	
	
	
}
