package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.BoardCommentComplainDTO;

public class BoardCommentComplainDAO {
	private static BoardCommentComplainDAO instance;
	synchronized public static BoardCommentComplainDAO getInstance() {
		if(instance == null) {
			instance = new BoardCommentComplainDAO();
		}
		return instance;
	}

	private BoardCommentComplainDAO() {}
	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}


	// 댓글 신고 테이블에 입력(C)
	public int insertBoardCommentComplain(BoardCommentComplainDTO dto) throws Exception{
		String sql = "insert into board_comment_complain values(board_comment_complain_seq.nextval, ?, DEFAULT, ?, ?, ?, ?)";
		try(Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){

			pstat.setString(1, dto.getBcmcp_complainer());
			pstat.setInt(2, dto.getBcm_seq());
			pstat.setString(3, dto.getBcm_writer_id());
			pstat.setString(4, dto.getBcm_writer_nn());
			pstat.setString(5, dto.getBcm_content());

			int result = pstat.executeUpdate();

			con.commit();
			return result;
		}
	}


	// 댓글 신고 테이블 출력(R)
	public List<BoardCommentComplainDTO> selectBoardCommentComplain() throws Exception{
		String sql = "select * from board_comment_complain";

		try(Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();){
			List<BoardCommentComplainDTO> list = new ArrayList<>();
			while(rs.next()) {
				BoardCommentComplainDTO dto = new BoardCommentComplainDTO();
				dto.setBcmcp_seq(rs.getInt("bcmcp_seq"));
				dto.setBcmcp_complainer(rs.getString("bcmcp_complainer"));
				dto.setBcmcp_date(rs.getTimestamp("bcmcp_date"));
				dto.setBcm_seq(rs.getInt("bcm_seq"));
				dto.setBcm_writer_id(rs.getString("bcm_writer_id"));
				dto.setBcm_writer_nn(rs.getString("bcm_writer_nn"));
				dto.setBcm_content(rs.getString("bcm_content"));

				list.add(dto);
			}
			return list;
		}
	}

	// 관리자페이지_댓글신고테이블 삭제
	public int commenComplainTableDelete(int bcp_seq) throws Exception{
		String sql = "delete from board_comment_complain where bcmcp_seq = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, bcp_seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}


	// 게시글 신고 테이블 행 삭제, 동일 행 삭제, 게시글 삭제(D)
	//	public int deleteBoardCommentComplain(int bcmcp_seq) throws Exception{
	////		String sql = "delete * from board_comment_complain where " 조인을..
	//	}
}
