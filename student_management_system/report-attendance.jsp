<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>

<%
	Attendance attendanceDetails = new Attendance();
	ArrayList allAttendance = attendanceDetails.getAllAttendance(request.getParameter ("student_id"));
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>Attendance Report</h2>
		<% if(request.getParameter("msg") != null) { %>
		<div class="msg"><%=request.getParameter("msg") %></div>
		<% } %>
        <table>
          <thead>
            <tr>
			  <th>Sr. No.</th>
              <th>Roll Number</th>
              <th>Name</th>
              <th>Date</th>
              <th>In Time</th>
              <th>Out Time</th>
            </tr>
          </thead>
          <tbody>
			<% for(int i=0;i<allAttendance.size();i++) 
			{ 
				HashMap AttendanceDetails = new HashMap();
				AttendanceDetails = (HashMap)allAttendance.get(i);
			%>
				<tr>
				  <td style="text-align:center;"><% out.print(i+1); %></td>
				  <td><% out.print(AttendanceDetails.get("attendance_student_id")); %></td>
				  <td><% out.print(AttendanceDetails.get("student_name")); %></td>
				  <td><% out.print(AttendanceDetails.get("attendance_date")); %></td>
				  <td><% out.print(AttendanceDetails.get("attendance_in_time")); %></td>
				  <td><% out.print(AttendanceDetails.get("attendance_out_time")); %></td>
				</tr>
			<%
			}
			%>
			</tbody>
        </table>
        </div>
    </main>
  </div>
</div>
<%@ include file="includes/footer.jsp" %>
