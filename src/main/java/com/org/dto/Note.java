package com.org.dto;

public class Note {

	private int note_id;
	
	private int user_id;
	
	private String title;
	
	private String d_time;
	
	private String desc;

	public int getNote_id() {
		return note_id;
	}

	public void setNote_id(int note_id) {
		this.note_id = note_id;
	}
	
	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getD_time() {
		return d_time;
	}

	public void setD_time(String d_time) {
		this.d_time = d_time;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}
	
}
