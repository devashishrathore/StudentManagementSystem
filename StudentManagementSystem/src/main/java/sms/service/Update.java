package sms.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sms.model.Student;
import sms.persistance.DatabaseConnection;

@WebServlet("/Update")
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Student student = new Student();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
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

			PreparedStatement preparedStatement = connection.prepareStatement(
					"update students set name = ?, mobile = ?, fees = ?, location = ?, qualification = ?, experience = ?, groupname = ?, score = ? where id = ?");

			preparedStatement.setString(1, student.getFullName());
			preparedStatement.setString(2, student.getPhoneNo());
			preparedStatement.setString(3, student.getFees());
			preparedStatement.setString(4, student.getLocation());
			preparedStatement.setString(5, student.getHighestEducation());
			preparedStatement.setString(6, student.getPreviousExperience());
			preparedStatement.setString(7, student.getGroup());
			preparedStatement.setString(8, student.getMockScore());
			preparedStatement.setInt(9, id);
			int success = preparedStatement.executeUpdate();
			if (success > 0) {
				System.out.println("Student updated successfully..");
				HttpSession session = request.getSession();
				session.setAttribute("updateSuccess", "success");
				response.sendRedirect("index.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
