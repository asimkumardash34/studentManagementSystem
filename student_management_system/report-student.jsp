<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>

<%
	Student studentDetails = new Student();
	ArrayList allStudents = studentDetails.getAllStudent();
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>Student Report</h2>
		<% if(request.getParameter("msg") != null) { %>
		<div class="msg"><%=request.getParameter("msg") %></div>
		<% } %>
        <table>
          <thead>
            <tr>
              <th>Student Code</th>
              <th>Name</th>
              <th>Mobile</th>
              <th>Department</th>
              <th>Status</th>
              <th>Email</th>
	      <th>Action</th>
            </tr>
          </thead>
          <tbody>
			<% for(int i=0;i<allStudents.size();i++) 
			{ 
				HashMap StudentDetails = new HashMap();
				StudentDetails = (HashMap)allStudents.get(i);
				String department = studentDetails.getDepartment((Integer) StudentDetails.get("student_deparment"));
				String status = studentDetails.getStatus((Integer) StudentDetails.get("student_status"));
			%>
				<tr>
				  <td><% out.print(StudentDetails.get("student_id")); %></td>
				  <td><% out.print(StudentDetails.get("student_first_name")); %></td>
				  <td><% out.print(StudentDetails.get("student_mobile")); %></td>
				  <td><% out.print(department); %></td>
				  <td><% out.print(status); %></td>
				  <td><% out.print(StudentDetails.get("student_email")); %></td>
				  <td> <a href="student.jsp?student_id=<% out.print(StudentDetails.get("student_id")); %>">Edit</a> </td>
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
