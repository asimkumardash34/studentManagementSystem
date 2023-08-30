<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Fees feesDetails = new Fees();
	Student studentDetails = new Student();
	int fees_id = Integer.parseInt(request.getParameter ("fees_id"));
	HashMap Values =  feesDetails.getFeesDetails(fees_id);
%>
<script>
  jQuery(function() {
    jQuery( "#fees_date" ).datepicker({
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
      <h2>Student Fees Payment</h2>
        <form action="model/fees.jsp" method="post" id="Form">
		  <div>
             <label for="email">Select Student Roll Number : <span>*</span></label>
            <select style="height: 40px; width:300px" name ="fees_student_id" required>
				<% out.print(studentDetails.getStudentsOption((Integer) Values.get("fees_student_id"))); %>
            </select>
          </div>
          <div>
            <label for="email">Fees For Month<span>*</span></label>
            <select style="height: 40px; width:300px" name ="fees_month" required>
				<% out.print(feesDetails.getMonthOption((Integer) Values.get("fees_month"))); %>
            </select>
          </div>
		  <div>
            <label for="email">Fees Amount<span>*</span></label>
            <input type="text" name="fees_amount" id="fees_amount" value="<% out.print(Values.get("fees_amount")); %>" size="22" style="width:300px;" required>
          </div>
          <div>
            <label for="email">Receive Date<span>*</span></label>
            <input type="text" name="fees_date" id="fees_date" value="<% out.print(Values.get("fees_date")); %>" size="22" style="width:300px;" required readonly>
          </div>
          <div class="block clear"></div>
          <div>
            <input name="submit" type="submit" value="Save Fees">
            &nbsp;
            <input name="reset" type="reset" value="Reset Form">
          </div>
		  <input type="hidden" name="act" value="Save" />
		  <input type="hidden" name="fees_id" value="<% out.print(Values.get("fees_id")); %>"/>
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
