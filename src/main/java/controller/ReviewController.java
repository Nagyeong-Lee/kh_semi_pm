package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Drama_reviewDAO;
import dao.Movie_reviewDAO;


@WebServlet("*.review")
public class ReviewController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf8");

		response.setContentType("test/html; charset=UTF-8");

		String uri = request.getRequestURI();
		
		
		if(uri.equals("/write.review")) { 
			
			String nickname = (String)request.getSession().getAttribute("loginNickname");
			String rv_content=request.getParameter("rv_content");
			int mv_id=Integer.parseInt(request.getParameter("mv_id"));
			int dr_id=Integer.parseInt(request.getParameter("dr_id"));
			
			System.out.println(nickname+" : "+rv_content+" : "+mv_id+" : "+dr_id);
		
			//콘텐츠 종류에 따라 insert 조건을 따로 주는 로직
			if(mv_id != 0){
				try{
				int mvr_result=Movie_reviewDAO.getInstance().insertMovieReview(nickname, rv_content, mv_id);

				response.sendRedirect("/detail.content?mv_id="+mv_id);
			
			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("/Error.jsp");
				}
			}else if(dr_id != 0) {
				
				try{
					int drr_result=Drama_reviewDAO.getInstance().insertDramaReview(nickname, rv_content, dr_id);
					
					response.sendRedirect("/detail.content?dr_id="+dr_id);
				
				}catch(Exception e) {
					e.printStackTrace();
					response.sendRedirect("/Error.jsp");
				}
				
			}
			
	
		}
		
		if(uri.equals("/list.review")) { }
		
		
		
		

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
