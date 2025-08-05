<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="connect.jsp"%>

<%
// Check if the user is logged in
if (session.getAttribute("userName") == null) {
	response.sendRedirect("Login.jsp"); // Redirect to login page if not logged in
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Login - My WebApp</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Auto-refresh every 5 seconds -->
<meta http-equiv="refresh" content="5">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	font-family: 'Segoe UI', sans-serif;
	background-color: #f8f9fa;
}

.form-container {
	margin-top: 80px;
	max-width: 400px;
	padding: 30px;
	background-color: white;
	border-radius: 12px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
}

.hero {
	background: url('images/banner.jpg') no-repeat center center/cover;
	color: white;
	height: 10vh;
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: center;
}

.hero h1 {
	font-size: 3rem;
	font-weight: bold;
}

@media ( max-width : 768px) {
	.hero h1 {
		font-size: 2rem;
	}
}

.about {
	padding: 100px 20px;
}

footer {
	background-color: #343a40;
	color: white;
	padding: 20px 0;
}
</style>
</head>
<body>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<%@include file="ProjectName.jsp"%>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>

			</button>
			<!-- Login Session Name Div -->
			<%
			if (session.getAttribute("userName") != null) {
			%>
			<div class="ms-3 text-white">
				<strong style="color: green;">Login: <%=session.getAttribute("userName")%></strong>
			</div>
			<%
			}
			%>
			<div class="collapse navbar-collapse justify-content-end"
				id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active"
						href="User-Home.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="Chat.jsp">Chat</a></li>
					<li class="nav-item"><a class="nav-link" href="Logout.jsp">Logout</a></li>
				</ul>

			</div>
		</div>
	</nav>
	<div class="container-fluid">
		<div class="row">
			<!-- Sidebar -->
			<nav id="sidebarMenu"
				class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse"
				style="min-height: 100vh;">
				<div class="position-sticky pt-3">
					<ul class="nav flex-column nav-pills" id="sidebar-tabs"
						role="tablist">
						<li class="nav-item" role="presentation">
							<button class="nav-link active" id="online-users-tab"
								data-bs-toggle="pill" data-bs-target="#online-users"
								type="button" role="tab" aria-controls="online-users"
								aria-selected="true">Online Users</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="friends-tab" data-bs-toggle="pill"
								data-bs-target="#friends" type="button" role="tab"
								aria-controls="friends" aria-selected="false">Friends Request</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="friends-list-tab" data-bs-toggle="pill"
								data-bs-target="#friends-list" type="button" role="tab"
								aria-controls="friends-list" aria-selected="false">Friends List</button>
						</li>
					</ul>
				</div>
			</nav>

			<!-- Main Content -->
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<div class="tab-content" id="sidebar-tabs-content">
					<div class="tab-pane fade show active" id="online-users"
						role="tabpanel" aria-labelledby="online-users-tab">
						<!-- Online Users Section (moved here) -->
						<div class="about container text-center">
							<div class="card mx-auto mb-4" style="max-width: 450px;">
								<div class="card-body">
									<h5 class="card-title">Online Users</h5>
									<div class="table-responsive">
										<table class="table table-striped table-hover mb-0">
											<thead class="table-light">
												<tr>
													<th scope="col">#</th>
													<th scope="col">Username</th>
													<th scope="col">Status</th>
													<th scope="col">Send Friend Request</th>
												</tr>
											</thead>
											<tbody>
												<%-- Example dynamic data, replace with actual user list from database --%>
												<%
												ResultSet rs = getUsers(Integer.parseInt(session.getAttribute("userId").toString()));
												int count = 1;
												while (rs.next()) {
													String username = rs.getString("first_name") + " " + rs.getString("last_name");
													String status = rs.getString("status");
												%>
												<!-- Example static data, replace with dynamic user list -->
												<tr>
													<th scope="row"><%=count%></th>
													<td><%=username%></td>

													<%
													if (status.equals("Online")) {
													%>
													<td><span class="badge bg-success"><%=status%></span></td>
													<%
													} else {
													%>
													<td><span class="badge bg-danger"><%=status%></span></td>
													<%
													}
													%>




													<td><a
														href="Friends_Request.jsp?receiverId=<%=rs.getInt("id")%>"><span
															class="badge bg-success">Send</span></a></td>
												</tr>

												<%
												count++;
												}
												%>

												<!-- End example -->
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="friends" role="tabpanel"
						aria-labelledby="friends-tab">
						<!-- Friends Section (placeholder) -->
						<div class="about container text-center">
							<div class="card mx-auto mb-4" style="max-width: 450px;">
								<div class="card-body">
									<h5 class="card-title">Friends</h5>
									<div class="card-body">
										<h5 class="card-title">Users Request</h5>
										<div class="table-responsive">
											<table class="table table-striped table-hover mb-0">
												<thead class="table-light">
													<tr>
														<th scope="col">#</th>
														<th scope="col">UserName</th>
														<th scope="col">Accept</th>
														<th scope="col">Reject</th>
													</tr>
												</thead>
												<tbody>
													<%-- Example dynamic data, replace with actual user list from database --%>
													<%
													// Example: Fetch online users from the database
													String friend_requests = "SELECT * FROM friend_requests where receiver_id="+Integer.parseInt(session.getAttribute("userId").toString());
													ResultSet rs_friend_requests = getConnection().prepareStatement(friend_requests).executeQuery();
													int count_friend_requests = 1;
													while (rs_friend_requests.next()) {
														
														ResultSet rs1 = getUser(rs_friend_requests.getInt("sender_id"));
														rs1.next();
														String username = rs1.getString("first_name") + " " + rs1.getString("last_name");
														String status = rs_friend_requests.getString("status");
													%>
													<!-- Example static data, replace with dynamic user list -->
													<tr>
														<th scope="row"><%=count_friend_requests%></th>
														<td><%=username%></td>

														<%
														if (status.equals("Pending")) {
														%>
															<td><a href="Friends_Request_Accept.jsp?id=<%=rs_friend_requests.getInt("id")%>"><span
																class="badge bg-danger">Accept</span></a></td>
														<%
														} else {
														%>
														<td><span class="badge bg-success">Accepted</span></td>
														<%
														}
														%>


														<td><a href="Friends_Request.jsp?receiverId=<%=rs_friend_requests.getInt("id")%>"><span
																class="badge bg-danger">Reject</span></a></td>
													</tr>

													<%
													count_friend_requests++;
													}
													%>

													<!-- End example -->
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				    <div class="tab-pane fade" id="friends-list" role="tabpanel"
						aria-labelledby="friends-tab">
						<!-- Friends Section (placeholder) -->
						<div class="about container text-center">
							<div class="card mx-auto mb-4" style="max-width: 450px;">
								<div class="card-body">
									<h5 class="card-title">Friends</h5>
									<div class="card-body">
									
										<div class="table-responsive">
											<table class="table table-striped table-hover mb-0">
												<thead class="table-light">
													<tr>
														<th scope="col">#</th>
														<th scope="col">UserName</th>
													
														<th scope="col">Message</th>
													</tr>
												</thead>
												<tbody>
												
												<%
												
												String friends_list = "SELECT * FROM friend_requests where (sender_id="+Integer.parseInt(session.getAttribute("userId").toString())+" or receiver_id="+Integer.parseInt(session.getAttribute("userId").toString())+") and status='Accepted'";
												ResultSet rs_friend_requests_list = getConnection().prepareStatement(friend_requests).executeQuery();
												int count_friend_requests_list = 1;
												while(rs_friend_requests_list.next()) {
                                                    
                                                    int friendId = rs_friend_requests_list.getInt("sender_id") == Integer.parseInt(session.getAttribute("userId").toString()) ? rs_friend_requests_list.getInt("receiver_id") : rs_friend_requests_list.getInt("sender_id");
                                                    ResultSet rs1 = getUser(friendId);
                                                    rs1.next();
                                                    String username = rs1.getString("first_name") + " " + rs1.getString("last_name");
                                                    String status = rs1.getString("status");
                                                    %>
													<!-- Example static data, replace with dynamic user list -->
													<tr>
														<th scope="row"><%=count_friend_requests_list%></th>
														<td><%=username%></td>
														
														<%
														
														if (status.equals("Online")) {
															%>
															
															<td><a href="Friends_Chat.jsp?id=<%=rs_friend_requests_list.getInt("id")%>"><span
																	class="badge bg-success">Start to chat</span></a></td>
															<%
														}else{
															%>
															
															<td><a href="Friends_Chat.jsp?id=<%=rs_friend_requests_list.getInt("id")%>"><span
																	class="badge bg-danger">Start to chat</span></a></td>
															
															<%
														}
														
														
														count_friend_requests_list++;
												
												}
												
												%>
												
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
		</div>
		</main>
	</div>
	</div>

	<!-- Footer -->
	<footer class="text-center">
		<div class="container">&copy; 2025 Chat Apps | All rights
			reserved.</div>
	</footer>
	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
// Save active tab to localStorage on click
const tabButtons = document.querySelectorAll('#sidebar-tabs button[data-bs-toggle="pill"]');
tabButtons.forEach(btn => {
  btn.addEventListener('shown.bs.tab', function (event) {
    localStorage.setItem('activeTab', event.target.id);
  });
});
// Restore active tab from localStorage on page load
window.addEventListener('DOMContentLoaded', function () {
  const activeTab = localStorage.getItem('activeTab');
  if (activeTab) {
    const tabTrigger = document.getElementById(activeTab);
    if (tabTrigger) {
      const tab = new bootstrap.Tab(tabTrigger);
      tab.show();
    }
  }
});
</script>

</body>
</html>

<%!
public ResultSet getUser(int userId) throws SQLException {
		String query = "SELECT * FROM users WHERE id=" + userId;
		PreparedStatement ps = getConnection().prepareStatement(query);
		return ps.executeQuery();
	}

public ResultSet getUsers(int userId) throws SQLException {
	String query = "SELECT * FROM users WHERE id!=" + userId;
	PreparedStatement ps = getConnection().prepareStatement(query);
	return ps.executeQuery();
}
%>