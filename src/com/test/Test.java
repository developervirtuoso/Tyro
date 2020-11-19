package com.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import com.dao.SmsService;
import com.dao.SmsServiceDao;

public class Test {
public static void main(String[] args) {
	try{  
		Class.forName("com.mysql.jdbc.Driver").newInstance();  
		Connection con=DriverManager.getConnection("jdbc:mysql://smpp1.sms24hours.com:5712/sgc_virtuo","root","");  
		//here sonoo is database name, root is username and password  
		Statement stmt=con.createStatement();  
		ResultSet rs=stmt.executeQuery("select * from sgc_message_log where vendorTransactionId like '1113431319164772923';");  
		while(rs.next())  
		System.out.println(rs.getInt(1)+"  "+rs.getString(2)+"  "+rs.getString(3));  
		con.close();  
		}catch(Exception e){ System.out.println(e);}  
		}
}

