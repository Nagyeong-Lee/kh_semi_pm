package dto;

public class MovieDTO {
	
	private int mv_id;
	private String mv_title;
	private String mv_genre;
	private String mv_release_date;
	private String mv_vote_average;
	private String mv_runtime;
	private char mv_ottNF;
	private char mv_ottWV;
	private char mv_ottDZ;
	private char mv_ottWC;	
	private int mv_like;
	private String mv_poster_path;
	private String mv_overview;
	

	public MovieDTO() {
		super();
	}
	

	public MovieDTO(int mv_id, String mv_title, String mv_genre, String mv_release_date, String mv_vote_average,
			String mv_runtime, char mv_ottNF, char mv_ottWV, char mv_ottDZ, char mv_ottWC, int mv_like,
			String mv_poster_path, String mv_overview) {
		super();
		this.mv_id = mv_id;
		this.mv_title = mv_title;
		this.mv_genre = mv_genre;
		this.mv_release_date = mv_release_date;
		this.mv_vote_average = mv_vote_average;
		this.mv_runtime = mv_runtime;
		this.mv_ottNF = mv_ottNF;
		this.mv_ottWV = mv_ottWV;
		this.mv_ottDZ = mv_ottDZ;
		this.mv_ottWC = mv_ottWC;
		this.mv_like = mv_like;
		this.mv_poster_path = mv_poster_path;
		this.mv_overview = mv_overview;
	}

	public MovieDTO(int mv_id, String mv_title,String mv_poster_path) {
		
		this.mv_id = mv_id;
		this.mv_title = mv_title;
		this.mv_poster_path = mv_poster_path;
		
	}


	public int getMv_id() {
		return mv_id;
	}


	public void setMv_id(int mv_id) {
		this.mv_id = mv_id;
	}


	public String getMv_title() {
		return mv_title;
	}


	public void setMv_title(String mv_title) {
		this.mv_title = mv_title;
	}


	public String getMv_genre() {
		return mv_genre;
	}


	public void setMv_genre(String mv_genre) {
		this.mv_genre = mv_genre;
	}


	public String getMv_release_date() {
		return mv_release_date;
	}


	public void setMv_release_date(String mv_release_date) {
		this.mv_release_date = mv_release_date;
	}


	public String getMv_vote_average() {
		return mv_vote_average;
	}


	public void setMv_vote_average(String mv_vote_average) {
		this.mv_vote_average = mv_vote_average;
	}


	public String getMv_runtime() {
		return mv_runtime;
	}


	public void setMv_runtime(String mv_runtime) {
		this.mv_runtime = mv_runtime;
	}


	public char getMv_ottNF() {
		return mv_ottNF;
	}


	public void setMv_ottNF(char mv_ottNF) {
		this.mv_ottNF = mv_ottNF;
	}


	public char getMv_ottWV() {
		return mv_ottWV;
	}


	public void setMv_ottWV(char mv_ottWV) {
		this.mv_ottWV = mv_ottWV;
	}


	public char getMv_ottDZ() {
		return mv_ottDZ;
	}


	public void setMv_ottDZ(char mv_ottDZ) {
		this.mv_ottDZ = mv_ottDZ;
	}


	public char getMv_ottWC() {
		return mv_ottWC;
	}


	public void setMv_ottWC(char mv_ottWC) {
		this.mv_ottWC = mv_ottWC;
	}


	public int getMv_like() {
		return mv_like;
	}


	public void setMv_like(int mv_like) {
		this.mv_like = mv_like;
	}


	public String getMv_poster_path() {
		return mv_poster_path;
	}


	public void setMv_poster_path(String mv_poster_path) {
		this.mv_poster_path = mv_poster_path;
	}


	public String getMv_overview() {
		return mv_overview;
	}


	public void setMv_overview(String mv_overview) {
		this.mv_overview = mv_overview;
	}
	
	
}
