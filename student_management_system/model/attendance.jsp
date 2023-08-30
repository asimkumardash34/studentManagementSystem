<%@ page import= "Model.*" %>
<%@ page import= "java.util.*" %>

<%
	Attendance attendanceObj = new Attendance();
	if((request.getParameter("act")).equals("Save"))
	{
		HashMap results = new HashMap();
		results.put("attendance_id",request.getParameter("attendance_id"));
		results.put("attendance_student_id",request.getParameter("attendance_student_id"));
		results.put("attendance_date",request.getParameter("attendance_date"));
		results.put("attendance_in_time",request.getParameter("attendance_in_time"));
		results.put("attendance_out_time",request.getParameter("attendance_out_time"));
				
		if((request.getParameter("attendance_id")).equals(""))
		{
			String id = attendanceObj.saveAttendance(results);
			response.sendRedirect("../report-attendance.jsp?msg=Attendance Saved Successfully&student_id=0");
		}
	}
%>
