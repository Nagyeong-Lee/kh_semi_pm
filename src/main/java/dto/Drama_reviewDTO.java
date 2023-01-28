package dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class Drama_reviewDTO {
	
	private int drr_seq;
	private String drr_writer;
	private String drr_content;
	private int drr_like;
	private Timestamp drr_writer_date;
	private int dr_id;
	
	
	public Drama_reviewDTO() {
		super();
	}

	public Drama_reviewDTO(int drr_seq, String drr_writer, String drr_content, int drr_like, Timestamp drr_writer_date,
			int dr_id) {
		this.drr_seq = drr_seq;
		this.drr_writer = drr_writer;
		this.drr_content = drr_content;
		this.drr_like = drr_like;
		this.drr_writer_date = drr_writer_date;
		this.dr_id = dr_id;
	}

	
	public int getDrr_seq() {
		return drr_seq;
	}

	public void setDrr_seq(int drr_seq) {
		this.drr_seq = drr_seq;
	}

	public String getDrr_writer() {
		return drr_writer;
	}

	public void setDrr_writer(String drr_writer) {
		this.drr_writer = drr_writer;
	}

	public String getDrr_content() {
		return drr_content;
	}

	public void setDrr_content(String drr_content) {
		this.drr_content = drr_content;
	}

	public int getDrr_like() {
		return drr_like;
	}

	public void setDrr_like(int drr_like) {
		this.drr_like = drr_like;
	}

	public Timestamp getDrr_writer_date() {
		return drr_writer_date;
	}

	public void setDrr_writer_date(Timestamp drr_writer_date) {
		this.drr_writer_date = drr_writer_date;
	}

	public int getDr_id() {
		return dr_id;
	}

	public void setDr_id(int dr_id) {
		this.dr_id = dr_id;
	}
	
	public String getDrr_write_date() {
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd");
		String sdf1_drr_writer_date = sdf1.format(this.drr_writer_date);
		String sdf1_currentTime = sdf1.format(System.currentTimeMillis());
		if(sdf1_drr_writer_date.equals(sdf1_currentTime)) {
			SimpleDateFormat sdf2 = new SimpleDateFormat("HH시 mm분");
			return sdf2.format(this.drr_writer_date);
		}else {
			SimpleDateFormat sdf3 = new SimpleDateFormat("MM월 dd일");
			return sdf3.format(this.drr_writer_date);
		}		
	}
	
	
	

}
