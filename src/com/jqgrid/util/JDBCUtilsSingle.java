package com.jqgrid.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public final class JDBCUtilsSingle {
	private String url = "jdbc:hsqldb:hsql://localhost:9001/demodb";
	//"jdbc:mysql://localhost:3306/test?useUnicode=true&amp;&characterEncoding=UTF8";
	private String username = "sa";//"root";
	private String password = "";//"root";

	private static JDBCUtilsSingle instance = null;

	public static JDBCUtilsSingle getInstance() {
		if (instance == null)
			synchronized (JDBCUtilsSingle.class) {
				if (instance == null) {
					instance = new JDBCUtilsSingle();
				}
			}
		return instance;
	}

	static {
		try {
			Class.forName("org.hsqldb.jdbcDriver");//"com.mysql.jdbc.Driver"
		} catch (ClassNotFoundException e) {
			throw new ExceptionInInitializerError(e);
		}
	}

	private JDBCUtilsSingle() {
	}

	public Connection getConnection() throws SQLException {
		return DriverManager.getConnection(url, username, password);
	}

	public void free(ResultSet rs, Statement st, Connection conn) {
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (st != null)
					st.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if (conn != null)
						conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {

				}
			}
		}
	}
}