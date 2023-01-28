package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DramaDAO;
import dao.MovieDAO;
import dto.DramaDTO;
import dto.MovieDTO;


@WebServlet("/main")
public class MainController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");

		String uri = request.getRequestURI();
		System.out.println("요청 URI : " + uri);

		try {
			List <DramaDTO> dr_list_d =DramaDAO.getInstance().searchByDate();
			request.setAttribute("dr_list_d", dr_list_d);
			List <DramaDTO> dr_list_a =DramaDAO.getInstance().searchByAvg();
			request.setAttribute("dr_list_a", dr_list_a);
			List <MovieDTO> mv_list_d = MovieDAO.getInstance().searchByDate();
			request.setAttribute("mv_list_d", mv_list_d);
			List <MovieDTO> mv_list_a = MovieDAO.getInstance().searchByAvg();
			request.setAttribute("mv_list_a", mv_list_a);

			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.html");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
