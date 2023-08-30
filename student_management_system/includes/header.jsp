<html>
<head>
<title>Student Management System</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<link rel="stylesheet" href="css/jquery-ui.css">
<script src="js/jquery-1.10.2.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/jquery.validate.js"></script>
<style>
.ui-datepicker {
	font-family: "Trebuchet MS", "Helvetica", "Arial",  "Verdana", "sans-serif";
	font-size: 12px;
}
.ui-datepicker select.ui-datepicker-month, .ui-datepicker select.ui-datepicker-year {
	float:left;
}
</style>
<script>
var specialKeys = new Array();
specialKeys.push(8); //Backspace
function IsNumeric(e) {
	var keyCode = e.which ? e.which : e.keyCode
	var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1);
	document.getElementById("error").style.display = ret ? "none" : "inline";
	return ret;
}
$('document').ready(function() {
	$("#Form").validate();
});
</script>
</head>
<body id="top">
<div class="wrapper row0">
  <div id="topbar" class="clear"> 
    <nav>
      <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="about-us.jsp">About Us</a></li>
        <li><a href="contact-us.jsp">Contact Us</a></li>
        <li><a href="student.jsp?student_id=0">Register</a></li>
		<% if(session.getAttribute("login_id")!=null) { %>
        <li><a href="model/login.jsp?act=logout">Logout</a></li>
		<% } else { %>
	<li><a href="login.jsp">Login</a></li>
		<% } %>
      </ul>
    </nav>
  </div>
</div>
<div class="wrapper row1">
  <header id="header" class="clear"> 
    <div id="logo" class="fl_left">
      <h1 style="font-size:30px;"><a href="index.jsp">Student Management System</a></h1>
      <p style="text-transform: capitalize;">Manage Students, Fees, Attendance Online</p>
    </div>
    <div class="fl_right">
      <form class="clear" method="post" action="#">
        <fieldset>
          <legend>Search:</legend>
          <input type="text" value="" placeholder="Search Here">
          <button class="fa fa-search" type="submit" title="Search"><em>Search</em></button>
        </fieldset>
      </form>
    </div>
  </header>
</div>
<div class="wrapper row2">
  <div class="rounded">
    <nav id="mainav" class="clear"> 
      <ul class="clear">
        <li class="active"><a href="index.jsp">Home</a></li>
        <li><a href="about-us.jsp">About Us</a></li>
        <% if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("1")) { %>
		 <li><a href="#" class="drop" >New Entry</a>
          <ul>
            <li><a href="student.jsp?student_id=0">Add Student</a></li>
            <li><a href="fees.jsp?fees_id=0">Add Fees</a></li>
            <li><a href="attendance.jsp?attendance_id=0">Add Attandance</a></li>
          </ul>
         </li>
         <li><a href="#" class="drop" >Reports</a>
         <ul>
            <li><a href="report-student.jsp">Students Report</a></li>
            <li><a href="report-fees.jsp?student_id=0">Fees Report</a></li>
            <li><a href="report-attendance.jsp?student_id=0">Attendace Report</a></li>
          </ul>
        </li>
		<% } %>
		
		<% if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("3")) { %>		
		<li><a href="report-fees.jsp?student_id=<%=session.getAttribute("login_emp_id")%>">Fees Report</a></li>
		<li><a href="report-attendance.jsp?student_id=<%=session.getAttribute("login_emp_id")%>">Attendace</a></li>
		<li><a href="student.jsp?student_id=<%=session.getAttribute("login_emp_id")%>">My Account</a></li>
		<% } %>
		
		<% if(session.getAttribute("login_level") == null) { %>
			<li><a href="student.jsp?student_id=0">Student Registration</a></li>
			<li><a href="login.jsp?title=Student">Student Login</a></li>
			<li><a href="login.jsp?title=Adminstrator ">Administrator Login</a></li>
		<% } %>
		<% if(session.getAttribute("login_level") != null) { %>
		<li><a href="change-password.jsp">Change Password</a></li>
		<% } %>
        <li><a href="contact-us.jsp">Contact Us</a></li>
		<% if(session.getAttribute("login_level") != null) { %>
		<li><a href="model/login.jsp?act=logout">Logout</a></li>
		<% } %>
      </ul>
    </nav>
  </div>
</div>
