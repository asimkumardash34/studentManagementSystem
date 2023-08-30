<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
	    <div style="width: 70%; float:left; margin-right:30px" id="login-home">
		  <h2><b>Student Management System</b></h2>
		  <% if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("3")) { %>		
		  <ul>
			<li><a href="index.jsp">Home</a></li>
			<li><a href="about-us.jsp">About Us</a></li>
			<li><a href="report-attendance.jsp?student_id=<%=session.getAttribute("login_emp_id")%>">My Attendance Report</a></li>
			<li><a href="report-fees.jsp?student_id=<%=session.getAttribute("login_emp_id")%>">My Fees Report</a></li>
			<li><a href="student.jsp?student_id=<%=session.getAttribute("login_emp_id")%>">My Account</a></li>
			<li><a href="change-password.jsp">Change Password</a></li>
			<li><a href="login.jsp?act=logout">Logout</a></li>
		  </ul>
		  <% } %>
		  
		 <% if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("1")) { %>		
		  <ul>
			<li><a href="index.jsp">Home</a></li>
			<li><a href="about-us.jsp">About Us</a></li>
			<li><a href="student.jsp?student_id=0">Add Student</a></li>
 		    <li><a href="fees.jsp?fees_id=0">Add Fees</a></li>
			<li><a href="attendance.jsp?attendance_id=0">Add Attendance</a></li>
			<li><a href="report-student.jsp">Student Report</a></li>
			<li><a href="report-fees.jsp">Fees Report</a></li>
			<li><a href="report-attendace.jsp">Attendance Report</a></li>
			<li><a href="change-password.jsp">Change Password</a></li>
			<li><a href="login.jsp?act=logout">Logout</a></li>
		  </ul>
		  <% } %>
		</div>
		<div style="float: left">
			<div><img src="images/save_1.jpg" style="width: 250px"></div><br>
		</div>
      <div class="clear"></div>
    </main>
  </div>
</div>
<%@ include file="includes/footer.jsp" %>
