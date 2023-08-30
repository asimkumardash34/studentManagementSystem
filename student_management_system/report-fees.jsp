<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>

<%
	Fees feesDetails = new Fees();
	ArrayList allFees = feesDetails.getAllFees(request.getParameter ("student_id"));
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>Fees Report</h2>
		<% if(request.getParameter("msg") != null) { %>
		<div class="msg"><%=request.getParameter("msg") %></div>
		<% } %>
        <table>
          <thead>
            <tr>
			  <th>Sr. No.</th>
              <th>Roll Number</th>
              <th>Name</th>
              <th>Fees For Month</th>
              <th>Fees Amount</th>
              <th>Paid Date</th>
            </tr>
          </thead>
          <tbody>
			<% for(int i=0;i<allFees.size();i++) 
			{ 
				HashMap FeesDetails = new HashMap();
				FeesDetails = (HashMap)allFees.get(i);
				String month = feesDetails.getOptionValue("month","month_name","month_id",(Integer) FeesDetails.get("fees_month"));
			%>
				<tr>
				  <td style="text-align:center;"><% out.print(i+1); %></td>
				  <td><% out.print(FeesDetails.get("fees_student_id")); %></td>
				  <td><% out.print(FeesDetails.get("student_name")); %></td>
				  <td><% out.print(month); %></td>
				  <td><% out.print(FeesDetails.get("fees_amount")); %></td>
				  <td><% out.print(FeesDetails.get("fees_date")); %></td>
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
