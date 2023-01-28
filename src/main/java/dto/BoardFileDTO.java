package dto;

import java.sql.Timestamp;

public class BoardFileDTO {
	
	private int bf_seq;
	private String bf_oriName;
	private String bf_sysName;
	private Timestamp bf_upload_date;
	private int b_seq;
	
	
	public BoardFileDTO() {
		super();
	}
	public BoardFileDTO(int bf_seq, String bf_oriName, String bf_sysName, Timestamp bf_upload_date, int b_seq) {
		this.bf_seq = bf_seq;
		this.bf_oriName = bf_oriName;
		this.bf_sysName = bf_sysName;
		this.bf_upload_date = bf_upload_date;
		this.b_seq = b_seq;
	}
	
	
	public int getBf_seq() {
		return bf_seq;
	}
	public void setBf_seq(int bf_seq) {
		this.bf_seq = bf_seq;
	}
	public String getBf_oriName() {
		return bf_oriName;
	}
	public void setBf_oriName(String bf_oriName) {
		this.bf_oriName = bf_oriName;
	}
	public String getBf_sysName() {
		return bf_sysName;
	}
	public void setBf_sysName(String bf_sysName) {
		this.bf_sysName = bf_sysName;
	}
	public Timestamp getBf_upload_date() {
		return bf_upload_date;
	}
	public void setBf_upload_date(Timestamp bf_upload_date) {
		this.bf_upload_date = bf_upload_date;
	}
	public int getB_seq() {
		return b_seq;
	}
	public void setB_seq(int b_seq) {
		this.b_seq = b_seq;
	}

}
