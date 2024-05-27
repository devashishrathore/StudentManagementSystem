package sms.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sms.model.Student;
import sms.persistance.DatabaseConnection;

@WebServlet("/AddStudent")
public class AddStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Student student = new Student();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		student.setFullName(request.getParameter("name"));
		student.setPhoneNo(request.getParameter("mobile"));
		student.setFees(request.getParameter("fees"));
		student.setLocation(request.getParameter("location"));
		student.setHighestEducation(request.getParameter("highestQualification"));
		student.setPreviousExperience(request.getParameter("previousExperience"));
		student.setGroup(request.getParameter("group"));
		student.setMockScore(request.getParameter("mockScore"));

		try {
			Connection connection = DatabaseConnection.DbConnection();
			// Fetching max id from sign up table for auto increment id
			int count = 0;
			PreparedStatement st = connection.prepareStatement("select max(id) as id from students");
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				count = rs.getInt("id");
			}
			PreparedStatement preparedStatement = connection
					.prepareStatement("insert into students values(?, ?, ?, ?, ?, ?, ?, ?, ?)");

			preparedStatement.setInt(1, ++count);
			preparedStatement.setString(2, student.getFullName());
			preparedStatement.setString(3, student.getPhoneNo());
			preparedStatement.setString(4, student.getFees());
			preparedStatement.setString(5, student.getLocation());
			preparedStatement.setString(6, student.getHighestEducation());
			preparedStatement.setString(7, student.getPreviousExperience());
			preparedStatement.setString(8, student.getGroup());
			preparedStatement.setString(9, student.getMockScore());

			int success = preparedStatement.executeUpdate();
			if (success > 0) {
				System.out.println("Student added successfully..");
				HttpSession session = request.getSession();
				session.setAttribute("stAddedSuccess", "success");
				response.sendRedirect("index.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
