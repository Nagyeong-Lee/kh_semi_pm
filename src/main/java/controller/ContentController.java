package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DramaDAO;
import dao.Drama_reviewDAO;
import dao.MovieDAO;
import dao.Movie_reviewDAO;
import dto.DramaDTO;
import dto.Drama_reviewDTO;
import dto.MovieDTO;
import dto.Movie_reviewDTO;

@WebServlet("*.content")
public class ContentController extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		request.setCharacterEncoding("utf8");
		
	    response.setContentType("test/html; charset=UTF-8");

		String uri = request.getRequestURI();


		if(uri.equals("/search.content")){

			System.out.println(uri);

			String searchtext=request.getParameter("searchtext");

			System.out.println(searchtext);


			try { 
				//드라마 출력
				List <DramaDTO> dr_list =DramaDAO.getInstance().searchBytitle(request.getParameter("searchtext"));
				request.setAttribute("dr_list", dr_list);
				
				//System.out.println(dr_list);



				//영화 출력
				List <MovieDTO> mv_list = MovieDAO.getInstance().searchBytitle(request.getParameter("searchtext"));
				request.setAttribute("mv_list", mv_list);
				
				
								System.out.println(mv_list.size());
			

				request.getRequestDispatcher("/content/SearchPage.jsp").forward(request, response); 


			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("Error.jsp");
			}

		}
		
	
		
		else if(uri.equals("/detailMv.content")) {
			//영화 출력 페이지 로직

			System.out.println(uri);

		
			int mv_id= Integer.parseInt(request.getParameter("mv_id"));


			try {
			
				MovieDTO mv_detail = MovieDAO.getInstance().selectByMv_seq(mv_id);
				//댓글) List<Movie_reviewDTO> mvr_list =Movie_reviewDAO.getInstance().selectMv_ReviewByMvSeq(mv_id);
				
				request.setAttribute("mv_detail", mv_detail);

			

				request.getRequestDispatcher("/content/ContentView.jsp").forward(request, response);

			}catch(Exception e)	{
				e.printStackTrace();
				response.sendRedirect("Error.jsp");
			}
		}
		
		else if(uri.equals("/detailDr.content")) {
			//드라마 출력 페이지 로직

			System.out.println(uri);

			int dr_id= Integer.parseInt(request.getParameter("dr_id"));
			
			try {
				DramaDTO dr_detail = DramaDAO.getInstance().selectByDr_id(dr_id);
				//댓글) List<Drama_reviewDTO> drr_list =Drama_reviewDAO.getInstance().selectDr_ReviewByDrSeq(dr_id);

				request.setAttribute("dr_detail", dr_detail);
				//댓글) request.setAttribute("drr_list", drr_list);
				
				// ott 아이콘 출력을 위한 구문(일단 스킵)-> 일단 dao에 기능 만들어서 콜하는게 깔끔할 듯
//				DramaDTO dr_fromOtt=DramaDAO.getInstance().selectOtt_icon(dr_id);
//
//				if(dr_fromOtt.getDr_ottDZ()==('Y')) {
//					
//					"/img/disbf.png"
//					
//					System.out.println("a"); 
//					
//				}else if(dr_fromOtt.getDr_ottDZ()==('Y')) {
//				
//				}else if() {
//					
//				}else {
//				
//				}
				

				request.getRequestDispatcher("/content/ContentView.jsp").forward(request, response);

			}catch(Exception e)	{
				e.printStackTrace();
				response.sendRedirect("Error.jsp");
			}
		}
			
		//ott별 버튼을 눌러서 ott별 출력 페이지로 넘어올 때, 이 컨트롤러들을 거쳐서 와야 함.
		if(uri.equals("/netflix.content")) {
			
			
			try {
				//최신순 출력
				List<DramaDTO> dr_date_n=DramaDAO.getInstance().selectByNF_date();
				List <MovieDTO> mv_date_n=MovieDAO.getInstance().selectByNF_date();
				
				//평점순 출력
				List<DramaDTO> dr_avg_n=DramaDAO.getInstance().selectByNF_avg();
				List<MovieDTO> mv_avg_n=MovieDAO.getInstance().selectByNF_avg();

				request.setAttribute("dr_date_n", dr_date_n);
				request.setAttribute("mv_date_n", mv_date_n);
				
				request.setAttribute("dr_avg_n", dr_avg_n);
				request.setAttribute("mv_avg_n", mv_avg_n);
				
				System.out.println(mv_date_n);

				request.getRequestDispatcher("/content/Ott_ContentView.jsp").forward(request, response); 

			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("Error.jsp");
			}

		}else if(uri.equals("/disney.content")) {
			
			try {
			//최신순 출력
			List<DramaDTO> dr_date_d=DramaDAO.getInstance().selectByDZ_date();
			List <MovieDTO> mv_date_d=MovieDAO.getInstance().selectByDZ_date();
			
			//평점순 출력
			List<DramaDTO> dr_avg_d=DramaDAO.getInstance().selectByDZ_avg();
			List<MovieDTO> mv_avg_d=MovieDAO.getInstance().selectByDZ_avg();
			
			System.out.println(dr_date_d);
			

			request.setAttribute("dr_date_d", dr_date_d);
			request.setAttribute("mv_date_d", mv_date_d);
			
			request.setAttribute("dr_avg_d", dr_avg_d);
			request.setAttribute("mv_avg_d", mv_avg_d);

			request.getRequestDispatcher("/content/Ott_ContentView.jsp").forward(request, response); 

		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("Error.jsp");
		}
			
		}else if(uri.equals("/wavve.content")) {
			
			try {
				
				//최신순 출력
			List<DramaDTO> dr_date_wv=DramaDAO.getInstance().selectByWV_date();
			List <MovieDTO> mv_date_wv=MovieDAO.getInstance().selectByWV_date();
				
				//평점순 출력
			List<DramaDTO> dr_avg_wv=DramaDAO.getInstance().selectByWV_avg();
			List<MovieDTO> mv_avg_wv=MovieDAO.getInstance().selectByWV_avg();
			
			

			request.setAttribute("dr_date_wv", dr_date_wv);
			request.setAttribute("mv_date_wv", mv_date_wv);
			
			request.setAttribute("dr_avg_wv", dr_avg_wv);
			request.setAttribute("mv_avg_wv", mv_avg_wv);

			request.getRequestDispatcher("/content/Ott_ContentView.jsp").forward(request, response); 

		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("Error.jsp");
		}
			
		}else if(uri.equals("/watcha.content")) {
			
			try {
			//최신순 출력
			List<DramaDTO> dr_date_wc=DramaDAO.getInstance().selectByWC_date();
			List <MovieDTO> mv_date_wc=MovieDAO.getInstance().selectByWC_date();
			
			//인기(평점)순 출력
			List<DramaDTO> dr_avg_wc=DramaDAO.getInstance().selectByWC_avg();
			List<MovieDTO> mv_avg_wc=MovieDAO.getInstance().selectByWC_avg();
			
			System.out.println(dr_date_wc);
			

			request.setAttribute("dr_date_wc", dr_date_wc);
			request.setAttribute("dr_avg_wc", dr_avg_wc);
			
			request.setAttribute("mv_date_wc", mv_date_wc);
			request.setAttribute("mv_avg_wc", mv_avg_wc);
			

			request.getRequestDispatcher("/content/Ott_ContentView.jsp").forward(request, response); 

		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("Error.jsp");
		}
			
		}
		
		//ott 버튼으로 이동 후 그 페이지에서 검색 시 해당 ott내에서만 검색 실행하게 하는 구문 (ott별 출력하는 페이지에 나오게 해야겠지)
		//이거 잘 생각해봐야겠다 dao에서 ott별로 거를 수만 있다면 좋을텐데
		//jsp에서 받아주는 로직 다시 만들어야 함.
		
		if(uri.equals("/n_search.content")) {
			
			System.out.println(uri);

			String n_searchtext=request.getParameter("n_searchtext");

			System.out.println(n_searchtext);


			try { 
				//드라마 출력
				List <DramaDTO> n_dr_list =DramaDAO.getInstance().searchByNF_title(request.getParameter("n_searchtext"));
				request.setAttribute("n_dr_list", n_dr_list);
				
				System.out.println(n_dr_list);


				//영화 출력
				List <MovieDTO> n_mv_list = MovieDAO.getInstance().searchByNF_title(request.getParameter("n_searchtext"));
				request.setAttribute("n_mv_list", n_mv_list);
				
			
			request.getRequestDispatcher("/content/Netflix.jsp").forward(request, response); 

		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("Error.jsp");
		}
			
		}else if(uri.equals("/d_search.content")) {
			
			System.out.println(uri);

			String d_searchtext=request.getParameter("d_searchtext");

			System.out.println(d_searchtext);


			try { 
				//드라마 출력
				List <DramaDTO> d_dr_list =DramaDAO.getInstance().searchByDZ_title(request.getParameter("d_searchtext"));
				request.setAttribute("d_dr_list", d_dr_list);
				
				System.out.println(d_dr_list);


				//영화 출력
				List <MovieDTO> d_mv_list = MovieDAO.getInstance().searchByDZ_title(request.getParameter("d_searchtext"));
				request.setAttribute("d_mv_list", d_mv_list);
				
			
			request.getRequestDispatcher("/content/Disney.jsp").forward(request, response); 

		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("Error.jsp");
		}
			
		}else if(uri.equals("/wv_search.content")) {
			
			System.out.println(uri);

			String wv_searchtext=request.getParameter("wv_searchtext");

			System.out.println(wv_searchtext);


			try { 
				//드라마 출력
				List <DramaDTO> wv_dr_list =DramaDAO.getInstance().searchByWV_title(request.getParameter("wv_searchtext"));
				request.setAttribute("wv_dr_list", wv_dr_list);
				
				//System.out.println(ott_dr_list);


				//영화 출력
				List <MovieDTO> wv_mv_list = MovieDAO.getInstance().searchByWV_title(request.getParameter("wv_searchtext"));
				request.setAttribute("wv_mv_list", wv_mv_list);
				
			
			request.getRequestDispatcher("/content/Wavve.jsp").forward(request, response); 

		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("Error.jsp");
		}
			
		}else if(uri.equals("/wc_search.content")) {
			
			System.out.println(uri);

			String wc_searchtext=request.getParameter("wc_searchtext");

			System.out.println(wc_searchtext);


			try { 
				//드라마 출력
				List <DramaDTO> wc_dr_list =DramaDAO.getInstance().searchByWC_title(request.getParameter("wc_searchtext"));
				request.setAttribute("wc_dr_list", wc_dr_list);
				
				//System.out.println(ott_dr_list);


				//영화 출력
				List <MovieDTO> wc_mv_list = MovieDAO.getInstance().searchByWC_title(request.getParameter("wc_searchtext"));
				request.setAttribute("wc_mv_list", wc_mv_list);
				
			
			request.getRequestDispatcher("/content/Watcha.jsp").forward(request, response); 

		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("Error.jsp");
		}
			
		}
		

		//콘텐츠 좋아요 눌렀을 때
		else if(uri.equals("/like.content")) {
			
			String nickname = (String)request.getSession().getAttribute("loginNickname");
			
//			if(좋아요 누른게==0) {
//				DramaDAO.getInstance().insertLike();
//				MovieDAO.getInstance().insertLike();
				
//			}else{DramaDAO.getInstance().deleteLike();}
			
		}
		
		
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
