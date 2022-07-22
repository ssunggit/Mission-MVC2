package kr.ac.kopo.util;

import java.sql.Connection;
import java.sql.Statement;
// 5단계
public class JDBCClose {
							// 명시적 형변환 
	public static void close(Statement stmt, Connection conn) {
		if(stmt != null) {
			try {
				stmt.close();					
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();					
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
