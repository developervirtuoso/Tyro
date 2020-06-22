package common.database;

import java.beans.PropertyVetoException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class C3P0DataSource {
	private static C3P0DataSource dataSource;
	   private ComboPooledDataSource comboPooledDataSource;
	   

	   private C3P0DataSource() {}

	   public static C3P0DataSource getInstance() {
	      if (dataSource == null)
	         dataSource = new C3P0DataSource();
	      return dataSource;
	   }

	   public Connection getConnection() {
		   Connection dbconn = null;
	        try {
	            Class.forName("com.mysql.jdbc.Driver");
	            //dbconn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tyro?autoReconnect=true", "root", "");
	            dbconn = DriverManager.getConnection("jdbc:mysql://localhost:3130/tyro?autoReconnect=true", "reports", "");

	        } catch (Exception ex) {
	            System.out.println("Exception in DBConnection java file of fun" + ex);
	        }
	        return dbconn;
		   
		/*
		 * Connection con = null; try { con = comboPooledDataSource.getConnection(); }
		 * catch (SQLException e) { e.printStackTrace(); } return con;
		 */
	   }
	}
