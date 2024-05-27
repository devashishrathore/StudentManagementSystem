<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="sms.persistance.DatabaseConnection"%>

<!DOCTYPE HTML>
<html>
<head>
<title>Student Management System</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<!-- Title icon image -->
<link rel="icon" href="images/title-image.png" type="image/png"
	sizes="16x16">
</head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Add Student -->
		<article id="addStudent">
			<h2 class="major">Update Students</h2>
			<!-- <span class="image main"><img src="images/addNewStudent.png" alt="" /></span> -->
			<%
			int stId = Integer.parseInt(request.getParameter("id"));
			if (stId == 0) {
				System.out.println("Id is null");
			} else {
				System.out.println(stId);
			}
			String stName = null;
			String stContact = null;
			String stFees = null;
			String stLocation = null;
			String stQualification = null;
			String stExperience = null;
			String stGroup = null;
			String stMockScore = null;
			Connection connect = DatabaseConnection.DbConnection();
			PreparedStatement st = connect.prepareStatement("select * from students where id = ?");
			st.setInt(1, stId);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				int id = rs.getInt(1);
				stName = rs.getString(2);
				stContact = rs.getString(3);
				stFees = rs.getString(4);
				stLocation = rs.getString(5);
				stQualification = rs.getString(6);
				stExperience = rs.getString(7);
				stGroup = rs.getString(8);
				stMockScore = rs.getString(9);
			}
			%>
			<form action="Update" method="post">
				<div class="fields">
					<div class="field half">
						<label for="name">Full Name</label> <input type="text" name="name"
							id="name" value="<%out.print(stName);%>" required />
					</div>
					<div class="field half">
						<label for="mobile">Mobile Number</label> <input type="tel"
							name="mobile" value="<%out.print(stContact);%>"
							id="mobileNumber" maxlength=10 required />
					</div>
					<div class="field half">
						<label for="fees">Fees</label> <input type="text" name="fees"
							value="<%out.print(stFees);%>" id="fees" required />
					</div>
					<div class="field half">
						<label for="location">Location</label> <input type="text"
							name="location" value="<%out.print(stLocation);%>" id="name"
							required />
					</div>
					<div class="field half">
						<label for="qualification">Highest Qualification</label> <input
							type="text" name="highestQualification"
							value="<%out.print(stQualification);%>" id="name" required />
					</div>
					<div class="field half">
						<label for="exprience">Previous Experience</label> <input
							type="text" name="previousExperience"
							value="<%out.print(stExperience);%>" id="name" required />
					</div>
					<div class="field half">
						<label for="group">Group</label> <select name="group" id="group"
							required>
							<option>
								<%
								out.print(stGroup);
								%>
							</option>
							<option>Group 1</option>
							<option>Group 2</option>
							<option>Group 3</option>
							<option>Group 4</option>
							<option>Group 5</option>
							<option>Group 6</option>
						</select>
					</div>
					<div class="field half">
						<label for="mockScore">Mock Score</label> <select name="mockScore"
							id="group" required>
							<option>
								<%
								out.print(stMockScore);
								%>
							</option>
							<option>Not Attended Mock</option>
							<option>Score 1/10</option>
							<option>Score 2/10</option>
							<option>Score 3/10</option>
							<option>Score 4/10</option>
							<option>Score 5/10</option>
							<option>Score 6/10</option>
							<option>Score 7/10</option>
							<option>Score 8/10</option>
							<option>Score 9/10</option>
							<option>Score 10/10</option>
						</select>
					</div>
				</div>
				<input type="hidden" name="id" value="<%out.print(stId);%>" />
				<button type="submit">Update</button>
			</form>
		</article>
	</div>
	<!-- Footer -->
	<footer id="footer">
		<p class="copyright">
			&copy; 2021-2024 Powerd by <a href="https://taskryt.com/">TASKRYT.COM</a>.
		</p>
	</footer>
	<!-- BG -->
	<div id="bg"></div>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>
