package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.BoardFileDTO;


public class BoardFileDAO {

	private static BoardFileDAO instance=null;
	synchronized public static BoardFileDAO getInstance() {
		if(instance==null) {
			instance=new BoardFileDAO();
		}
		return instance;
	} 
	private BoardFileDAO() {}

	private Connection getConnection() throws Exception {
		Context cx = new InitialContext();
		DataSource ds = (DataSource) cx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}


	// 게시판파일 저장 (C)
	public int insertBoardFile(BoardFileDTO dto) throws Exception {

		String sql="insert into board_file values(board_file_seq.nextval, ?, ?, sysdate, ?)";

		try(Connection con = getConnection();
				PreparedStatement pstat= con.prepareStatement(sql);){

			pstat.setString(1, dto.getBf_oriName());
			pstat.setString(2, dto.getBf_sysName());
			pstat.setInt(3,dto.getB_seq());
			int result=pstat.executeUpdate();

			con.commit();
			return result;
		}
	}


	// 게시판파일 출력 (R)
	public List<BoardFileDTO> selectBoardFile(int b_seq) throws Exception{

		String sql="select * from board_file where b_seq=?";

		try(Connection con = getConnection();
				PreparedStatement pstat= con.prepareStatement(sql);){

			pstat.setInt(1, b_seq);

			try(ResultSet rs = pstat.executeQuery();){

				List<BoardFileDTO>list=new ArrayList<>();

				while(rs.next()) {
					BoardFileDTO dto = new BoardFileDTO();
					dto.setBf_seq(rs.getInt("bf_seq"));
					dto.setBf_oriName(rs.getString("bf_oriName"));
					dto.setBf_sysName(rs.getString("bf_sysName"));
					dto.setBf_upload_date(rs.getTimestamp("bf_upload_date"));
					dto.setB_seq(rs.getInt("b_seq"));

					list.add(dto);
				}
				return list;
			}
		}
	}	
}