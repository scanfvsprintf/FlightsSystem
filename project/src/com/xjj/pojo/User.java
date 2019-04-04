package com.xjj.pojo;

public class User {
	private int uid;
	private String uname;
	private String pwd;
	private int age;
	public User(int uid, String uname, String pwd, int age) {
		super();
		this.uid = uid;
		this.uname = uname;
		this.pwd = pwd;
		this.age = age;
	}
	public User() {
		super();
	}
	public User(String uname, String pwd) {
		super();
		this.uname = uname;
		this.pwd = pwd;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
}
