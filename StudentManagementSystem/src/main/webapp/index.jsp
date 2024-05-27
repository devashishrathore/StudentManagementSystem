<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="sms.persistance.DatabaseConnection"%>
<%@ page import="java.net.URLEncoder"%>

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

<style type="text/css">
/* first batch pagination */
.cd__main {
	display: block !important;
}

.hidden {
	display: none;
}

button {
	font-size: inherit;
	margin: 0 0.25em;
	padding: 0.25em 0.5em;
	background-color: #555;
	color: #fff;
	border: 0;
	transition: background-color 0.4s, color 0.4s;
}

button:hover {
	background-color: #bbb;
	color: #000;
}

.page-numbers {
	margin: 1em 1em 0;
}

.page-number {
	padding: 0.5em;
	opacity: 0.5;
	cursor: pointer;
}

.active {
	opacity: 1;
}

@media screen and (min-width: 540px) {
	.backward {
		order: 1;
	}
	.page-numbers {
		order: 2;
		margin-top: 0;
	}
	.forward {
		order: 3;
	}
}
/* second batch pagination */
div.pager {
	text-align: center;
	clear: both;
	margin-bottom: 20px;
	position: relative;
	top: auto;
	left: 43% bottom: 0;
}
</style>
</head>
<body class="is-preload">
	<!-- student update message -->
	<%
	if (session.getAttribute("updateSuccess") != null) {
		out.print("<script>alert('Student updated successfully')</script>");
	}
	session.removeAttribute("updateSuccess");
	%>
	<!-- student add message -->
	<%
	if (session.getAttribute("stAddedSuccess") != null) {
		out.print("<script>alert('Student added successfully')</script>");
	}
	session.removeAttribute("stAddedSuccess");
	%>
	<!-- student delete message -->
	<%
	if (session.getAttribute("deleteSuccess") != null) {
		out.print("<script>alert('Student deleted successfully')</script>");
	}
	session.removeAttribute("deleteSuccess");
	%>

	<!-- PROMOTION OF STUDENTS ALERTS -->
	<!-- student Promotion message -->
	<%
	if (session.getAttribute("thirdBatchPromotion") != null) {
		out.print("<script>alert('Studnet can't promote')</script>");
	}
	session.removeAttribute("thirdBatchPromotion");
	%>
	<!-- second batch promotion -->
	<%
	if (session.getAttribute("secondBatchPromotion") != null) {
		out.print("<script>alert('Student Promoted')</script>");
	}
	session.removeAttribute("secondBatchPromotion");
	%>
	<!-- first batch promotion -->
	<%
	if (session.getAttribute("firstBatchPromotion") != null) {
		out.print("<script>alert('Student Promoted')</script>");
	}
	session.removeAttribute("firstBatchPromotion");
	%>

	<!-- DEMOTION OF STUDENTS ALERTS -->
	<!-- student demotion message -->
	<%
	if (session.getAttribute("firstBatchDemotion") != null) {
		out.print("<script>alert('Studnet can't demote')</script>");
	}
	session.removeAttribute("firstBatchDemotion");
	%>
	<!-- second batch demotion -->
	<%
	if (session.getAttribute("secondBatchDemotion") != null) {
		out.print("<script>alert('Student Demoted')</script>");
	}
	session.removeAttribute("secondBatchDemotion");
	%>
	<!-- first batch demotion -->
	<%
	if (session.getAttribute("thirdBatchDemotion") != null) {
		out.print("<script>alert('Student Demoted')</script>");
	}
	session.removeAttribute("thirdBatchDemotion");
	%>

	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Header -->
		<header id="header">
			<div class="logo">
				<span class="icon fa-diamond"></span>
			</div>
			<div class="content">
				<div class="inner">
					<h1>STUDENT MANAGEMENT SYSTEM</h1>
					<p>"The more that you read, the more things you will know. The
						more that you learn, the more places you'll go."</p>
				</div>
			</div>
			<nav>
				<ul>
					<li><a href="#addStudent">Add Students</a></li>
					<li><a href="#allStudent">All Students</a></li>
					<li><a href="#firstBatch">First Batch</a></li>
					<li><a href="#secondBatch">Second Batch</a></li>
					<li><a href="#thirdBatch">Third Batch</a></li>
					<!-- <li><a href="#contact">Contact</a></li> -->
					<!-- <li><a href="#elements">Elements</a></li> -->
				</ul>
			</nav>
		</header>
		<!-- Main -->
		<div id="main">
			<!-- Add Student -->
			<article id="addStudent">
				<h2 class="major">Add Students</h2>
				<!-- <span class="image main"><img src="images/addNewStudent.png" alt="" /></span> -->

				<form action="AddStudent" method="post">
					<div class="fields">
						<div class="field half">
							<label for="name">Full Name</label> <input type="text"
								name="name" id="name" required />
						</div>
						<div class="field half">
							<label for="mobile">Mobile Number</label> <input type="tel"
								name="mobile" id="mobileNumber" maxlength=10 required />
						</div>
						<div class="field half">
							<label for="fees">Fees</label> <input type="text" name="fees"
								id="fees" required />
						</div>
						<div class="field half">
							<label for="location">Location</label> <input type="text"
								name="location" id="name" required />
						</div>
						<div class="field half">
							<label for="qualification">Highest Qualification</label> <input
								type="text" name="highestQualification" id="name" required />
						</div>
						<div class="field half">
							<label for="exprience">Previous Experience</label> <input
								type="text" name="previousExperience" id="name" required />
						</div>
						<div class="field half">
							<label for="group">Group</label> <select name="group" id="group"
								required>
								<option selected disabled>Choose Group</option>
								<option>Group 1</option>
								<option>Group 2</option>
								<option>Group 3</option>
								<option>Group 4</option>
								<option>Group 5</option>
								<option>Group 6</option>
							</select>
						</div>
						<div class="field half">
							<label for="mockScore">Mock Score</label> <select
								name="mockScore" id="group" required>
								<option selected disabled>Choose Score</option>
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
					<!-- <ul class="actions">
										<li><input type="submit" value="Add Student" class="primary" /></li>
									</ul> -->
					<button type="submit">Add</button>
				</form>
			</article>

			<!-- All Student -->
			<article id="allStudent">
				<h2 class="major">All Students</h2>
				<!-- <span class="image main"><img src="images/allStudents.png" alt="" /></span> -->
				<section>
					<div class="table-wrapper">
						<table class="alt" id="myTable">
							<thead>
								<tr>
									<th>S.No.</th>
									<th>Name</th>
									<th>Contact</th>
									<th>Fees</th>
									<th>Location</th>
									<th>Qualification</th>
									<th>Experience</th>
									<th>Group</th>
									<th>MockScore</th>
									<th colspan="4">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								try {
									Connection conn = DatabaseConnection.DbConnection();
									PreparedStatement ps = conn.prepareStatement("select * from students");
									ResultSet rs = ps.executeQuery();
									int sno = 1;
									while (rs.next()) {
										int id = rs.getInt(1);
										String stName = rs.getString(2);
										String stContact = rs.getString(3);
										String stFees = rs.getString(4);
										String stLocation = rs.getString(5);
										String stQualification = rs.getString(6);
										String stExperience = rs.getString(7);
										String stGroup = rs.getString(8);
										String stMockScore = rs.getString(9);

										out.print("<tr>");
										out.print("<td>" + sno + "</td>");
										out.print("<td>" + stName + "</td>");
										out.print("<td>" + stContact + "</td>");
										out.print("<td>" + stFees + "</td>");
										out.print("<td>" + stLocation + "</td>");
										out.print("<td>" + stQualification + "</td>");
										out.print("<td>" + stExperience + "</td>");
										out.print("<td>" + stGroup + "</td>");
										out.print("<td>" + stMockScore + "</td>");
										out.print("<td style='color:#49fc79;'><a href='#' onclick='confirmPromote(" + id + ")'>Promote</a></td>");
										out.print("<td style='color:yellow;'><a href='#' onclick='confirmDemote(" + id + ")'>Demote</a></td>");
										out.print("<td style='color:#727bfc;'><a href='update.jsp?id=" + id + "'>Update</a></td>");
										out.print("<td style='color:#fc9797;'><a href='#' onclick='confirmDelete(" + id + ")'>Delete</a></td>");
										out.print("</tr>");
										sno++;
									}
									out.print("<tr>");
									if (rs.next() == false && sno == 1) {
										out.print("<td style='color:#fc9797;'>No records found!</td>");
									}
									out.print("</tr>");
								} catch (Exception e) {
									System.out.println(e);
								}
								%>
							</tbody>
						</table>
						<!-- Start Pagination -->
					</div>
				</section>
			</article>

			<!-- First Batch -->
			<article id="firstBatch">
				<h2 class="major">First Batch Students</h2>
				<!-- <span class="image main"><img src="images/firstBatch.png" alt="" /></span> -->
				<section>
					<div class="table-wrapper">
						<table class="alt paginated">
							<thead>
								<tr>
									<th>S.No.</th>
									<th>Name</th>
									<th>Contact</th>
									<th>Fees</th>
									<th>Location</th>
									<th>Qualification</th>
									<th>Experience</th>
									<th>Group</th>
									<th>MockScore</th>
									<th colspan="4">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								try {
									Connection conn = DatabaseConnection.DbConnection();
									PreparedStatement ps = conn.prepareStatement("SELECT * FROM students WHERE groupname = ? OR groupname = ?");
									ps.setString(1, "Group 1");
									ps.setString(2, "Group 2");
									ResultSet rs = ps.executeQuery();
									int sno = 1;
									while (rs.next()) {
										int id = rs.getInt(1);
										String stName = rs.getString(2);
										String stContact = rs.getString(3);
										String stFees = rs.getString(4);
										String stLocation = rs.getString(5);
										String stQualification = rs.getString(6);
										String stExperience = rs.getString(7);
										String stGroup = rs.getString(8);
										String stMockScore = rs.getString(9);

										out.print("<tr>");
										out.print("<td>" + sno + "</td>");
										out.print("<td>" + stName + "</td>");
										out.print("<td>" + stContact + "</td>");
										out.print("<td>" + stFees + "</td>");
										out.print("<td>" + stLocation + "</td>");
										out.print("<td>" + stQualification + "</td>");
										out.print("<td>" + stExperience + "</td>");
										out.print("<td>" + stGroup + "</td>");
										out.print("<td>" + stMockScore + "</td>");
										out.print("<td style='color:#49fc79;'><a href='#' onclick='confirmPromote(" + id + ")'>Promote</a></td>");
										out.print("<td style='color:yellow;'><a href='#' onclick='confirmDemote(" + id + ")'>Demote</a></td>");
										out.print("<td style='color:#727bfc;'><a href='update.jsp?id=" + id + "'>Update</a></td>");
										out.print("<td style='color:#fc9797;'><a href='#' onclick='confirmDelete(" + id + ")'>Delete</a></td>");
										out.print("</tr>");
										sno++;
									}
									out.print("<tr>");
									if (rs.next() == false && sno == 1) {
										out.print("<td style='color:#fc9797;'>No records found!</td>");
									}
									out.print("</tr>");
								} catch (Exception e) {
									System.out.println(e);
								}
								%>
							</tbody>
						</table>
						<!-- pagination starts -->
						<div class="pagination"></div>
					</div>
				</section>
			</article>
			<!-- Testing -->
			<!-- Second Batch -->
			<article id="secondBatch">
				<h2 class="major">Second Batch Students</h2>
				<!-- <span class="image main"><img src="images/secondBatcch.png" alt="" /></span> -->
				<section>
					<div class="table-wrapper">
						<table class="alt paginated">
							<thead>
								<tr>
									<th>S.No.</th>
									<th>Name</th>
									<th>Contact</th>
									<th>Fees</th>
									<th>Location</th>
									<th>Qualification</th>
									<th>Experience</th>
									<th>Group</th>
									<th>MockScore</th>
									<th colspan="4">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								try {
									Connection conn = DatabaseConnection.DbConnection();
									PreparedStatement ps = conn.prepareStatement("SELECT * FROM students WHERE groupname = ? OR groupname = ?");
									ps.setString(1, "Group 3");
									ps.setString(2, "Group 4");
									ResultSet rs = ps.executeQuery();
									int sno = 1;
									while (rs.next()) {
										int id = rs.getInt(1);
										String stName = rs.getString(2);
										String stContact = rs.getString(3);
										String stFees = rs.getString(4);
										String stLocation = rs.getString(5);
										String stQualification = rs.getString(6);
										String stExperience = rs.getString(7);
										String stGroup = rs.getString(8);
										String stMockScore = rs.getString(9);

										out.print("<tr>");
										out.print("<td>" + sno + "</td>");
										out.print("<td>" + stName + "</td>");
										out.print("<td>" + stContact + "</td>");
										out.print("<td>" + stFees + "</td>");
										out.print("<td>" + stLocation + "</td>");
										out.print("<td>" + stQualification + "</td>");
										out.print("<td>" + stExperience + "</td>");
										out.print("<td>" + stGroup + "</td>");
										out.print("<td>" + stMockScore + "</td>");
										out.print("<td style='color:#49fc79;'><a href='#' onclick='confirmPromote(" + id + ")'>Promote</a></td>");
										out.print("<td style='color:yellow;'><a href='#' onclick='confirmDemote(" + id + ")'>Demote</a></td>");
										out.print("<td style='color:#727bfc;'><a href='update.jsp?id=" + id + "'>Update</a></td>");
										out.print("<td style='color:#fc9797;'><a href='#' onclick='confirmDelete(" + id + ")'>Delete</a></td>");
										out.print("</tr>");
										sno++;
									}
									out.print("<tr>");
									if (rs.next() == false && sno == 1) {
										out.print("<td style='color:#fc9797;'>No records found!</td>");
									}
									out.print("</tr>");
								} catch (Exception e) {
									System.out.println(e);
								}
								%>
							</tbody>
						</table>
						<!-- pagination starts -->
					</div>
				</section>
			</article>
			<!-- Third Batch -->
			<article id="thirdBatch">
				<h2 class="major">Third Batch Students</h2>
				<!-- <span class="image main"><img src="images/thirdBatch.png" alt="" /></span> -->
				<section>
					<div class="table-wrapper">
						<table class="alt paginated">
							<thead>
								<tr>
									<th>S.No.</th>
									<th>Name</th>
									<th>Contact</th>
									<th>Fees</th>
									<th>Location</th>
									<th>Qualification</th>
									<th>Experience</th>
									<th>Group</th>
									<th>MockScore</th>
									<th colspan="4">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								try {
									Connection conn = DatabaseConnection.DbConnection();
									PreparedStatement ps = conn.prepareStatement("SELECT * FROM students WHERE groupname = ? OR groupname = ?");
									ps.setString(1, "Group 5");
									ps.setString(2, "Group 6");
									ResultSet rs = ps.executeQuery();
									int sno = 1;
									while (rs.next()) {
										int id = rs.getInt(1);
										String stName = rs.getString(2);
										String stContact = rs.getString(3);
										String stFees = rs.getString(4);
										String stLocation = rs.getString(5);
										String stQualification = rs.getString(6);
										String stExperience = rs.getString(7);
										String stGroup = rs.getString(8);
										String stMockScore = rs.getString(9);

										out.print("<tr>");
										out.print("<td>" + sno + "</td>");
										out.print("<td>" + stName + "</td>");
										out.print("<td>" + stContact + "</td>");
										out.print("<td>" + stFees + "</td>");
										out.print("<td>" + stLocation + "</td>");
										out.print("<td>" + stQualification + "</td>");
										out.print("<td>" + stExperience + "</td>");
										out.print("<td>" + stGroup + "</td>");
										out.print("<td>" + stMockScore + "</td>");
										out.print("<td style='color:#49fc79;'><a href='#' onclick='confirmPromote(" + id + ")'>Promote</a></td>");
										out.print("<td style='color:yellow;'><a href='#' onclick='confirmDemote(" + id + ")'>Demote</a></td>");
										out.print("<td style='color:#727bfc;'><a href='update.jsp?id=" + id + "'>Update</a></td>");
										out.print("<td style='color:#fc9797;'><a href='#' onclick='confirmDelete(" + id + ")'>Delete</a></td>");
										out.print("</tr>");
										sno++;
									}
									out.print("<tr>");
									if (rs.next() == false && sno == 1) {
										out.print("<td style='color:#fc9797;'>No records found!</td>");
									}
									out.print("</tr>");
								} catch (Exception e) {
									System.out.println(e);
								}
								%>
							</tbody>
						</table>
						<!-- pagination starts -->
					</div>
				</section>
			</article>

			<!-- Contact -->
			<article id="contact">
				<h2 class="major">Contact</h2>
				<form method="post" action="#">
					<div class="fields">
						<div class="field half">
							<label for="name">Name</label> <input type="text" name="name"
								id="name" />
						</div>
						<div class="field half">
							<label for="email">Email</label> <input type="text" name="email"
								id="email" />
						</div>
						<div class="field">
							<label for="message">Message</label>
							<textarea name="message" id="message" rows="4"></textarea>
						</div>
					</div>
					<ul class="actions">
						<li><input type="submit" value="Send Message" class="primary" /></li>
						<li><input type="reset" value="Reset" /></li>
					</ul>
				</form>
				<ul class="icons">
					<li><a href="#" class="icon fa-twitter"><span
							class="label">Twitter</span></a></li>
					<li><a href="#" class="icon fa-facebook"><span
							class="label">Facebook</span></a></li>
					<li><a href="#" class="icon fa-instagram"><span
							class="label">Instagram</span></a></li>
					<li><a href="#" class="icon fa-github"><span class="label">GitHub</span></a></li>
				</ul>
			</article>

			<!-- Elements -->
			<article id="elements">
				<h2 class="major">Elements</h2>

				<section>
					<h3 class="major">Text</h3>
					<p>
						This is <b>bold</b> and this is <strong>strong</strong>. This is <i>italic</i>
						and this is <em>emphasized</em>. This is <sup>superscript</sup>
						text and this is <sub>subscript</sub> text. This is <u>underlined</u>
						and this is code:
						<code>for (;;) { ... }</code>
						. Finally, <a href="#">this is a link</a>.
					</p>
					<hr />
					<h2>Heading Level 2</h2>
					<h3>Heading Level 3</h3>
					<h4>Heading Level 4</h4>
					<h5>Heading Level 5</h5>
					<h6>Heading Level 6</h6>
					<hr />
					<h4>Blockquote</h4>
					<blockquote>Fringilla nisl. Donec accumsan interdum
						nisi, quis tincidunt felis sagittis eget tempus euismod.
						Vestibulum ante ipsum primis in faucibus vestibulum. Blandit
						adipiscing eu felis iaculis volutpat ac adipiscing accumsan
						faucibus. Vestibulum ante ipsum primis in faucibus lorem ipsum
						dolor sit amet nullam adipiscing eu felis.</blockquote>
					<h4>Preformatted</h4>
					<pre>
						<code>i = 0;
										while (!deck.isInOrder()) {
										    print 'Iteration ' + i;
										    deck.shuffle();
										    i++;
										}
										print 'It took ' + i + ' iterations to sort the deck.';</code>
					</pre>
				</section>
				<section>
					<h3 class="major">Lists</h3>
					<h4>Unordered</h4>
					<ul>
						<li>Dolor pulvinar etiam.</li>
						<li>Sagittis adipiscing.</li>
						<li>Felis enim feugiat.</li>
					</ul>
					<h4>Alternate</h4>
					<ul class="alt">
						<li>Dolor pulvinar etiam.</li>
						<li>Sagittis adipiscing.</li>
						<li>Felis enim feugiat.</li>
					</ul>
					<h4>Ordered</h4>
					<ol>
						<li>Dolor pulvinar etiam.</li>
						<li>Etiam vel felis viverra.</li>
						<li>Felis enim feugiat.</li>
						<li>Dolor pulvinar etiam.</li>
						<li>Etiam vel felis lorem.</li>
						<li>Felis enim et feugiat.</li>
					</ol>
					<h4>Icons</h4>
					<ul class="icons">
						<li><a href="#" class="icon fa-twitter"><span
								class="label">Twitter</span></a></li>
						<li><a href="#" class="icon fa-facebook"><span
								class="label">Facebook</span></a></li>
						<li><a href="#" class="icon fa-instagram"><span
								class="label">Instagram</span></a></li>
						<li><a href="#" class="icon fa-github"><span
								class="label">Github</span></a></li>
					</ul>

					<h4>Actions</h4>
					<ul class="actions">
						<li><a href="#" class="button primary">Default</a></li>
						<li><a href="#" class="button">Default</a></li>
					</ul>
					<ul class="actions stacked">
						<li><a href="#" class="button primary">Default</a></li>
						<li><a href="#" class="button">Default</a></li>
					</ul>
				</section>
				<section>
					<h3 class="major">Table</h3>
					<h4>Default</h4>
					<div class="table-wrapper">
						<table>
							<thead>
								<tr>
									<th>Name</th>
									<th>Description</th>
									<th>Price</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Item One</td>
									<td>Ante turpis integer aliquet porttitor.</td>
									<td>29.99</td>
								</tr>
								<tr>
									<td>Item Two</td>
									<td>Vis ac commodo adipiscing arcu aliquet.</td>
									<td>19.99</td>
								</tr>
								<tr>
									<td>Item Three</td>
									<td>Morbi faucibus arcu accumsan lorem.</td>
									<td>29.99</td>
								</tr>
								<tr>
									<td>Item Four</td>
									<td>Vitae integer tempus condimentum.</td>
									<td>19.99</td>
								</tr>
								<tr>
									<td>Item Five</td>
									<td>Ante turpis integer aliquet porttitor.</td>
									<td>29.99</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="2"></td>
									<td>100.00</td>
								</tr>
							</tfoot>
						</table>
					</div>
					<h4>Alternate</h4>
					<div class="table-wrapper">
						<table class="alt">
							<thead>
								<tr>
									<th>Name</th>
									<th>Description</th>
									<th>Price</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Item One</td>
									<td>Ante turpis integer aliquet porttitor.</td>
									<td>29.99</td>
								</tr>
								<tr>
									<td>Item Two</td>
									<td>Vis ac commodo adipiscing arcu aliquet.</td>
									<td>19.99</td>
								</tr>
								<tr>
									<td>Item Three</td>
									<td>Morbi faucibus arcu accumsan lorem.</td>
									<td>29.99</td>
								</tr>
								<tr>
									<td>Item Four</td>
									<td>Vitae integer tempus condimentum.</td>
									<td>19.99</td>
								</tr>
								<tr>
									<td>Item Five</td>
									<td>Ante turpis integer aliquet porttitor.</td>
									<td>29.99</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="2"></td>
									<td>100.00</td>
								</tr>
							</tfoot>
						</table>
					</div>
				</section>
				<section>
					<h3 class="major">Buttons</h3>
					<ul class="actions">
						<li><a href="#" class="button primary">Primary</a></li>
						<li><a href="#" class="button">Default</a></li>
					</ul>
					<ul class="actions">
						<li><a href="#" class="button">Default</a></li>
						<li><a href="#" class="button small">Small</a></li>
					</ul>
					<ul class="actions">
						<li><a href="#" class="button primary icon fa-download">Icon</a></li>
						<li><a href="#" class="button icon fa-download">Icon</a></li>
					</ul>
					<ul class="actions">
						<li><span class="button primary disabled">Disabled</span></li>
						<li><span class="button disabled">Disabled</span></li>
					</ul>
				</section>

				<section>
					<h3 class="major">Form</h3>
					<form method="post" action="#">
						<div class="fields">
							<div class="field half">
								<label for="demo-name">Name</label> <input type="text"
									name="demo-name" id="demo-name" value="" placeholder="Jane Doe" />
							</div>
							<div class="field half">
								<label for="demo-email">Email</label> <input type="email"
									name="demo-email" id="demo-email" value=""
									placeholder="jane@untitled.tld" />
							</div>
							<div class="field">
								<label for="demo-category">Category</label> <select
									name="demo-category" id="demo-category">
									<option value="">-</option>
									<option value="1">Manufacturing</option>
									<option value="1">Shipping</option>
									<option value="1">Administration</option>
									<option value="1">Human Resources</option>
								</select>
							</div>
							<div class="field half">
								<input type="radio" id="demo-priority-low" name="demo-priority"
									checked> <label for="demo-priority-low">Low</label>
							</div>
							<div class="field half">
								<input type="radio" id="demo-priority-high" name="demo-priority">
								<label for="demo-priority-high">High</label>
							</div>
							<div class="field half">
								<input type="checkbox" id="demo-copy" name="demo-copy">
								<label for="demo-copy">Email me a copy</label>
							</div>
							<div class="field half">
								<input type="checkbox" id="demo-human" name="demo-human" checked>
								<label for="demo-human">Not a robot</label>
							</div>
							<div class="field">
								<label for="demo-message">Message</label>
								<textarea name="demo-message" id="demo-message"
									placeholder="Enter your message" rows="6"></textarea>
							</div>
						</div>
						<ul class="actions">
							<li><input type="submit" value="Send Message"
								class="primary" /></li>
							<li><input type="reset" value="Reset" /></li>
						</ul>
					</form>
				</section>
			</article>
		</div>
		<!-- Footer -->
		<footer id="footer">
			<p class="copyright">
				&copy; 2021-2024 Powerd by <a href="https://taskryt.com/">TASKRYT.COM</a>.
			</p>
		</footer>
	</div>
	<!-- BG -->
	<div id="bg"></div>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script src="assets/js/pagination.js"></script>
	<script src="assets/js/secondBatch.js"></script>
	<!-- Delete confirmation -->
	<script>
		function confirmDelete(id) {
			var confirmation = window
					.confirm("Are you sure you want to delete?");

			if (confirmation) {
				// Redirect to the delete action with the specified ID
				window.location.href = 'Delete?id=' + id;
			} else {
				// Cancel the delete action
				alert("Deletion canceled.");
			}
		}
	</script>
	<!-- Promote confirmation -->
	<script>
		function confirmPromote(id) {
			var confirmation = window
					.confirm("Are you sure you want to promote?");
			if (confirmation) {
				// Redirect to the delete action with the specified ID
				window.location.href = 'Promote?id=' + id;
			} else {
				// Cancel the delete action
				alert("Promotion canceled.");
			}
		}
	</script>
	<!-- Demote confirmation -->
	<script>
		function confirmDemote(id) {
			var confirmation = window
					.confirm("Are you sure you want to demote?");

			if (confirmation) {
				// Redirect to the delete action with the specified ID
				window.location.href = 'Demote?id=' + id;
			} else {
				// Cancel the delete action
				alert("Demotion canceled.");
			}
		}
	</script>
	<!-- pagination testing -->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</body>
</html>
