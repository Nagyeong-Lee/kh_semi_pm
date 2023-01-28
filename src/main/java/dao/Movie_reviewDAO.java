package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.Movie_reviewDTO;

public class Movie_reviewDAO {
	
	private static Movie_reviewDAO instance;

	public synchronized  static Movie_reviewDAO getInstance() throws Exception {
		if(instance==null) {
			instance=new Movie_reviewDAO();
		}return instance;
	}

	private Connection getConnection() throws Exception{
		Context ctx= new InitialContext();
		DataSource ds=(DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();

	}
	
	public int insertMovieReview(String mvr_writer, String mvr_content, int mv_id) throws Exception {
		
		String sql="insert into movie_review values(movie_review_seq, ?, ?,default,sysdate, ?)";
		
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);)
		{pstat.setString(1, mvr_writer);
		pstat.setString(2, mvr_content);
		pstat.setInt(3, mv_id);
		
		int result=pstat.executeUpdate();
		con.commit();
		return result;
		
		}
	}
	
	public List <Movie_reviewDTO> selectMv_ReviewByMvSeq (int mv_id) throws Exception{

	      String sql="select * from movie_review where mv_id=?";

	      try(Connection con = this.getConnection();
	            PreparedStatement pstat = con.prepareStatement(sql);){
	         pstat.setInt(1, mv_id);

	         try(ResultSet rs = pstat.executeQuery();){
	            List<Movie_reviewDTO>  list =new ArrayList<>();

	            while(rs.next()) {
	            	Movie_reviewDTO dto = new Movie_reviewDTO();
	            	dto.setMvr_seq(rs.getInt("mvr_seq"));
	            	dto.setMvr_writer(rs.getString("mvr_writer"));
	            	dto.setMvr_content(rs.getString("mvr_content"));
	            	dto.setMvr_like(rs.getInt(rs.getInt("mvr_like")));
	            	dto.setMvr_writer_date(rs.getTimestamp("mvr_write_date"));
	            	dto.setMv_id(rs.getInt("mv_id"));

	               list.add(dto);
	            }return list;}

	      }

	   }

	   public int deleteMv_review(int mvr_seq) throws Exception {

	      String sql = "delete from movie_review where mvr_seq=?";

	      try(Connection con=this.getConnection();
	            PreparedStatement pstat=con.prepareStatement(sql);){
	         
	         pstat.setInt(1, mvr_seq);

	         int result = pstat.executeUpdate();
	         con.commit();

	         return result;

	      }

	   }

	   public int updateMv_review( String mvr_content,  int mv_id, String mvr_writer) throws Exception{

	      String sql="update movie_review set mvr_contents=? where mv_id=? and mvr_writer=?";

	      try(Connection con=this.getConnection();
	            PreparedStatement pstat=con.prepareStatement(sql);){

	         pstat.setString(1,mvr_content);
	         pstat.setInt(2, mv_id);
	         pstat.setString(3,mvr_writer);

	         int result=pstat.executeUpdate();
	         con.commit();
	         return result;
	      }
	   }

}
