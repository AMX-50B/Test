package net.hncu.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.sql.PreparedStatement;

public class JDBCUtil {
	private static final String driver="com.mysql.jdbc.Driver";
	private static final String url="jdbc:mysql://localhost:3306/city";
	private static final String username="root";
	private static final String password="root";
	/*
	 * 连接数据库返回一个Connection对象
	 */
	public static Connection getConnection(){
		Connection conn=null;
		try{
			//装载驱动
			Class.forName(driver);
			//连接数据库
			conn=DriverManager.getConnection(url,username,password);
		}catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return conn;
	}	
	/*
	 * 关闭数据库，释放流
	 */
	public static void close(Connection conn,Statement stmt,
			PreparedStatement pstmt,ResultSet rs)
	{
		try{
			if(conn!=null){
				conn.close();
			}
			if(stmt!=null){
				stmt.close();
			}
			if(pstmt!=null){
				pstmt.close();
			}
			if(rs!=null){
				rs.close();
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
}

