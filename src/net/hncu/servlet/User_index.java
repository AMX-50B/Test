package net.hncu.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.hncu.dao.ViewDao;
import net.hncu.model.Message;

/**
 * Servlet implementation class User_index
 */
public class User_index extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public User_index() {
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
		String flag = request.getParameter("flag");
		ViewDao vd = new ViewDao();

		// 主页数据处理
		if ("index".equals(flag)) {
			Message zp = vd.getMessageByType(1, 1, 1);
			Message px = vd.getMessageByType(2, 1, 1);
			Message fw = vd.getMessageByType(3, 1, 1);
			Message qg = vd.getMessageByType(4, 1, 1);
			Message zs = vd.getMessageByType(5, 1, 1);
			Message gy = vd.getMessageByType(6, 1, 1);
			Message qz = vd.getMessageByType(7, 1, 1);
			Message jj = vd.getMessageByType(8, 1, 1);
			Message fpx = vd.getMessageByType(2, 1, 0);
			Message fqz = vd.getMessageByType(7, 1, 0);
			System.out.println(fpx);
			System.out.println(fqz);
			request.setAttribute("zp", zp);
			request.setAttribute("px", px);
			request.setAttribute("fw", fw);
			request.setAttribute("qg", qg);
			request.setAttribute("zs", zs);
			request.setAttribute("gy", gy);
			request.setAttribute("qz", qz);
			request.setAttribute("jj", jj);
			request.setAttribute("fpx", fpx);
			request.setAttribute("fqz", fqz);
			request.getRequestDispatcher("view/default.jsp").forward(request, response);

			// 主页超链接处理
		} else if ("top".equals(flag)) {
			String topid = request.getParameter("topid");
			int type = Integer.parseInt(topid);
			Message free = vd.getMessageByType(type, 1, 0);
			Message pay = vd.getMessageByType(type, 1, 1);
			// request.setAttribute("type", out(type));
			request.setAttribute("free", free);
			request.setAttribute("pay", pay);
			request.getRequestDispatcher("view/listshow.jsp").forward(request, response);

			// 主页搜索处理
		} else if ("search".equals(flag)) {
			int page = 1;
			int row = 5;
			String subsql = request.getParameter("subsql");
			String sqlvalue = request.getParameter("sqlvalue");
			String searchtype = request.getParameter("searchtype");
			String pageS = request.getParameter("page");
			// System.out.println(subsql+sqlvalue+searchtype);
			List<Message> lists = vd.searchMessages(subsql, sqlvalue, searchtype);
			int end = lists.size();
			int ends = (end + row - 1) / row;
			// System.out.println(pageS);
			if (!"".equals(pageS) && pageS != null) {
				page = Integer.parseInt(pageS);
			}
			// System.out.println(pageS+111111);
			// System.out.println(ends+222222);
			List<Message> list = vd.searchMessage(subsql, sqlvalue, searchtype, (page - 1) * row, row);
			// System.out.println(list.size());
			request.setAttribute("list", list);
			request.setAttribute("ends", ends);
			request.setAttribute("page", page);
			request.setAttribute("end", end);
			request.setAttribute("subsql", subsql);
			request.setAttribute("sqlvalue", sqlvalue);
			request.setAttribute("searchtype", searchtype);
			request.getRequestDispatcher("view/searchshow.jsp").forward(request, response);
			
			// 主页详细信息处理
		} else if ("singleshow".equals(flag)) {
			String mid = request.getParameter("mid");
			int id = Integer.parseInt(mid);
			Message message = vd.getMessageById(id);
			int type = message.getType();
			Message intro = vd.getMessageByType(type, 1, 1);
			request.setAttribute("message", message);
			request.setAttribute("intro", intro);
			request.getRequestDispatcher("view/singleshow.jsp").forward(request, response);
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
