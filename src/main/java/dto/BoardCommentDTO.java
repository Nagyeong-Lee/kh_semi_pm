package dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class BoardCommentDTO {

	private int bcm_seq;
	private String bcm_writer_id;
	private String bcm_writer_nn;
	private Timestamp bcm_write_date;
	private String bcm_content;
	private int b_seq;
	private String b_title;
	
	
	public BoardCommentDTO() {
		super();
	}
	public BoardCommentDTO(int bcm_seq, String bcm_writer_id, String bcm_writer_nn, Timestamp bcm_write_date,
			String bcm_content, int b_seq, String b_title) {
		this.bcm_seq = bcm_seq;
		this.bcm_writer_id = bcm_writer_id;
		this.bcm_writer_nn = bcm_writer_nn;
		this.bcm_write_date = bcm_write_date;
		this.bcm_content = bcm_content;
		this.b_seq = b_seq;
		this.b_title = b_title;
	}
	
	
	public int getBcm_seq() {
		return bcm_seq;
	}
	public void setBcm_seq(int bcm_seq) {
		this.bcm_seq = bcm_seq;
	}
	public String getBcm_writer_id() {
		return bcm_writer_id;
	}
	public void setBcm_writer_id(String bcm_writer_id) {
		this.bcm_writer_id = bcm_writer_id;
	}
	public String getBcm_writer_nn() {
		return bcm_writer_nn;
	}
	public void setBcm_writer_nn(String bcm_writer_nn) {
		this.bcm_writer_nn = bcm_writer_nn;
	}
	public String getBcm_write_date() {
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd");
		String sdf1_b_write_date = sdf1.format(this.bcm_write_date);
		String sdf1_currentTime = sdf1.format(System.currentTimeMillis());
		if(sdf1_b_write_date.equals(sdf1_currentTime)) {
			SimpleDateFormat sdf2 = new SimpleDateFormat("HH시 mm분");
			return sdf2.format(this.bcm_write_date);
		}else {
			SimpleDateFormat sdf3 = new SimpleDateFormat("MM월 dd일");
			return sdf3.format(this.bcm_write_date);
		}		
	}
	public void setBcm_write_date(Timestamp bcm_write_date) {
		this.bcm_write_date = bcm_write_date;
	}
	public String getBcm_content() {
		return bcm_content;
	}
	public void setBcm_content(String bcm_content) {
		this.bcm_content = bcm_content;
	}
	public int getB_seq() {
		return b_seq;
	}
	public void setB_seq(int b_seq) {
		this.b_seq = b_seq;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

}
