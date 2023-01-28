package dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class MemberDTO {

	private String id;
	private String nickname;
	private String pw;
	private String name;
	private String phone;
	private String email;
	private String postcode;
	private String address1;
	private String address2;
	private Timestamp signup_date;


	public MemberDTO() {
		super();
	}
	public MemberDTO(String id, String nickname, String pw, String name, String phone, String email, String postcode,
			String address1, String address2, Timestamp signup_date) {
		this.id = id;
		this.nickname = nickname;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.postcode = postcode;
		this.address1 = address1;
		this.address2 = address2;
		this.signup_date = signup_date;
	}


	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public Timestamp getSignup_date() {
		return signup_date;
	}
	public void setSignup_date(Timestamp signup_date) {
		this.signup_date = signup_date;
	}

	// 날짜 변환 메소드
	public String getFormedDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(this.signup_date);
	}

}