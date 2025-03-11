package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	private static Connection conn;
	public static Connection getCon () {
		try {
			
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook?characterEncoding=UTF-8","root","pragadesh2003");
		
		} 
		
		catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
