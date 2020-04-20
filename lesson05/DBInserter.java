package less05;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBInserter {

	private final static String INSERT = "INSERT INTO users(name, password, loggin, age, gender, comment, address) VALUES (?,?,?,?,?,?,?)";

	public static void insert(String name, String password, String loggin, int age, String gender, String comment, String address) {
		
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		Connection conn = null;

		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost/myShop?" + "user=root&password=");

		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		PreparedStatement stmt = null;

		try {
			stmt = conn.prepareStatement(INSERT);
			stmt.setString(1, name);
			stmt.setString(2, password);
			stmt.setString(3, loggin);
			stmt.setInt(4, age);
			stmt.setString(5, gender);
			stmt.setString(6, comment);
			stmt.setString(7, address);
			stmt.execute();

		} catch (SQLException ex) {
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		} finally {

			
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException sqlEx) {
				} // ignore

				stmt = null;
			}
		}
		
	}
//		public static void main(String[] args) {
//			insert("Petr", "123", "hello", 22, "M", "test", "none");
//		}
}