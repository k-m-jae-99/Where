package tour;

import java.sql.*;

public class DBConn {
	public static Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "travel", "1234");
		return con;
	}
}