package org.hj.model;

import java.time.LocalDate;

public class ExVO {

	public ExVO() {
		// TODO Auto-generated constructor stub
	}
	
	private String id;
	private String password;
	private String name;
	private LocalDate birth;
	private String phone;
	private int userType;

	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public LocalDate getbirth() {
		return birth;
	}
	public void setBith(LocalDate birth) {
		this.birth = birth;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
	@Override
	public String toString() {
		return "ExVO [id=" + id + ", password=" + password + ", name=" + name + ", bith=" + birth + ", phone=" + phone
				+ ", userType=" + userType + "]";
	}

	
}
