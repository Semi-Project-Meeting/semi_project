package test.com.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BoardInsertController
 */
@WebServlet({ "/b_write.do", "/b_writeOK.do" })
public class BoardWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardWriteController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sPath = request.getServletPath();
		System.out.println("doGet:" + sPath);
		
//		System.out.println(request.getParameter("board_id"));
//		
//		BoardVO vo = new BoardVO();
//		vo.setBoard_id(Integer.parseInt(request.getParameter("board_id")));
//		
//		BoardDAO dao = new BoardDAOimpl();
//		
//		BoardVO vo2 = dao.selectOne(vo);
//		System.out.println("vo2:"+vo2);
//		
//		request.setAttribute("vo2", vo2);
		request.getRequestDispatcher("boardJsp/write.jsp").forward(request,response);
		
		



	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String sPath = request.getServletPath();
		System.out.println("doPost:" + sPath);

		// test용--> 로그인구현 다 되면 지우기
		HttpSession session = request.getSession(); // 객체 초기화
		session.setMaxInactiveInterval(60);// interval 설정(초단위, 기본은 10~15분)
		session.setAttribute("member_id", "1"); // -> 브라우저 X표 누르기전까지는 session에 저장됨.

		System.out.println(request.getParameter("title"));
		System.out.println(request.getParameter("contents"));
		System.out.println(request.getParameter("writer"));
		System.out.println(request.getParameter("notice"));

		BoardDAO dao = new BoardDAOimpl();

		BoardVO vo = new BoardVO();
		vo.setMember_id(Integer.parseInt((String) session.getAttribute("member_id")));
		vo.setMeeting_id(request.getIntHeader("meeting_id"));
		vo.setTitle(request.getParameter("title"));
		vo.setContents(request.getParameter("contents"));
		vo.setWriter(request.getParameter("writer"));
		vo.setNotice(request.getParameter("notice"));
		int result = dao.createBoard(vo);
		System.out.println("result:" + result);

		if(result==1)
			response.sendRedirect("b_board.do");
		else 
			response.sendRedirect("b_write.do");


	}// end doPost

}
