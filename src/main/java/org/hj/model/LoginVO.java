package org.hj.model;

public class LoginVO {

	
	private String id;
	private String password;
	private String name;
	private String birth;
	private String phone;
	private int userType;
	
	public LoginVO() {}
	
	public LoginVO(String id, String password, String name, String birth, String phone, int userType) {
        this.id = id;
        this.password = password;
        this.name = name;
        this.birth = birth;
        this.phone = phone;
        this.userType = userType;
    }
	
	
	public final String getId() {
		return id;
	}
	public final void setId(String id) {
		this.id = id;
	}
	public final String getPassword() {
		return password;
	}
	public final void setPassword(String password) {
		this.password = password;
	}
	public final String getName() {
		return name;
	}
	public final void setName(String name) {
		this.name = name;
	}
	public final String getBirth() {
		return birth;
	}
	public final void setBirth(String birth) {
		this.birth = birth;
	}
	public final String getPhone() {
		return phone;
	}
	public final void setPhone(String phone) {
		this.phone = phone;
	}
	public final int getUserType() {
		return userType;
	}
	public final void setUserType(int userType) {
		this.userType = userType;
	}
	
	@Override
	public String toString() {
		return "LoginVO [id=" + id + ", password=" + password + ", name=" + name + ", birth=" + birth + ", phone="
				+ phone + ", userType=" + userType + "]";
	}
	
	
	
	
	
}
