package net.hncu.model;

public class User {

	private int id;
	private String user_name;
	private String user_password;
	private int user_type;
	private int user_statue;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public int getUser_statue() {
		return user_statue;
	}
	public void setUser_statue(int user_statue) {
		this.user_statue = user_statue;
	}
	public int getUser_type() {
		return user_type;
	}
	public void setUser_type(int user_type) {
		this.user_type = user_type;
	}
}
