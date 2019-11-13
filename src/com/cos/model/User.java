package com.cos.model;

import java.sql.Timestamp;

public class User {
	private int id;
	private String userProfile;//이미지 경로
	private String username;
	private String password;
	private String email;
	private String address;
	private Timestamp createDate;

	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getUserProfile() {
		return userProfile;
	}

	public void setUserProfile(String userProfile) {
		this.userProfile = userProfile;
	}
	
	public User() {
		// TODO Auto-generated constructor stub
	}



	public User(int id, String userProfile, String username, String password, String email, String address,
			Timestamp createDate) {
		super();
		this.id = id;
		this.userProfile = userProfile;
		this.username = username;
		this.password = password;
		this.email = email;
		this.address = address;
		this.createDate = createDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

}
