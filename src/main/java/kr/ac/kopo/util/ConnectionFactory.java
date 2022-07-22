package kr.ac.kopo.util;

import java.sql.Connection;
import java.sql.DriverManager;
// 1-2단계
public class ConnectionFactory {
//	try-catch 빼고 throws로도 가능
	public Connection getConnection() {
		Connection conn = null;
		try {			
			Class.forName("oracle.jdbc.driver.OracleDriver");	
			
			String url = "jdbc:oracle:thin:@192.168.119.119:1521:dink";
			String user = "scott";
			String password = "tiger";
			
			conn = DriverManager.getConnection(url, user, password);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
}
