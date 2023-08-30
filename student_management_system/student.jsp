<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Student studentDetails = new Student();
	int student_id = Integer.parseInt(request.getParameter ("student_id"));
	String male = "";
	String female = "";
	HashMap Values =  studentDetails.getStudentDetails(student_id);
	if(Values.get("student_gender").equals("Male"))
	{
		male = "Selected";
	}
	else if(Values.get("student_gender").equals("Female"))
	{
		female = "Selected";
	}
%>
<script>
  jQuery(function() {
    jQuery( "#student_dob" ).datepicker({
      changeMonth: true,
      changeYear: true,
       yearRange: "-50:-16",
       dateFormat: 'd MM,yy'
    });
  });
</script>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Student Registration Form</h2>
	  <% if(request.getParameter("msg") != null) { %>
		<div class="msg"><%=request.getParameter("msg") %></div>
		<% } %>
        <form action="model/student.jsp" method="post" id="Form">
       	  <div class="one_third first">
            <label for="email">Salution <span>*</span></label>
            <select style="height: 40px; width:200px" name="student_sal" required>
            	<% out.print(studentDetails.getSalutionOption((Integer) Values.get("student_sal"))); %>
            </select>
          </div>
	  <div class="one_third">
            <label for="email">Category<span>*</span></label>
            <select style="height: 40px; width:200px" name= "student_status" id = "student_status" required>
			<% out.print(studentDetails.getStatusOption((Integer) Values.get("student_status"))); %>
			</select>
          </div>
	  <div class="one_third">
            <label for="email">Father Employement Status<span>*</span></label>
            <select style="height: 40px; width:200px" name = "student_deparment" id = "student_deparment" required>
		<% out.print(studentDetails.getDepartmentOption((Integer) Values.get("student_deparment"))); %>
	    </select>
          </div>
          <div class="one_third first">
            <label for="email">First Name <span>*</span></label>
            <input type="text" name="student_first_name" id="student_first_name" value="<% out.print(Values.get("student_first_name")); %>" size="22" required>
          </div>
          <div class="one_third">
            <label for="email">Middle Name <span>*</span></label>
            <input type="text" name="student_middle_name" id="student_middle_name" value="<% out.print(Values.get("student_middle_name")); %>" size="22" required>
          </div>
          <div class="one_third">
            <label for="url">Last Name</label>
            <input type="text" name="student_last_name" id="student_last_name" value="<% out.print(Values.get("student_last_name")); %>" size="22" required>
          </div>
          <div  class="one_third first">
            <label for="url">Gender</label>
            <select style="height: 40px; width:200px" name="student_gender" required>
				<option value="">Please Select</option>
            	<option value="Male" <% out.print(male); %>>Male</option>
            	<option value="Female" <% out.print(female); %>>Female</option>
            </select>
          </div>

	  <div class="one_third">
            <label for="url">Date of Birth</label>
			<input type="text" name="student_dob" id="student_dob" value="<% out.print(Values.get("student_dob")); %>" size="22" required>
          </div>
          <div class="one_third">
            <label for="url">Nationality</label>
            <input type="text" name="student_nationalty" id="student_nationalty" value="<% out.print(Values.get("student_nationalty")); %>" size="22" required>
          </div>
          
	  <div class="one_third first">
            <label for="url">E-mail</label>
            <input type="text" name="student_email" id="student_email" value="<% out.print(Values.get("student_email")); %>" size="22" required>
          </div>
	  <div class="one_third">
            <label for="url">Landline</label>
            <input type="text" name="student_landline" id="student_landline" value="<% out.print(Values.get("student_landline")); %>" size="22" required>
          </div>
          <div class="one_third">
            <label for="url">Mobile</label>
            <input type="text" name="student_mobile" id="student_mobile" value="<% out.print(Values.get("student_mobile")); %>" size="22" required onkeypress="return IsNumeric(event);"  maxlength="10">
            <span id="error" style="color: Red; display: none">* Input digits (0 - 9)</span>
          </div>
          
	  <div style="clear:both"></div>
          <h4>Student Address Details</h4>
          <div class="one_third first">
            <label for="url">Address</label>
            <input type="text" name="student_address" id="student_address" value="<% out.print(Values.get("student_address")); %>" size="22" required>
          </div>
          <div class="one_third">
            <label for="url">Village/City/Town</label>
            <input type="text" name="student_village" id="student_village" value="<% out.print(Values.get("student_village")); %>" size="22" required>	
          </div>
          <div class="one_third">
            <label for="url">State</label>
            <select style="height: 40px; width:200px" name="student_state" required>
				<% out.print(studentDetails.getStateOption((Integer) Values.get("student_state"))); %>
            </select>
          </div>
          <div class="one_third first">
            <label for="url">Country</label>
            <select style="height: 40px; width:200px" name="student_country" required>
				<% out.print(studentDetails.getCountryOption((Integer) Values.get("student_country"))); %>
            </select>
          </div>
          <div class="block clear"></div>
		  <% if(student_id == 0) { %>
          <h4>Student Login Details</h4>
          <div class="one_third first">
            <label for="url">Username</label>
            <input type="text" name="student_user" id="student_user" value="<% out.print(Values.get("student_user")); %>" size="22">
          </div>
          
          <div class="one_third">
            <label for="url">Password</label>
            <input type="password" name="student_password" id="student_password" value="" size="22">
          </div>
          
          <div class="one_third ">
            <label for="url">Confirm Password</label>
            <input type="password" name="student_confirm_password" id="student_confirm_password" value="" size="22">
          </div>
		  <% } %>
          <div class="block clear"></div>
          <div>
            <input name="submit" type="submit" value="Save Form">
            &nbsp;
            <input name="reset" type="reset" value="Reset Form">
          </div>
		  <input type="hidden" name="act" value="Save" />
		  <input type="hidden" name="student_id" value="<% out.print(Values.get("student_id")); %>"/>
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
