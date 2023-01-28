package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.BoardDTO;

public class BoardDAO {
   private static BoardDAO instance;
   synchronized public static BoardDAO getInstance() {
      if(instance == null) {
         instance = new BoardDAO();
      }
      return instance;
   }

   private BoardDAO() {}
   private Connection getConnection() throws Exception{
      Context ctx = new InitialContext();
      DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
      return ds.getConnection();
   }

   //editor
   //   public String removeHTML(String str) throws Exception {
   //      String editedText=str.replace("/<br\/>/ig", "\n");
   //   }

   // 게시글 작성 (C)
   public int insertBoardContents(BoardDTO dto) throws Exception{

		String sql = "insert into board values(?, ?, ?, ?, sysdate, ?, ?, 0)";
		//							파일 기능 추가시 ?
		try(Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){

			pstat.setInt(1, dto.getB_seq());
			pstat.setString(2, dto.getB_category());
			pstat.setString(3, dto.getB_writer_id());
			pstat.setString(4, dto.getB_writer_nn());
			pstat.setString(5, dto.getB_title());
			pstat.setString(6, dto.getB_content());

         int result = pstat.executeUpdate();

         con.commit();
         return result;
      }
   }


   // 게시글 번호 미리 받아두기
   public int getBoardNextVal() throws Exception{

      String sql = "select board_seq.nextval from dual";

      try(Connection con = this.getConnection();
            PreparedStatement pstat = con.prepareStatement(sql);
            ResultSet rs = pstat.executeQuery();){

         rs.next();
         return rs.getInt(1);
      }
   }


   // 게시글 출력 (R)
   public BoardDTO selectBoardContents(int b_seq) throws Exception {

      String sql = "select * from board where b_seq = ?";

      try(Connection con = this.getConnection();
            PreparedStatement pstat = con.prepareStatement(sql);){

         pstat.setInt(1, b_seq);

         try(ResultSet rs = pstat.executeQuery();){
				rs.next();
				BoardDTO dto = new BoardDTO();
				dto.setB_seq(rs.getInt("b_seq"));
				dto.setB_category(rs.getString("b_category"));
				dto.setB_writer_id(rs.getString("b_writer_id"));
				dto.setB_writer_nn(rs.getString("b_writer_nn"));
				dto.setB_write_date(rs.getTimestamp("b_write_date"));
				dto.setB_title(rs.getString("b_title"));
				dto.setB_content(rs.getString("b_content"));
				dto.setB_view_count(rs.getInt("b_view_count"));
				return dto;
			}
		}
	}


   // 게시글 수정 (U)
   public int updateBoardContents(String b_category, String b_title, String b_content, int b_seq) throws Exception{

      String sql = "update board set b_write_date=sysdate, b_category=?, b_title=?, b_content=? where b_seq=?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){

			pstat.setString(1, b_category);
			pstat.setString(2, b_title);
			pstat.setString(3, b_content);
			pstat.setInt(4, b_seq);

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}


	// 게시글 삭제 (D)
	public int deleteBoardContents(int b_seq) throws Exception{

		String sql = "delete from board where b_seq = ?";

		try(Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){

			pstat.setInt(1, b_seq);
			int result = pstat.executeUpdate();

			con.commit();
			return result;
		}
	}


	// 게시글 조회수 출력
	public int addBoardViewCount(int b_seq) throws Exception{

		String sql = "update board set b_view_count=b_view_count+1 where b_seq = ?";

		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){


			pstat.setInt(1, b_seq);

			int result = pstat.executeUpdate();

			con.commit();
			return result;
		}
	}



	// 게시판 리스트 출력 (R)
	public List<BoardDTO> selectBoardByRange(int start, int end) throws Exception{

		String sql = "select * from (select board.*, row_number() over(order by b_seq desc) rn from board) where rn between ? and ?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){

			pstat.setInt(1, start);
			pstat.setInt(2, end);

			try(ResultSet rs = pstat.executeQuery();){

				List<BoardDTO> list = new ArrayList<>();
				while(rs.next()) {
					BoardDTO dto = new BoardDTO();
					dto.setB_seq(rs.getInt("B_seq"));
					dto.setB_category(rs.getString("b_category"));
					dto.setB_writer_id(rs.getString("b_writer_id"));
					dto.setB_writer_nn(rs.getString("b_writer_nn"));
					dto.setB_write_date(rs.getTimestamp("b_write_date"));
					dto.setB_title(rs.getString("b_title"));
					dto.setB_content(rs.getString("b_content"));
					dto.setB_view_count(rs.getInt("b_view_count"));
					list.add(dto);
				}
				return list;
			}
		}
	}
	

	// 게시글 리스트 페이징
	public int getRecordCount() throws Exception {
		String sql = "select count(*) from board";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();){
			rs.next();
			return rs.getInt(1);
		}
	}


	public String getBoardPageNavi(int currentPage) throws Exception {
		//		List<String>list=new ArrayList<>();
		int recordTotalCount = this.getRecordCount(); 

		int recordCountPerPage = 20; 
		int naviCountPerPage = 10; 

		int pageTotalCount = 0;
		if(recordTotalCount % recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1; 
		}else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int startNavi = (currentPage-1) / naviCountPerPage * naviCountPerPage + 1;
		int endNavi = startNavi + naviCountPerPage - 1;

		//		int endNavi=0;
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		//		else {
		//			endNavi=startNavi + naviCountPerPage - 1;
		//		}

		boolean needPrev = true;
		boolean needNext = true;

		if(startNavi == 1) {needPrev = false;}
		if(endNavi == pageTotalCount) {needNext = false;}

		StringBuilder sb = new StringBuilder();

		if(needPrev) {
			sb.append("<a href='/boardList.board?cpage="+(startNavi-1)+"'><</a> ");
		}

		for(int i = startNavi; i <= endNavi; i++) {
			if(currentPage == i){
				sb.append("<a href='/boardList.board?cpage="+i+"'><b>" + i + "</b></a> ");

			}else {
				sb.append("<a href='/boardList.board?cpage="+i+"'>" + i + "</a> ");

			}
		}

		if(needNext) {
			sb.append("<a href='/boardList.board?cpage="+(endNavi+1)+"'>></a> ");
		}
		//		String navi=sb.toString();
		//		list.add(String.valueOf(endNavi));
		//		list.add(navi);
		//		return list;
		return sb.toString();
	}


	
	
		//게시판 검색 리스트 출력 (R) 
		public List<BoardDTO> selectBoardSearchList(String boardSearchOption,String boardSearchWord, int start, int end) throws Exception{
			List<BoardDTO>list = new ArrayList<>();

			if(boardSearchOption.equals("b_title")) {
				String sql="select * from (select board.*, row_number() over(order by b_seq desc) rn from board where b_title like ?) where rn between ? and ?";
				try(Connection con = getConnection();
						PreparedStatement pstat= con.prepareStatement(sql);){

					pstat.setString(1,"%"+boardSearchWord+"%");
					pstat.setInt(2, start);
					pstat.setInt(3, end);

					try(ResultSet rs = pstat.executeQuery();){


						while(rs.next()) {
							BoardDTO dto = new BoardDTO();
							dto.setB_seq(rs.getInt("b_seq"));
							dto.setB_category(rs.getString("b_category"));
							dto.setB_writer_id(rs.getString("b_writer_id"));
							dto.setB_writer_nn(rs.getString("b_writer_nn"));
							dto.setB_write_date(rs.getTimestamp("b_write_date"));
							dto.setB_title(rs.getString("b_title"));
							dto.setB_content(rs.getString("b_content"));
							dto.setB_view_count(rs.getInt("b_view_count"));
							list.add(dto);
						}
					}
				}
			}else if(boardSearchOption.equals("b_writer_nn")) {
				String sql="select * from (select board.*, row_number() over(order by b_seq desc) rn from board where b_writer_nn like ?) where rn between ? and ?";
				try(Connection con = getConnection();
						PreparedStatement pstat= con.prepareStatement(sql);){

					pstat.setString(1,"%"+boardSearchWord+"%");
					pstat.setInt(2, start);
					pstat.setInt(3, end);

					try(ResultSet rs = pstat.executeQuery();){


						while(rs.next()) {
							BoardDTO dto = new BoardDTO();
							dto.setB_seq(rs.getInt("b_seq"));
							dto.setB_category(rs.getString("b_category"));
							dto.setB_writer_id(rs.getString("b_writer_id"));
							dto.setB_writer_nn(rs.getString("b_writer_nn"));
							dto.setB_write_date(rs.getTimestamp("b_write_date"));
							dto.setB_title(rs.getString("b_title"));
							dto.setB_content(rs.getString("b_content"));
							dto.setB_view_count(rs.getInt("b_view_count"));
							list.add(dto);
						}
					}
				}
			}else if(boardSearchOption.equals("b_content")) {
				String sql="select * from (select board.*, row_number() over(order by b_seq desc) rn from board where b_content like ?) where rn between ? and ?";
				try(Connection con = getConnection();
						PreparedStatement pstat= con.prepareStatement(sql);){

					pstat.setString(1,"%"+boardSearchWord+"%");
					pstat.setInt(2, start);
					pstat.setInt(3, end);

					try(ResultSet rs = pstat.executeQuery();){


						while(rs.next()) {
							BoardDTO dto = new BoardDTO();
							dto.setB_seq(rs.getInt("b_seq"));
							dto.setB_category(rs.getString("b_category"));
							dto.setB_writer_id(rs.getString("b_writer_id"));
							dto.setB_writer_nn(rs.getString("b_writer_nn"));
							dto.setB_write_date(rs.getTimestamp("b_write_date"));
							dto.setB_title(rs.getString("b_title"));
							dto.setB_content(rs.getString("b_content"));
							dto.setB_view_count(rs.getInt("b_view_count"));
							list.add(dto);
						}
					}
				}


			}
			return list;

		}

		
	//검색페이징
	public int getSearchRecordCount(String boardSearchOption, String boardSearchWord) throws Exception {
		int count=0;
		if(boardSearchOption.equals("b_title")) {

			String sql = "select count(*) from board where b_title like ?";

			try(Connection con = this.getConnection();
					PreparedStatement pstat = con.prepareStatement(sql);){

				pstat.setString(1,"%"+boardSearchWord+"%");


				try(ResultSet rs = pstat.executeQuery();){
					rs.next();
					count=rs.getInt(1);
					
				}
			}
		}else if(boardSearchOption.equals("b_writer_nn")) {
			String sql = "select count(*) from board where b_writer_nn like ?";

			try(Connection con = this.getConnection();
					PreparedStatement pstat = con.prepareStatement(sql);){

				pstat.setString(1,"%"+boardSearchWord+"%");


				try(ResultSet rs = pstat.executeQuery();){
					rs.next();
					count=rs.getInt(1);
				}
			}
		}else if(boardSearchOption.equals("b_content")) {
			String sql = "select count(*) from board where b_content like ?";

			try(Connection con = this.getConnection();
					PreparedStatement pstat = con.prepareStatement(sql);){

				pstat.setString(1,"%"+boardSearchWord+"%");


				try(ResultSet rs = pstat.executeQuery();){
					rs.next();
					count=rs.getInt(1);
				}
			}

		}
		return count;
	}
	

	public String getBoardSearchPageNavi(String boardSearchOption, String boardSearchWord, int currentPage) throws Exception {
		//		List<String>list=new ArrayList<>();
		int recordTotalCount = this.getSearchRecordCount(boardSearchOption, boardSearchWord); 

		int recordCountPerPage = 20; 
		int naviCountPerPage = 10; 

		int pageTotalCount = 0;
		if(recordTotalCount % recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1; 
		}else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int startNavi = (currentPage-1) / naviCountPerPage * naviCountPerPage + 1;
		int endNavi = startNavi + naviCountPerPage - 1;

		//		int endNavi=0;
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		//		else {
		//			endNavi=startNavi + naviCountPerPage - 1;
		//		}

		boolean needPrev = true;
		boolean needNext = true;

		if(startNavi == 1) {needPrev = false;}
		if(endNavi == pageTotalCount) {needNext = false;}

		StringBuilder sb = new StringBuilder();

		if(needPrev) {
			sb.append("<a href='/boardSearchList.board?cpage="+(startNavi-1)+"&boardSearchOption="+boardSearchOption+"&boardSearchWord="+boardSearchWord+"'><</a> ");
		}

		for(int i = startNavi; i <= endNavi; i++) {
			if(currentPage==i) {
				sb.append("<a href='/boardSearchList.board?cpage="+i+"&boardSearchOption="+boardSearchOption+"&boardSearchWord="+boardSearchWord+"'><b>" + i + "</b></a> ");

			}else {
				sb.append("<a href='/boardSearchList.board?cpage="+i+"&boardSearchOption="+boardSearchOption+"&boardSearchWord="+boardSearchWord+"'>" + i + "</a> ");

			}
		}

		if(needNext) {
			sb.append("<a href='/boardSearchList.board?cpage="+(endNavi+1)+"&boardSearchOption="+boardSearchOption+"&boardSearchWord="+boardSearchWord+"'>></a> ");
		}
		//		String navi=sb.toString();
		//		list.add(String.valueOf(endNavi));
		//		list.add(navi);
		//		return list;
		return sb.toString();
	}



	


	//마이페이지 작성글 출력
	public List <BoardDTO> searchByID(String id) throws Exception{
		String sql="select * from board where b_writer_id=? order by b_write_date desc";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);     
				){
			pstat.setString(1, id);
			try(ResultSet rs = pstat.executeQuery();){
				List<BoardDTO> list=new ArrayList<>();
				while(rs.next()) {
					BoardDTO dto=new BoardDTO();
					dto.setB_seq(rs.getInt("b_seq"));
					dto.setB_category(rs.getString("b_category"));
					dto.setB_writer_id(rs.getString("b_writer_id"));
					dto.setB_writer_nn(rs.getString("b_writer_nn"));
					dto.setB_write_date(rs.getTimestamp("b_write_date"));
					dto.setB_title(rs.getString("b_title"));
					dto.setB_content(rs.getString("b_content"));
					dto.setB_view_count(rs.getInt("b_view_count"));
					list.add(dto);    
				}
				return list;
			}
		}
	}


}

