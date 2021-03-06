package app;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import data.Answer;
import data.Question;

/**
 * Servlet implementation class ReadToUpdateAnswer
 * Displays candidates answers that can be later changed
 */
@WebServlet("/jsp/ReadToUpdateAnswer")
public class ReadToUpdateAnswer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Dao dao = null;
	
	public void init() 
	{
		dao = new Dao();
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReadToUpdateAnswer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		
		ArrayList<Answer> a = null;
		
		if (dao.getConnection()) {
 			a = dao.getCanAnswerList(id);
 		}
		request.setAttribute("id", id);
		request.setAttribute("answer", a);
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/change-answer.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
