package less06;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Checker {

	private String login;
	private String password;
	
    public Checker() {}
    
    public Checker(String login, String password) {
    	this.login = login;
    	this.password = password;
    }
    
	public boolean show() {
		
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

		Statement stmt = null;
		ResultSet rs = null;
		Boolean result = false;
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM users where name=" + "'" + login + "'" + "AND password=" + "'" + password +"'");
			rs.next();
			result = rs.first();
			
		} catch (SQLException ex) {
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		} finally {

			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException sqlEx) {
				} // ignore

				rs = null;
			}

			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException sqlEx) {
				} // ignore

				stmt = null;
			}

		}
		return result;
	}
	
	public String message() {
		if (show()) {
			return "Access Granted";
		}
		return "Access Denied";
	}
	
//	public static void main(String[] args) {
//		System.out.println(new Checker().message());
//	}
    
}