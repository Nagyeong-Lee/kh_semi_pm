package dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class BoardCommentComplainDTO {
	
	private int bcmcp_seq;
	private String bcmcp_complainer;
	private Timestamp bcmcp_date;
	private int bcm_seq;
	private String bcm_writer_id;
	private String bcm_writer_nn;
	private String bcm_content;
	
	
	public BoardCommentComplainDTO() {
		super();
	}
	public BoardCommentComplainDTO(int bcmcp_seq, String bcmcp_complainer, Timestamp bcmcp_date, int bcm_seq,
			String bcm_writer_id, String bcm_writer_nn, String bcm_content) {
		this.bcmcp_seq = bcmcp_seq;
		this.bcmcp_complainer = bcmcp_complainer;
		this.bcmcp_date = bcmcp_date;
		this.bcm_seq = bcm_seq;
		this.bcm_writer_id = bcm_writer_id;
		this.bcm_writer_nn = bcm_writer_nn;
		this.bcm_content = bcm_content;
	}
	
	
	public int getBcmcp_seq() {
		return bcmcp_seq;
	}
	public void setBcmcp_seq(int bcmcp_seq) {
		this.bcmcp_seq = bcmcp_seq;
	}
	public String getBcmcp_complainer() {
		return bcmcp_complainer;
	}
	public void setBcmcp_complainer(String bcmcp_complainer) {
		this.bcmcp_complainer = bcmcp_complainer;
	}
	public Timestamp getBcmcp_date() {
		return bcmcp_date;
	}
	public void setBcmcp_date(Timestamp bcmcp_date) {
		this.bcmcp_date = bcmcp_date;
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
	public String getBcm_content() {
		return bcm_content;
	}
	public void setBcm_content(String bcm_content) {
		this.bcm_content = bcm_content;
	}
	
	// 날짜 변환 메소드
		public String getFormedDate() {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			return sdf.format(this.bcmcp_date);
		}
}
