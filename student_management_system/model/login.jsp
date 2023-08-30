<%@ page import= "Model.*" %>
<%@ page import= "java.util.*" %>

<%
	Login login_obj = new Login();
	if((request.getParameter("act")).equals("chk_login"))
	{
		if(login_obj.checkLogin(request.getParameter("login_user"),request.getParameter("login_password")))
		{
			HashMap Values =  login_obj.getLoginDetails(request.getParameter("login_user"),request.getParameter("login_password"));
			session.setAttribute("login_id",Values.get("login_id"));
			session.setAttribute("login_emp_id",Values.get("login_emp_id"));
			session.setAttribute("login_user",Values.get("login_user"));
			session.setAttribute("login_level",Values.get("login_level"));
			response.sendRedirect("../login-home.jsp?msg=You are login successfully.");
		}
		else
		{
			response.sendRedirect("../login.jsp?msg=Invalid User/Password. Please try again.........");			
		}
	}
	if((request.getParameter("act")).equals("change_password"))
	{
		if(login_obj.changePassword(request.getParameter("old_password"),request.getParameter("new_password"),Integer.parseInt(request.getParameter("login_id"))))
		{
			response.sendRedirect("../change-password.jsp?msg=Your Password has been changed successfully.");
		}
		else
		{
			response.sendRedirect("../change-password.jsp?msg=Old Password doesnot match. Please try again......");			
		}
	}
	if((request.getParameter("act")).equals("logout"))
	{
		session.setAttribute("login_id",null);
		session.setAttribute("login_level",null);
		response.sendRedirect("../login.jsp?title=&msg=You are logout successfully......");			
	}
%>
