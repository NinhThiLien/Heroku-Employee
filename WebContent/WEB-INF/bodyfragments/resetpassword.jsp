<div>
    	<div class="col-md-6 col-md-offset-3">
			<div class="panel panel-login">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-6">
							<h3>Forget Password</h3>
						</div>
					</div>
					<hr>
				</div>
				<div align="center">
    				<br/>
    				<h3><%String messageError = (String)request.getAttribute("messageError"); %></h3>
    				<br/>
				</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-12">
    					<form accept-charset="UTF-8" action="sendEmail" id="resetForm" method="post">
    					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
      						<fieldset>
        						<span class="help-block">
          							Email address you use to log in to your account
          							<br>
          							We'll send you an email with instructions to choose a new password.
        						</span>
        						<div class="form-group input-group">
          							<span class="input-group-addon">@</span>
          							<input class="form-control" placeholder="Email" name="email" type="text" value= "${email}">
        						</div>
        						<button type="submit" class="btn btn-primary">Continue</button>
        						<p class="help-block">
          							<a class="text-muted" href="${pageContext.request.contextPath}/login"><small>Login Now</small></a>
        						</p>
      						</fieldset>
    					</form>
    				</div>
    			</div>
    		</div>
  		</div>
  	</div>
</div>

<script type="text/javascript">
	if("<%=messageError%>" != "null"){
		var msg = "<%=messageError%>";
		alert(msg);
	}
	
	$(document).ready(function() {
		$("#resetForm").validate({
			rules: {
				email: {
					required: true,
					emai: true
				}
			},
			
			messages: {
				email: {
					required: "Please enter email",
					email: "Please enter a valid email address"
				}
			}
		});
	});
</script>