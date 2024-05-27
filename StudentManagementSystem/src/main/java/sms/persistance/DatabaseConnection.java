package sms.persistance;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {

	public static Connection DbConnection() {
		Connection conn = null;
		try {
			String URL = "jdbc:postgresql://localhost:5432/sms";
			String USER = "postgres";
			String PASS = "root";

			Class.forName("org.postgresql.Driver");
			conn = DriverManager.getConnection(URL, USER, PASS);
			if (conn != null) {
				System.out.println("Connected");
				return conn;
			} else {
				System.out.println("Something went wrong...");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return conn;
	}
}
