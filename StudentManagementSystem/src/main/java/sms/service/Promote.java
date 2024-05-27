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

@WebServlet("/Promote")
public class Promote extends HttpServlet {
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
			if (dbGroup.equals("Group 6") || dbGroup.equals("Group 5")) {
				HttpSession session = request.getSession();
				session.setAttribute("thirdBatchPromotion", "success");
				response.sendRedirect("index.jsp");
			} else if (dbGroup.equals("Group 3") || dbGroup.equals("Group 4")) {
				PreparedStatement secondBatch = connect
						.prepareStatement("update students set groupname = ? where id = ?");
				secondBatch.setString(1, "Group 5");
				secondBatch.setInt(2, ids);
				int secondBatchPromotion = secondBatch.executeUpdate();
				if (secondBatchPromotion > 0) {
					HttpSession session = request.getSession();
					session.setAttribute("secondBatchPromotion", "success");
					response.sendRedirect("index.jsp");
				}
			} else if (dbGroup.equals("Group 1") || dbGroup.equals("Group 2")) {
				PreparedStatement firstBatch = connect
						.prepareStatement("update students set groupname = ? where id = ?");
				firstBatch.setString(1, "Group 3");
				firstBatch.setInt(2, ids);
				int firstBatchPromotion = firstBatch.executeUpdate();
				if (firstBatchPromotion > 0) {
					HttpSession session = request.getSession();
					session.setAttribute("firstBatchPromotion", "success");
					response.sendRedirect("index.jsp");
				}
			}

		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
