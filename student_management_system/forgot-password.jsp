<%@ include file="includes/header.jsp" %>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width:50%; margin:auto">
      <div align="center" style="color:#FF0000"><% if(request.getParameter("msg")!=null) out.print(request.getParameter("msg")); %></div><br />
      <h2>Forgot Password Form</h2>
        <form action="#" method="post" id="Form">
          <div>
            <label for="name">Username <span>*</span></label>
            <input type="text" name="name" id="name" value="" size="22" required>
          </div>
          <div>
            <label for="email">Regitered Email ID <span>*</span></label>
            <input type="text" name="email" id="email" value="" size="22"required>
          </div>
          <div>
            <input name="submit" type="submit" value="Reset Password">
            &nbsp;
            <input name="reset" type="reset" value="Cancel">
          </div>
          <input type="hidden" name="msg" value="We have sent you the reset password link on your Email ID. ">
        </form>
        </div>
      <div class="clear"></div>
    </main>
  </div>
</div>
<%@ include file="includes/footer.jsp" %>
