package board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/travelboard/boardReply")
public class BoardReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		BoardMgr bMgr = new BoardMgr();
		BoardBean bean = new BoardBean();
		bean.setName(request.getParameter("name"));
		bean.setSubject(request.getParameter("subject"));
		bean.setContent(request.getParameter("content"));
		bean.setRef(Integer.parseInt(request.getParameter("ref")));
		bean.setPos(Integer.parseInt(request.getParameter("pos")));
		bean.setDepth(Integer.parseInt(request.getParameter("depth")));
		bean.setPass(request.getParameter("pass"));
		bean.setIp(request.getParameter("ip"));
		bean.setCategory(request.getParameter("category"));
		
		bMgr.replyUpBoard(bean.getRef(), bean.getPos());
		bMgr.replyBoard(bean);
		
		String nowPage = request.getParameter("nowPage");
		response.sendRedirect("board.jsp?nowPage=" + nowPage);		
	}
}
