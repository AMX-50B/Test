package net.hncu.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.hncu.dao.UserDao;
import net.hncu.dao.ViewDao;
import net.hncu.model.Message;
import net.hncu.model.User;

/**
 * Servlet implementation class User_login
 */
public class User_login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public User_login() {
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
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		User userr=(User)session.getAttribute("user");
		String flag = request.getParameter("flag");
		UserDao ud = new UserDao();
		ViewDao vd = new ViewDao();
		//�ǳ�
		if("out".equals(flag)){
			session.removeAttribute("user");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		// ��¼
		if ("login".equals(flag)) {
			if(userr!=null){
				session.removeAttribute("user");
			}
			String userName = request.getParameter("userName");
			String userPassword = request.getParameter("userPassword");
			String ck = request.getParameter("ck");

			User user = ud.user_login(userName, userPassword);
			// System.out.println(userN);
			if (user != null) {
				// ��ʱע���ض�����������Servlet����·��
				Cookie c;
				if ("on".equals(ck)) {
					c = new Cookie("userName", userName);
					c.setMaxAge(20);
					response.addCookie(c);
					c = new Cookie("userPassword", userPassword);
					c.setMaxAge(20);
					response.addCookie(c);
				}
				
				session.setAttribute("user", user);
				// �����ض���URL���ô����URL�滻��http://localhost:8080/city/admin/adminTemp.jsp��

				// response.sendRedirect("admin/adminTemp.jsp");

				// ����ת��ָ���ļ�����ָ��·���ļ����ļ����滻��http://localhost:8080/city/adminTemp.jsp��
				// �������adminTemp.jsp�м���<base
				// herf="<%=request.getContextPath()%>/">
				System.out.println(user.getUser_type());
				if(user.getUser_type()!=1){
					request.getRequestDispatcher("view/indextemp.jsp").forward(request, response);
					System.out.println(111111111);
				}else{
					request.getRequestDispatcher("admin/adminTemp.jsp").forward(request, response);
				}				
			} else {
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().print("<script>alert('�û������������');history.go(-1)</script>");
				// response.sendRedirect("login.jsp");
			}
			
			// ע��
		} else if ("reg".equals(flag)) {
			String username = request.getParameter("username");
			String userpassword = request.getParameter("password");
			User ruser = new User();
			ruser.setUser_name(username);
			ruser.setUser_password(userpassword);
			boolean isExit = ud.user_reg_re(username);
			if (isExit) {
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().print("<script>alert('�û����Ѵ��ڣ�');history.go(-1)</script>");
			} else {
				boolean rflag = ud.user_reg(ruser);
				if (rflag)
					response.sendRedirect("login.jsp");
				else
					response.sendRedirect("admin/register.jsp");
			}
			// ��̨id��ѯ�û���Ϣ
		} else if ("userlist".equals(flag)) {
			int page = 1;
			int row = 5;
			List<User> alluser = ud.getUsers();
			int end = alluser.size();
			int ends = (end + row - 1) / row;
			String id = request.getParameter("userid");
			String pageS = request.getParameter("page");
			// System.out.println(pageS+"00000");
			if (!"".equals(id) && id != null) {
				ends = 1;
			}
			if (pageS != null && !"".equals(pageS)) {
				page = Integer.parseInt(pageS);
				// System.out.println(page+22222);
			}
			// System.out.println(page+"55555");
			List<User> userlist = ud.getUserById(id, (page - 1) * 5, row);
			// System.out.println(userlist.size());
			// System.out.println(ends);
			request.setAttribute("ends", ends);
			request.setAttribute("user", userlist);
			request.setAttribute("page", page);
			request.getRequestDispatcher("admin/userList.jsp").forward(request, response);
			// ��̨ɾ���û���Ϣ
		} else if ("delete".equals(flag)) {
			String uID = request.getParameter("useID");
			int id = Integer.parseInt(uID);
			// boolean dBack=ud.user_delete_id(id);
			boolean dBack = ud.user_up_id(id);
			if (dBack) {
				request.getRequestDispatcher("User_login?flag=userlist").forward(request, response);
			} else {
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().print("<script>alert('ɾ��ʧ��');history.go(-1)</script>");
			}
			// ��̨������ת
		} else if ("toupdate".equals(flag)) {
			String uId = request.getParameter("id");
			int id = Integer.parseInt(uId);
			User user = ud.getUser(id);
			if (user != null) {
				request.setAttribute("user", user);
				request.getRequestDispatcher("admin/userUpdate.jsp").forward(request, response);
			} else {
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().print("<script>alert('���ݲ�����');history.go(-1)</script>");
			}
			// ��̨��������
		} else if ("userUpdate".equals(flag)) {
			String uid = request.getParameter("userid");
			String usp = request.getParameter("password");
			int id = Integer.parseInt(uid);
			boolean f = ud.user_update(id, usp);
			if (f) {
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().print("<script>alert('�޸ĳɹ�');history.go(-2)</script>");
			} else {
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().print("<script>alert('�޸�ʧ��');history.go(-1)</script>");
			}
			// ��̨������Ϣ
		} else if ("infolist".equals(flag)) {
			int page = 1;
			int row = 5;
			String pay = request.getParameter("pay");
			String state = request.getParameter("state");
			String type = request.getParameter("type");
			String pageS = request.getParameter("page");
			// System.out.println(pay+state+type);
			List<Message> lists = vd.getMessageLists(pay, state, type);
			int ends = lists.size();
			int end = (ends + row - 1) / row;
			if (!"".equals(pageS) && pageS != null) {
				page = Integer.parseInt(pageS);
			}
			List<Message> list = vd.getMessageList(pay, state, type, (page - 1) * row, 5);
			request.setAttribute("list", list);
			request.setAttribute("end", end);
			request.setAttribute("ends", ends);
			request.setAttribute("page", page);
			request.setAttribute("pay", pay);
			request.setAttribute("state", state);
			request.setAttribute("type", type);

			request.getRequestDispatcher("admin/infolist.jsp").forward(request, response);
			//��̨�鿴��ϸ��Ϣ
		} else if ("infocheck".equals(flag)) {
			String ids = request.getParameter("id");
			int id = Integer.parseInt(ids);
			Message message = vd.getMessageById(id);
			request.setAttribute("message", message);
			request.getRequestDispatcher("admin/infocheck.jsp").forward(request, response);
			//���ø���
		} else if ("pay".equals(flag)) {
			// System.out.println("1111111111111");
			String ids = request.getParameter("id");
			int id = Integer.parseInt(ids);
			Message message = vd.getMessageById(id);
			// System.out.println(message);
			if (message == null) {
				response.getWriter().print("<script>alert('���ݲ�����');history.go(-1)</script>");
			} else if (message.getPay() != 0) {
				response.getWriter().print("<script>alert('�����Ѹ���');history.go(-1)</script>");
			} else {
				boolean f = vd.updatePay(id);
				if (f) {
					response.getWriter().print("<script>alert('���óɹ�');</script>");
					request.getRequestDispatcher("User_login?flag=infocheck&id=" + id).forward(request, response);
				}
			}
			//�������
		} else if ("state".equals(flag)) {
			String ids = request.getParameter("id");
			int id = Integer.parseInt(ids);
			boolean f = vd.updateState(id);
			if (f) {
				response.getWriter().print("<script>alert('���óɹ�');</script>");
				request.getRequestDispatcher("User_login?flag=infocheck&id=" + id).forward(request, response);
			}
		}
	}
}
