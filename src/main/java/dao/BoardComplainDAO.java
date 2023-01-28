package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.BoardComplainDTO;
import dto.BoardDTO;

public class BoardComplainDAO {
	private static BoardComplainDAO instance;
	synchronized public static BoardComplainDAO getInstance() {
		if(instance == null) {
			instance = new BoardComplainDAO();
		}
		return instance;
	}

	private BoardComplainDAO() {}
	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	// 게시글 신고 테이블에 입력(C)
	public int insertBoardComplain(BoardComplainDTO dto) throws Exception{
		String sql = "insert into board_complain values(board_complain_seq.nextval, ?, DEFAULT, ?, ?, ?, ?, ?)";
		try(Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){

			pstat.setString(1, dto.getBcp_complainer());
			pstat.setInt(2, dto.getB_seq());
			pstat.setString(3, dto.getB_writer_id());
			pstat.setString(4, dto.getB_writer_nn());
			pstat.setString(5, dto.getB_title());
			pstat.setString(6, dto.getB_content());

			int result = pstat.executeUpdate();
			con.commit();
			return result;

		}
	}
	// 게시글 신고 테이블 출력(R)
	public List<BoardComplainDTO> selectBoardComplain() throws Exception{
		String sql = "select * from board_complain order by BCP_DATE desc";

		try(Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();){
			List<BoardComplainDTO> list = new ArrayList<>();
			while(rs.next()) {
				BoardComplainDTO dto = new BoardComplainDTO();
				dto.setBcp_seq(rs.getInt("bcp_seq"));
				dto.setBcp_complainer(rs.getString("bcp_complainer"));
				dto.setBcp_date(rs.getTimestamp("bcp_date"));
				dto.setB_seq(rs.getInt("b_seq"));
				dto.setB_writer_id(rs.getString("b_writer_id"));
				dto.setB_writer_nn(rs.getString("b_writer_nn"));
				dto.setB_title(rs.getString("b_title"));
				dto.setB_content(rs.getString("b_content"));

				list.add(dto);

			}
			return list;
		}
	}

	// 관리자페이지_게시글신고테이블 삭제
	public int complainTableDelete(int bcp_seq) throws Exception{
		String sql = "delete from board_complain where bcp_seq = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, bcp_seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	// 관리자페이지_게시글 삭제
	public int delete(int b_seq) throws Exception{
		String sql = "delete from BOARD where b_seq = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, b_seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

}

//게시글 신고 테이블 행 삭제, 동일 행 삭제, 게시글 삭제(D)
//	public int deleteBoardComplain(int bcp_seq) throws Exception{
////		String sql = "delete * from board_complain where " 조인을..
//	}
