package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardComplainDAO;
import dto.BoardComplainDTO;

@WebServlet("*.boardcomplain")
public class BoardComplainController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");

		String uri = request.getRequestURI();
		System.out.println("요청 URI : " + uri);
		String loginID = (String)request.getSession().getAttribute("loginID");
		System.out.println(loginID);
		if (loginID != null) {

      try {
         if(uri.equals("/insertBoardComplain.boardcomplain")) {
        	 
        	 String bcp_complainer = String.valueOf(request.getSession().getAttribute("loginID"));
//             String b_seq = request.getParameter("b_seq");
//             int ib_seq = Integer.parseInt(b_seq);
        	 int b_seq = Integer.parseInt(request.getParameter("b_seq"));
             
             String b_writer_id = request.getParameter("b_writer_id");
             String b_writer_nn = request.getParameter("b_writer_nn");
             String b_title = request.getParameter("b_title");
             String b_content = request.getParameter("b_content");
                          
             BoardComplainDAO.getInstance().insertBoardComplain(new BoardComplainDTO(0,bcp_complainer,null,b_seq,b_writer_id, b_writer_nn, b_title, b_content));
             
             System.out.println("here");
             // 테이블엔 잘 들어가.. 아 ajax라서 페이지 이동이 필요없구나 근데 왜 자꾸 에러가 나지 여기까지 왔는데?
//             response.sendRedirect("/board/boardContents.jsp");	 
         }
	}catch (Exception e) {
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
