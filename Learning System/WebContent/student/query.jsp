<%@page import="db.DbConfig"%>
<%@page import="java.util.Map"%>
<jsp:include flush="true" page="header.jsp" />
<div class="card shadow" style="min-height: 88vh;">
	<div class="card-body">
		<h5 class="p-2" style="border-bottom: 2px solid green;">Student
			Announcement</h5>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-8">
					<table class="table table-bordered table-striped table-sm">
						<thead>
							<tr>
								<th>Msg ID</th>
								<th>Message</th>
								<th>Message Date</th>
								<th>Operation</th>
							</tr>
						</thead>
						<tbody>

							<% 
                    String rollno=session.getAttribute("id").toString();
                    for(Map<String,String> map : DbConfig.findall("queries", "rollno="+rollno)) { %>
							<tr>
								<td><%= map.get("qid") %></td>
								<td><%= map.get("msg") %></td>
								<td><%= map.get("mdate") %></td>
								<td><a href="../DelQuery?qid=<%= map.get("qid") %>"
									class="btn btn-danger btn-sm">Delete</a></td>
							</tr>
							<% } %>
						</tbody>
					</table>
				</div>
				<div class="col-sm-4">
					<form action="../Query" method="post">
						<div class="form-group">
							<label>Your Query</label>
							<textarea name="msg" class="form-control" rows="4"></textarea>
						</div>
						<button class="btn btn-danger">Submit Query</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include flush="true" page="footer.jsp" />