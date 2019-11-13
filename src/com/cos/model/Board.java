package com.cos.model;

import java.sql.Timestamp;

public class Board {
	private int id;
	private int userId;
	private String title;
	private String content;
	private int readCount;
	private Timestamp createDate;
	private String previewImg; //DB와 상관없음
	private User user = new User();
	
	
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getPreviewImg() {
		return previewImg;
	}

	public void setPreviewImg(String previewImg) {
		this.previewImg = previewImg;
	}

	public Board() {
		// TODO Auto-generated constructor stub
	}

	public Board(int id, int userId, String title, String content, int readCount, Timestamp createDate) {
		super();
		this.id = id;
		this.userId = userId;
		this.title = title;
		this.content = content;
		this.readCount = readCount;
		this.createDate = createDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	
	
}
