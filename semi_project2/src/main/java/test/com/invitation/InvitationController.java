package test.com.invitation;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import test.com.member.MemberVO;
import test.com.notice.NoticeDAO;
import test.com.notice.NoticeDAOimpl;

/**
 * Servlet implementation class NoticeController
 */
@WebServlet({ "/invitation.do", "/invitation_searchOne.do", "/invitation_invite.do", "/invitation_delete.do",
		"/invitation_accept.do" })
public class InvitationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private InvitationDAO dao = new InvitationDAOimpl();
	private NoticeDAO noticeDAO = new NoticeDAOimpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InvitationController() {
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
		System.out.println("Get:" + sPath);

		// test용--> 로그인구현 다 되면 지우기
		HttpSession session = request.getSession(); // 객체 초기화
		session.setMaxInactiveInterval(60);// interval 설정(초단위, 기본은 10~15분)
		session.setAttribute("member_id", "1"); // -> 브라우저 X표 누르기전까지는 session에 저장됨.

		if (sPath.equals("/invitation.do")) {
			request.getRequestDispatcher("invitation.jsp").forward(request, response);
		} else if (sPath.equals("/invitation_searchOne.do")) {
			MemberVO vo = dao.searchOne(request.getParameter("searchKey"), request.getParameter("searchWord"),
					Long.parseLong(request.getParameter("meeting_id")));
			System.out.println(vo);
			request.setAttribute("vo", vo);
			request.getRequestDispatcher("invitation.jsp").forward(request, response);
		} else if (sPath.equals("/invitation_invite.do")) {
			dao.insert(request.getParameter("meeting_id"),request.getParameter("i_member_id"));
			request.getRequestDispatcher("invitation.jsp").forward(request, response);
		} else if (sPath.equals("/invitation_delete.do")) {
			noticeDAO.delete(Long.parseLong(request.getParameter("notice_id")));
			request.getRequestDispatcher("notice.jsp").forward(request, response);
		} else if (sPath.equals("/invitation_accept.do")) {
			noticeDAO.delete(Long.parseLong(request.getParameter("notice_id")));
			request.getRequestDispatcher("meeting/selectOne.jsp").forward(request, response);
		}

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

}
