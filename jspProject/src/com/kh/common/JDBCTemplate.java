package com.kh.common;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {

	// 싱글톤 패턴 적용하여 jdbc 템플릿 작성 (한번 생성하고 계속 꺼내쓰는 방식!!)
	
	// 1. Connection 객체 생성 한 후 해당 Connection 객체를 반환시켜주는 getConnection 메소드
	public static Connection getConnection() {
		
		// ojdbc6.jar
		// WEB-INF 안에 lib에 복붙하기!!
		// 우선 정적 코딩 방식으로 하기
		
		Connection conn = null;
		Properties prop = new Properties(); // Map 계열 컬렉션 (K-V)

		
		// 읽어들이고자 하는 classes 폴더내의 driver.properties 파일의 물리적인 경로
		// /는 최상위 폴더 의미
		String filePath = JDBCTemplate.class.getResource("/db/driver/driver.properties").getPath();
		// "C:/05_server-workspace2/jspProject/WebContent/classes/db/driver/driver.properties
		
		try {
			//prop.load(new FileInputStream("driver.properties 파일의 경로")); 
			prop.load(new FileInputStream(filePath));
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		try {
			// jdbc driver 등록
			//Class.forName("oracle.jdbc.driver.OracleDriver");
			Class.forName(prop.getProperty("driver"));
			
			// 접속하고자 하는 db의 url, 계정명, 비밀번호 제시해서 Conenction 객체 생성
			//conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "SERVER", "SERVER");
			conn = DriverManager.getConnection(prop.getProperty("url"), 
											   prop.getProperty("username"), 
											   prop.getProperty("password"));
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
		
		
	}
	
	// 2_1. Connection 객체 전달받아서 commit 시켜주는 commit 메소드
	public static void commit(Connection conn) {
		try { // 자동완성 없애기
			if(conn != null && !conn.isClosed()) {
				conn.commit();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 2_2. Connection 객체 전달받아서 rollback 시켜주는 rollback 메소드
	public static void rollback(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 3_1. Connection 객체 전달아서 반납시켜주는 close 메소드
	public static void close(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 3_2. Statement 객체 전달아서 반납시켜주는 close 메소드 (stmt,pstmt 둘다 가능)
	public static void close(Statement stmt) {
		try {
			if(stmt!= null && !stmt.isClosed()) {
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 3_2. ResultSet 객체 전달아서 반납시켜주는 close 메소드
	public static void close(ResultSet rset) {
		try {
			if(rset != null && !rset.isClosed()) {
				rset.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
