<jsp:include flush="true" page="header.jsp" />
<script>
    $(function(){
        $("#role").change(function(){
            if(this.value==="student"){
               $("#id").attr({"placeholder":"Enter roll no"}); 
            }else if(this.value==="lecturer"){
               $("#id").attr({"placeholder":"Enter teacher id"});  
            }else{
               $("#id").attr({"placeholder":"First Select role"});  
            }
        });
        $("#cpwd").blur(function(){
           if(this.value !== $("#pwd").val()){
               $("#error2").html("Password not match");
               $("#error2").removeClass("d-none");
           }else{
               $("#error2").addClass("d-none");
           } 
        });
        $("#id").blur(function(){
           $.ajax({
               url:'Verify',
               data:{'role':$("#role").val(),'id':this.value},
               method:'post',
               success:function(output){
                   if(output==="Invalid"){
                       $("#error").html("Invalid ID given");
                       $("#error").removeClass("d-none");
                   }else{
                        $("#uname").val(output);
                        $("#error").addClass("d-none");
                    }
               }
           }); 
        });
    });
</script>
<div class="jumbotron p-3 mb-0 text-center text-white rounded-0"
	style="background-color: #05366f; border-bottom: 1px solid white;">
	<h3>Welcome to Online Learning System</h3>
	<h4>Login Page</h4>
</div>
<div class="container" style="min-height: calc(100vh - 126px - 24px);">

	<div class="row">
		<div class="col-sm-5 mt-5 mx-auto card p-4 shadow"
			style="background-color: #7fc6ec5c;">
			
			<form action="Validate" method="post">
				<div class="form-group">
					<label>User ID</label> <input type="text" required name="userid"
						class="form-control form-control-sm">
				</div>
				<div class="form-group">
					<label>Password</label> <input type="password" required name="pwd"
						class="form-control form-control-sm">
				</div>
				<div class="form-group">
					<label>Select Role</label> <select name="role" required
						class="form-control form-control-sm">
						<option value=""><-- Select Role --></option>
						<option value="admin">Coordinator</option>
						<option value="lecturer">Lecturer</option>
						<option value="student">Student</option>
					</select>
				</div>
				Not Registered
				<button type="button" data-target="#reg" data-toggle="modal"
					class="btn btn-link">Click here to register</button>
				<button class="btn btn-primary"><a href="index.html" style="color:white; text-decoration: none;">Home</a></button>
				<button class="btn btn-primary float-right">Login</button>
			</form>
			<%
  if(session.getAttribute("msg")!=null){
      %>
			<div class="alert text-success mt-2 text-center font-weight-bold">
				<%= session.getAttribute("msg") %>
			</div>
			<%
          session.removeAttribute("msg");
  }
  %>
		</div>
		<div class="modal" id="reg">
			<div class="modal-dialog">
				<div class="modal-content">
					<form action="Register" method="post">
						<div class="modal-header">
							<h5>Register Now</h5>
							<button class="close" data-dismiss="modal" type="button">&times;</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<select id="role" name="role" required
									class="form-control form-control-sm">
									<option value=""><-- Select Role --></option>
									<option value="lecturer">Lecturer</option>
									<option value="student">Student</option>
								</select>
							</div>
							<div class="form-group">
								<input type="text" id="id" placeholder="First Select role"
									name="id" required class="form-control form-control-sm">
							</div>
							<div id="error"
								class="text-danger font-weight-bold text-center d-none"></div>
							<div class="form-group">
								<input type="text" placeholder="User Name" readonly id="uname"
									name="uname" class="form-control form-control-sm">
							</div>
							<div class="form-group">
								<input type="text" required placeholder="User ID" name="userid"
									class="form-control form-control-sm">
							</div>

							<div class="form-group">
								<input id="pwd" required type="password" placeholder="Password"
									name="pwd" class="form-control form-control-sm">
							</div>
							<div class="form-group">
								<input id="cpwd" required type="password" placeholder="Repeat Password"
									name="cpwd" class="form-control form-control-sm">
							</div>
							<div id="error2"
								class="text-danger font-weight-bold text-center d-none"></div>
						</div>
						<div class="modal-footer">
							<button class="btn btn-success float-right">Register</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include flush="true" page="footer.jsp" />