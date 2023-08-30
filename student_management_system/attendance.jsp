<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Attendance attendanceDetails = new Attendance();
	Student studentDetails = new Student();
	int attendance_id = Integer.parseInt(request.getParameter ("attendance_id"));
	HashMap Values =  attendanceDetails.getAttendanceDetails(attendance_id);
%>
<script>
  jQuery(function() {
    jQuery( "#attendance_date" ).datepicker({
      changeMonth: true,
      changeYear: true,
       yearRange: "-1:+0",
       dateFormat: 'd MM,yy'
    });
  });
</script>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Student Attendance </h2>
        <form action="model/attendance.jsp" method="post" id="Form">
          <div>
             <label for="email">Select Student<span>*</span></label>
            <select style="height: 40px; width:300px" name ="attendance_student_id" required>
				<% out.print(studentDetails.getStudentsOption((Integer) Values.get("attendance_student_id"))); %>
            </select>
          </div>
		  <div>
            <label for="email">Date<span>*</span></label>
            <input type="text" name="attendance_date" id="attendance_date" value="<% out.print(Values.get("attendance_date")); %>" size="22" style="width:300px;" required readonly>
          </div>
          <div>
            <label for="email">In Time<span>*</span></label>
            <input type="text" name="attendance_in_time" id="attendance_in_time" value="<% out.print(Values.get("attendance_in_time")); %>" size="22" style="width:300px;" required>
          </div>
		  <div>
            <label for="email">Out Time<span>*</span></label>
            <input type="text" name="attendance_out_time" id="attendance_out_time" value="<% out.print(Values.get("attendance_out_time")); %>" size="22" style="width:300px;" required>
          </div>
          <div class="block clear"></div>
          <div>
            <input name="submit" type="submit" value="Save Attendance">
            &nbsp;
            <input name="reset" type="reset" value="Reset Form">
          </div>
		  <input type="hidden" name="act" value="Save" />
		  <input type="hidden" name="emp_id" value="<%=session.getAttribute("login_emp_id")%>"/>
		  <input type="hidden" name="attendance_id" value="<% out.print(Values.get("attendance_id")); %>"/>
        </form>
        </div>
        <div style="float: left">
        	<div><img src="images/save_1.jpg" style="width: 250px"></div><br>
        </div>
      <div class="clear"></div>
    </main>
  </div>
</div>
<%@ include file="includes/footer.jsp" %>
