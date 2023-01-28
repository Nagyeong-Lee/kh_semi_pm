package dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class BoardComplainDTO {

	private int bcp_seq;
	private String bcp_complainer;
	private Timestamp bcp_date;
	private int b_seq;
	private String b_writer_id;
	private String b_writer_nn;
	private String b_title;
	private String b_content;


	public BoardComplainDTO() {
		super();
	}
	public BoardComplainDTO(int bcp_seq, String bcp_complainer, Timestamp bcp_date, int b_seq, String b_writer_id,
			String b_writer_nn, String b_title, String b_content) {
		this.bcp_seq = bcp_seq;
		this.bcp_complainer = bcp_complainer;
		this.bcp_date = bcp_date;
		this.b_seq = b_seq;
		this.b_writer_id = b_writer_id;
		this.b_writer_nn = b_writer_nn;
		this.b_title = b_title;
		this.b_content = b_content;
	}


	public int getBcp_seq() {
		return bcp_seq;
	}
	public void setBcp_seq(int bcp_seq) {
		this.bcp_seq = bcp_seq;
	}
	public String getBcp_complainer() {
		return bcp_complainer;
	}
	public void setBcp_complainer(String bcp_complainer) {
		this.bcp_complainer = bcp_complainer;
	}
	public Timestamp getBcp_date() {
		return bcp_date;
	}
	public void setBcp_date(Timestamp bcp_date) {
		this.bcp_date = bcp_date;
	}
	public int getB_seq() {
		return b_seq;
	}
	public void setB_seq(int b_seq) {
		this.b_seq = b_seq;
	}
	public String getB_writer_id() {
		return b_writer_id;
	}
	public void setB_writer_id(String b_writer_id) {
		this.b_writer_id = b_writer_id;
	}
	public String getB_writer_nn() {
		return b_writer_nn;
	}
	public void setB_writer_nn(String b_writer_nn) {
		this.b_writer_nn = b_writer_nn;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	// 날짜 변환 메소드
	public String getFormedDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(this.bcp_date);
	}

}
