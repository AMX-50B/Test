package net.hncu.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.hncu.dao.ViewDao;
import net.hncu.model.Message;
import net.hncu.model.User;

/**
 * Servlet implementation class User_view
 */
public class User_view extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public User_view() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*//Post����������
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");		  
		*/ 
		
		String flag=request.getParameter("flag");
		//get���������� String flag2= new String(flag.getBytes("ISO-8859-1"),"utf-8");
		ViewDao vd=new ViewDao();
		HttpSession session = request.getSession();
		User user=(User)session.getAttribute("user");
		//������Ϣ
		if("addinfo".equals(flag)){
			String types=request.getParameter("infoSingle.infoType");
			int type=Integer.parseInt(types);
			String title=request.getParameter("infoSingle.infoTitle");
			String context=request.getParameter("infoSingle.infoContent");
			String phone=request.getParameter("infoSingle.infoPhone");
			String name = request.getParameter("infoSingle.infoLinkman");
			String mail=request.getParameter("infoSingle.infoEmail");
			
			if(user!=null){
				Message mg=new Message();
				mg.setType(type);
				mg.setTitle(title);
				mg.setContext(context);
				mg.setPhone(phone);
				mg.setName(name);
				mg.setMail(mail);
				boolean f=vd.setMessage(mg);
				if(f){
					response.getWriter().print("<script>alert('����ɹ�');window.location.href='admin/addinfo.jsp'</script>");
				}else{
					response.getWriter().print("<script>alert('����ʧ�ܣ�');history.go(-1)</script>");				
				}
			}else{
				response.getWriter().print("<script>alert('���ȵ�¼��');window.location.href='login.jsp'</script>");
			}
		//����Ȩ��
		}else if("back".equals(flag)){
			if(user!=null){
				if(user.getUser_type()!=1){
					response.getWriter().print("<script>alert('��û�з���Ȩ�ޣ�');history.go(-1)</script>");
				}else{
					request.getRequestDispatcher("admin/adminTemp.jsp").forward(request, response);
				}
			}else{
				response.getWriter().print("<script>alert('���ȵ�¼��');window.location.href='login.jsp'</script>");
			}
		}
		}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
