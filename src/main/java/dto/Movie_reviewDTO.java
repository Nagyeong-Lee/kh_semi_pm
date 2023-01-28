package dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class Movie_reviewDTO {
	
	private int mvr_seq;
	private String mvr_writer;
	private String mvr_content;
	private int mvr_like;
	private Timestamp mvr_writer_date;
	private int mv_id;
	
	
	public Movie_reviewDTO() {
		super();
	}

	public Movie_reviewDTO(int mvr_seq, String mvr_writer, String mvr_content, int mvr_like, Timestamp mvr_writer_date,
			int mv_id) {
		this.mvr_seq = mvr_seq;
		this.mvr_writer = mvr_writer;
		this.mvr_content = mvr_content;
		this.mvr_like = mvr_like;
		this.mvr_writer_date = mvr_writer_date;
		this.mv_id = mv_id;
	}

	
	public int getMvr_seq() {
		return mvr_seq;
	}

	public void setMvr_seq(int mvr_seq) {
		this.mvr_seq = mvr_seq;
	}

	public String getMvr_writer() {
		return mvr_writer;
	}

	public void setMvr_writer(String mvr_writer) {
		this.mvr_writer = mvr_writer;
	}

	public String getMvr_content() {
		return mvr_content;
	}

	public void setMvr_content(String mvr_content) {
		this.mvr_content = mvr_content;
	}

	public int getMvr_like() {
		return mvr_like;
	}

	public void setMvr_like(int mvr_like) {
		this.mvr_like = mvr_like;
	}

	public Timestamp getMvr_writer_date() {
		return mvr_writer_date;
	}

	public void setMvr_writer_date(Timestamp mvr_writer_date) {
		this.mvr_writer_date = mvr_writer_date;
	}

	public int getMv_id() {
		return mv_id;
	}

	public void setMv_id(int mv_id) {
		this.mv_id = mv_id;
	}
	
	public String getMvr_write_date() {
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd");
		String sdf1_mvr_write_date = sdf1.format(this.mvr_writer_date);
		String sdf1_currentTime = sdf1.format(System.currentTimeMillis());
		if(sdf1_mvr_write_date.equals(sdf1_currentTime)) {
			SimpleDateFormat sdf2 = new SimpleDateFormat("HH시 mm분");
			return sdf2.format(this.mvr_writer_date);
		}else {
			SimpleDateFormat sdf3 = new SimpleDateFormat("MM월 dd일");
			return sdf3.format(this.mvr_writer_date);
		}		
	}
	
	
	

}
