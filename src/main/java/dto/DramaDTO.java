package dto;

public class DramaDTO {
	
	private int dr_id;
	private String dr_title;
	private String dr_genre;
	private String dr_first_air_date ;
	private String dr_vote_average ;
	private char dr_ottNF;
	private char dr_ottWV;
	private char dr_ottDZ;
	private char dr_ottWC;
	private int dr_like;
	private String dr_poster_path;
	private String dr_overview;
	
	
	public DramaDTO() {
		super();
	}

	
	public DramaDTO(int dr_id, String dr_title, String dr_genre, String dr_first_air_date, String dr_vote_average,
			char dr_ottNF, char dr_ottWV, char dr_ottDZ, char dr_ottWC, int dr_like, String dr_poster_path,
			String dr_overview) {
		super();
		this.dr_id = dr_id;
		this.dr_title = dr_title;
		this.dr_genre = dr_genre;
		this.dr_first_air_date = dr_first_air_date;
		this.dr_vote_average = dr_vote_average;
		this.dr_ottNF = dr_ottNF;
		this.dr_ottWV = dr_ottWV;
		this.dr_ottDZ = dr_ottDZ;
		this.dr_ottWC = dr_ottWC;
		this.dr_like = dr_like;
		this.dr_poster_path = dr_poster_path;
		this.dr_overview = dr_overview;
	}




	public DramaDTO(int dr_id, String dr_title,String dr_poster_path) {
		
		this.dr_id = dr_id;
		this.dr_title = dr_title;
		this.dr_poster_path = dr_poster_path;
		
	}
	
	public DramaDTO(char dr_ottNF, char dr_ottWV,char dr_ottDZ,char dr_ottWC) {
		
		this.dr_ottNF = dr_ottNF;
		this.dr_ottWV = dr_ottWV;
		this.dr_ottDZ = dr_ottDZ;
		this.dr_ottWC = dr_ottWC;
		
	}
	

	public int getDr_id() {
		return dr_id;
		}


	public void setDr_id(int dr_id) {
		this.dr_id = dr_id;
	}


	public String getDr_title() {
		return dr_title;
	}


	public void setDr_title(String dr_title) {
		this.dr_title = dr_title;
	}


	public String getDr_genre() {
		return dr_genre;
	}


	public void setDr_genre(String dr_genre) {
		this.dr_genre = dr_genre;
	}


	public String getDr_first_air_date() {
		return dr_first_air_date;
	}


	public void setDr_first_air_date(String dr_first_air_date) {
		this.dr_first_air_date = dr_first_air_date;
	}


	public String getDr_vote_average() {
		return dr_vote_average;
	}


	public void setDr_vote_average(String dr_vote_average) {
		this.dr_vote_average = dr_vote_average;
	}


	public char getDr_ottNF() {
		return dr_ottNF;
	}


	public void setDr_ottNF(char dr_ottNF) {
		this.dr_ottNF = dr_ottNF;
	}


	public char getDr_ottWV() {
		return dr_ottWV;
	}


	public void setDr_ottWV(char dr_ottWV) {
		this.dr_ottWV = dr_ottWV;
	}


	public char getDr_ottDZ() {
		return dr_ottDZ;
	}


	public void setDr_ottDZ(char dr_ottDZ) {
		this.dr_ottDZ = dr_ottDZ;
	}


	public char getDr_ottWC() {
		return dr_ottWC;
	}


	public void setDr_ottWC(char dr_ottWC) {
		this.dr_ottWC = dr_ottWC;
	}


	public int getDr_like() {
		return dr_like;
	}


	public void setDr_like(int dr_like) {
		this.dr_like = dr_like;
	}


	public String getDr_poster_path() {
		return dr_poster_path;
	}


	public void setDr_poster_path(String dr_poster_path) {
		this.dr_poster_path = dr_poster_path;
	}


	public String getDr_overview() {
		return dr_overview;
	}


	public void setDr_overview(String dr_overview) {
		this.dr_overview = dr_overview;
	}
	
//	public String from_Ott(char dr_ottNF, char dr_ottWV,char dr_ottDZ,char dr_ottWC) {
//		
//		DramaDTO ott=new DramaDTO();		
//		
//		String result;
//		
//				if(dr_ottNF.euqalus "Y") {
//					result="/img/netbf.png";
//				}else if(dr_ottDZ == 'Y') {
//					result="/img/disbf.png";
//				}else if(dr_ottDZ ==Y) {
//					result="/img/disbf.png";
//				}else if(dr_ottWV) {
//					result="/img/wavbf.png";
//				}else if(dr_ottWC) {
//					result="/img/watbf.png";
//				}
//		
//		return result;
//			}
	

	
}
