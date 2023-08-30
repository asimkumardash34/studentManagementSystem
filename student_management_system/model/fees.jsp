<%@ page import= "Model.*" %>
<%@ page import= "java.util.*" %>

<%
	Fees feesObj = new Fees();
	if((request.getParameter("act")).equals("Save"))
	{
		HashMap results = new HashMap();
		results.put("fees_id",request.getParameter("fees_id"));
		results.put("fees_student_id",request.getParameter("fees_student_id"));
		results.put("fees_month",request.getParameter("fees_month"));
		results.put("fees_amount",request.getParameter("fees_amount"));
		results.put("fees_date",request.getParameter("fees_date"));
				
		if((request.getParameter("fees_id")).equals(""))
		{
			String id = feesObj.saveFees(results);
			response.sendRedirect("../report-fees.jsp?msg=Fees Saved Successfully&student_id=0");
		}
	}
%>
