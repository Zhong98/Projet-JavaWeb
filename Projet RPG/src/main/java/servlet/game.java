package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;

import vo.GameData;

/**
 * Servlet implementation class game
 */
@WebServlet("/game")
public class game extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public game() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		String message = "ID or password can't be null!";
		GameData gameData = new GameData();
		int dmj = getFigure(1, 10);
		int MPConsumed = 10;
		String skill = "Thunderbolt";
		int x = dmj % 2;
		if (x == 1) {
			skill = "Hyper Beam";
			MPConsumed = 20;
		}
		gameData.setGj(getFigure(100, 300)); //set Attack
		gameData.setJn(skill); //set Skill
		gameData.setJnhll(MPConsumed); //set MP consumed
		gameData.setLl(getFigure(100, 200)); //set MP
		gameData.setXl(getFigure(1000, 2000)); //set HP
		gameData.setMj(dmj); //set Agility
		gameData.setFy(getFigure(20, 50)); //set Defense
		session.setAttribute("gameData", gameData);
		
		out.println(JSON.toJSONString(gameData));
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	static int getFigure(int first, int end) {
		if (first > end) {
			int x = end;
			first = x;
			end = first;
		}
		Random rand = new Random();
		return rand.nextInt(first) + (end - first);
	}

}
