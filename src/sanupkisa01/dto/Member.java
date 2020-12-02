package sanupkisa01.dto;

import java.util.Date;

public class Member {
	private int custno;
	private String custname;
	private String phone;
	private String address;
	private Date joindate;
	private String grade;
	private String city;

	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String custname, String phone, String address, String grade, String city) {
		this.custname = custname;
		this.phone = phone;
		this.address = address;
		this.grade = grade;
		this.city = city;
	}

	public Member(int custno, String custname, String phone, String address, Date joindate, String grade, String city) {
		this.custno = custno;
		this.custname = custname;
		this.phone = phone;
		this.address = address;
		this.joindate = joindate;
		this.grade = grade;
		this.city = city;
	}

	public int getCustno() {
		return custno;
	}

	public void setCustno(int custno) {
		this.custno = custno;
	}

	public String getCustname() {
		return custname;
	}

	public void setCustname(String custname) {
		this.custname = custname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getJoindate() {
		return joindate;
	}

	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Override
	public String toString() {
		return String.format("Member [custno=%s, custname=%s, phone=%s, address=%s, joindate=%s, grade=%s]", custno,
				custname, phone, address, joindate, grade);
	}

}
