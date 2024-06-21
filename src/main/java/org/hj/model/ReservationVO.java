package org.hj.model;



public class ReservationVO {
	private int no;
	private String doctorId;
	private String tName;
	private String title;
	private String birth;
	private String start;
	private String end;
	private String backgroundColor;
	private boolean active;
	private boolean isRequest;
	private int reservedNo;
	private String state;


	
	// 생성자
	public ReservationVO() {
	}

	public ReservationVO(String doctorId, String tName, String title, String birth, String start,
			String end, String backgroundColor, int no) {
		this.doctorId = doctorId;
		this.tName = tName;
		this.title = title;
		this.birth = birth;
		this.start = start;
		this.end = end;
		this.backgroundColor = backgroundColor;
		this.no = no;
	}

	
	
	
	
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(String doctorId) {
		this.doctorId = doctorId;
	}

	public String gettName() {
		return tName;
	}

	public void settName(String tName) {
		this.tName = tName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getBackgroundColor() {
		return backgroundColor;
	}

	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}

	
	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public boolean isRequest() {
		return isRequest;
	}

	public void setRequest(boolean isRequest) {
		this.isRequest = isRequest;
	}

	
	public int getReservedNo() {
		return reservedNo;
	}

	public void setReservedNo(int reservedNo) {
		this.reservedNo = reservedNo;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "ReservationVO [no=" + no + ", doctorId=" + doctorId + ", tName="
				+ tName + ", title=" + title + ", birth=" + birth + ", start="
				+ start + ", end=" + end + ", backgroundColor="
				+ backgroundColor + ", active=" + active + ", isRequest="
				+ isRequest + ", reservedNo=" + reservedNo + ", state=" + state
				+ "]";
	}

}

