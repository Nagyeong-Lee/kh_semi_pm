package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BoardCommentDAO;
import dao.BoardDAO;
import dao.DramaDAO;
import dto.BoardCommentDTO;
import dto.BoardDTO;
import dto.DramaDTO;


@WebServlet("*.board")
public class BoardController extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		String loginID = (String)request.getSession().getAttribute("loginID");
		if (loginID != null) {
		try {

			String uri = request.getRequestURI();
			System.out.println("요청 URI : " + uri);


				//게시판 리스트 출력 (R)
				if(uri.equals("/boardList.board")) {

					String page = request.getParameter("cpage");
					int cpage = Integer.parseInt(page);
					request.getSession().setAttribute("boardPage", page);

					List<BoardDTO> board = BoardDAO.getInstance().selectBoardByRange(cpage*20-19, cpage*20);
					//List<BoardDTO> list = BoardDAO.getInstance().selectBoardByRange(cpage*20-19, cpage*20);
					String navi = BoardDAO.getInstance().getBoardPageNavi(cpage);
					//				List<String>list=BoardDAO.getInstance().getBoardPageNavi(cpage);
					//				int endNavi=Integer.parseInt(list.get(0));
					//				String navi=list.get(1);
					request.setAttribute("board", board);
					request.setAttribute("navi", navi);
					//				request.setAttribute("endNavi", endNavi);
					request.getRequestDispatcher("/board/boardList.jsp").forward(request, response);


					// 게시판 검색 리스트 출력 (R)
				}else if(uri.equals("/boardSearchList.board")) {
					String boardSearchOption=request.getParameter("boardSearchOption");
					String boardSearchWord = request.getParameter("boardSearchWord");
					int cpage = Integer.parseInt(request.getParameter("cpage"));
					int count = BoardDAO.getInstance().getSearchRecordCount(boardSearchOption, boardSearchWord);
					List<BoardDTO>board = BoardDAO.getInstance().selectBoardSearchList(boardSearchOption,boardSearchWord,cpage*20-19, cpage*20);
					//				List<String>list=BoardDAO.getInstance().getBoardPageNavi(cpage);
					String navi = BoardDAO.getInstance().getBoardSearchPageNavi(boardSearchOption,boardSearchWord,cpage);
					//
					//				int endNavi=Integer.parseInt(list.get(0));
					//				String navi=list.get(1);
					request.setAttribute("board", board);
					request.setAttribute("navi", navi);
					//				request.setAttribute("endNavi", endNavi);
					request.getRequestDispatcher("/board/boardSearchList.jsp").forward(request, response);


					// 게시글 이미지 입력
				}else if(uri.equals("/imageupload.board")) {

					int maxSize = 1024*1024*10;
					String savePath = request.getServletContext().getRealPath("/files");
					File fileSavePath = new File(savePath);
					if(!fileSavePath.exists()) {
						fileSavePath.mkdir();
					}

					MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF8", new DefaultFileRenamePolicy());
					String sysName = multi.getFilesystemName("image");
					response.setContentType("text/html;charset=utf8");
					response.getWriter().append("/files/"+sysName);


					// 게시글 입력 (C)
				}else if(uri.equals("/insertBoardContents.board")) {
					if (request.getMethod().equals("GET")) {
						response.sendRedirect("/error.jsp");
						return;
					}
					String b_writer_id = (String)request.getSession().getAttribute("loginID");
					String b_writer_nn = (String)request.getSession().getAttribute("loginNickname");
					String b_category = request.getParameter("b_category");
					String b_title = request.getParameter("b_title");
					String b_content = request.getParameter("b_content");

					int nextVal = BoardDAO.getInstance().getBoardNextVal();

					BoardDAO.getInstance().insertBoardContents(new BoardDTO(nextVal ,b_category, b_writer_id, b_writer_nn, null, b_title, b_content, 0));
					String b_seq = String.valueOf(nextVal);
					response.getWriter().append(b_seq);



					// 게시글 출력 (R)
				}else if(uri.equals("/selectBoardContents.board")){

					int b_seq = Integer.parseInt(request.getParameter("b_seq"));

					BoardDAO.getInstance().addBoardViewCount(b_seq);

					BoardDTO dto = BoardDAO.getInstance().selectBoardContents(b_seq);
					request.setAttribute("dto", dto);

					List<BoardCommentDTO> list = BoardCommentDAO.getInstance().selectBoardComment(b_seq);
					request.setAttribute("list", list);

					request.getRequestDispatcher("/board/boardContents.jsp").forward(request, response);



					// 게시글 삭제 (D)
				}else if(uri.equals("/deleteBoardContents.board")) {

					int b_seq = Integer.parseInt(request.getParameter("b_seq"));

					int result = BoardDAO.getInstance().deleteBoardContents(b_seq);

					String page = (String)request.getSession().getAttribute("boardPage");

					response.sendRedirect("/boardList.board?cpage="+page);


					//게시글 수정페이지 출력
				}else if(uri.equals("/beforeUpdateBoardContents.board")) {

					int b_seq = Integer.parseInt(request.getParameter("b_seq"));

					BoardDTO dto = BoardDAO.getInstance().selectBoardContents(b_seq);

					request.setAttribute("dto", dto);
					request.getRequestDispatcher("/board/updateBoardContents.jsp").forward(request, response);




					// 게시글 수정 (U)
				}else if(uri.equals("/updateBoardContents.board")) {
					if (request.getMethod().equals("GET")) {
						response.sendRedirect("/error.jsp");
						return;
					}

					int b_seq = Integer.parseInt(request.getParameter("b_seq"));
					String b_category = request.getParameter("b_category");
					String b_title = request.getParameter("b_title");
					String b_content = request.getParameter("b_content");
					int result = BoardDAO.getInstance().updateBoardContents(b_category, b_title,b_content,b_seq);


				}	


		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect("/error.jsp");

		}
		}else {
			response.sendRedirect("/error.jsp");

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
