package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.Drama_reviewDTO;
import dto.Movie_reviewDTO;

public class Drama_reviewDAO {
	
	private static Drama_reviewDAO instance;

	public synchronized  static Drama_reviewDAO getInstance() throws Exception {
		if(instance==null) {
			instance=new Drama_reviewDAO();
		}return instance;
	}

	private Connection getConnection() throws Exception{
		Context ctx= new InitialContext();
		DataSource ds=(DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();

	}
	
public int insertDramaReview(String drr_writer, String drr_content, int dr_id) throws Exception {
		
		String sql="insert into drama_review values(movie_review_seq, ?, ?,default,sysdate, ?)";
		
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);)
		{pstat.setString(1, drr_writer);
		pstat.setString(2, drr_content);
		pstat.setInt(3, dr_id);
		
		int result=pstat.executeUpdate();
		con.commit();
		return result;
		
		}
	}
	
	
	
	public List<Drama_reviewDTO> selectDr_ReviewByDrSeq (int dr_id) throws Exception{

	      String sql="select * from drama_review where dr_id=?";

	      try(Connection con = this.getConnection();
	            PreparedStatement pstat = con.prepareStatement(sql);){
	         pstat.setInt(1, dr_id);

	         try(ResultSet rs = pstat.executeQuery();){
	            List<Drama_reviewDTO>  list =new ArrayList<>();

	            while(rs.next()) {
	            	Drama_reviewDTO dto = new Drama_reviewDTO();
	            	dto.setDrr_seq(rs.getInt("drr_seq"));
	            	dto.setDrr_writer(rs.getString("drr_writer"));
	            	dto.setDrr_content(rs.getString("drr_content"));
	            	dto.setDrr_like(rs.getInt(rs.getInt("drr_like")));
	            	dto.setDrr_writer_date(rs.getTimestamp("drr_write_date"));
	            	dto.setDr_id(rs.getInt("dr_id"));

	               list.add(dto);
	            }return list;}

	      }

	   }

	   public int deleteDr_review(int drr_seq) throws Exception {

	      String sql = "delete from drama_review where drr_seq=?";

	      try(Connection con=this.getConnection();
	            PreparedStatement pstat=con.prepareStatement(sql);){
	         
	         pstat.setInt(1, drr_seq);

	         int result = pstat.executeUpdate();
	         con.commit();

	         return result;

	      }

	   }

	   public int updateDr_review( String drr_content, int dr_id, String drr_writer) throws Exception{

	      String sql="update drama_review set drr_contents=? where dr_seq=? and drr_writer=?";

	      try(Connection con=this.getConnection();
	            PreparedStatement pstat=con.prepareStatement(sql);){

	         pstat.setString(1,drr_content);
	         pstat.setInt(2, dr_id);
	         pstat.setString(3,drr_writer);

	         int result=pstat.executeUpdate();
	         con.commit();
	         return result;
	      }
	   }


}
