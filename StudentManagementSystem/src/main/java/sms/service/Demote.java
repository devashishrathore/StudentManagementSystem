package sms.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sms.persistance.DatabaseConnection;

@WebServlet("/Demote")
public class Demote extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int ids = Integer.parseInt(request.getParameter("id"));
		String dbGroup = null;
		try {
			Connection connect = DatabaseConnection.DbConnection();

			PreparedStatement getGrupName = connect.prepareStatement("select groupname from students where id = ?");
			getGrupName.setInt(1, ids);
			ResultSet rs = getGrupName.executeQuery();
			while (rs.next()) {
				dbGroup = rs.getString("groupname");
			}
			if (dbGroup.equals("Group 1") || dbGroup.equals("Group 2")) {
				HttpSession session = request.getSession();
				session.setAttribute("firstBatchDemotion", "success");
				response.sendRedirect("index.jsp");
			} else if (dbGroup.equals("Group 3") || dbGroup.equals("Group 4")) {
				PreparedStatement secondBatch = connect
						.prepareStatement("update students set groupname = ? where id = ?");
				secondBatch.setString(1, "Group 2");
				secondBatch.setInt(2, ids);
				int secondBatchDemotion = secondBatch.executeUpdate();
				if (secondBatchDemotion > 0) {
					HttpSession session = request.getSession();
					session.setAttribute("secondBatchDemotion", "success");
					response.sendRedirect("index.jsp");
				}
			} else if (dbGroup.equals("Group 5") || dbGroup.equals("Group 6")) {
				PreparedStatement thirdBatch = connect
						.prepareStatement("update students set groupname = ? where id = ?");
				thirdBatch.setString(1, "Group 4");
				thirdBatch.setInt(2, ids);
				int thirdBatchDemotion = thirdBatch.executeUpdate();
				if (thirdBatchDemotion > 0) {
					HttpSession session = request.getSession();
					session.setAttribute("thirdBatchDemotion", "success");
					response.sendRedirect("index.jsp");
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
