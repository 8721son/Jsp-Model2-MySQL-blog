package com.cos.test;

import com.cos.model.User;

public class OAuthUser {
	private int id;
	private String access_token;
	private String refresh_token;
	private String token_type;
	private String expire_in;
	
	private User user = new User();
	
	public OAuthUser() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAccess_token() {
		return access_token;
	}

	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}

	public String getRefresh_token() {
		return refresh_token;
	}

	public void setRefresh_token(String refresh_token) {
		this.refresh_token = refresh_token;
	}

	public String getToken_type() {
		return token_type;
	}

	public void setToken_type(String token_type) {
		this.token_type = token_type;
	}

	public String getExpire_in() {
		return expire_in;
	}

	public void setExpire_in(String expire_in) {
		this.expire_in = expire_in;
	}

	public OAuthUser(int id, String access_token, String refresh_token, String token_type, String expire_in) {
		super();
		this.id = id;
		this.access_token = access_token;
		this.refresh_token = refresh_token;
		this.token_type = token_type;
		this.expire_in = expire_in;
	}
	
}
