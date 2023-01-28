package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardCommentComplainDAO;
import dto.BoardCommentComplainDTO;


@WebServlet("*.boardcommentcomplain")
public class BoardCommentComplainController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		String uri = request.getRequestURI();
		System.out.println("요청 URI : " + uri);

		String loginID = (String)request.getSession().getAttribute("loginID");
		if (loginID != null) {
			try {
				if(uri.equals("/insertBoardCommentComplain.boardcommentcomplain")) {
					String bcmcp_complainer = String.valueOf(request.getSession().getAttribute("loginID"));
					int bcm_seq = Integer.parseInt(request.getParameter("bcm_seq"));
					String bcm_writer_id = request.getParameter("bcm_writer_id");
					String bcm_writer_nn = request.getParameter("bcm_writer_nn");
					String bcm_content = request.getParameter("bcm_content");

					BoardCommentComplainDAO.getInstance().insertBoardCommentComplain(new BoardCommentComplainDTO(0,bcmcp_complainer,null,bcm_seq,bcm_writer_id, bcm_writer_nn, bcm_content));

					response.sendRedirect("/board/boardContents.jsp");
				}
			}catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("/error.jsp");}
		}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

