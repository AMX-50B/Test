package net.hncu.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;//注意是导java，默认导的有错

import net.hncu.model.User;
import net.hncu.util.JDBCUtil;

public class UserDao {

	private Connection conn;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;

	/*
	 * 用户登录查询 通过查询user_name和user_password从数据库查找并获取一个对象信息
	 */
	public User user_login(String userName, String userPassword) {

		User user = null;
		// 定义sql语句
		String sql = "select * from tb_user where user_name='" + userName + "' and user_password='" + userPassword
				+ "'"+"and user_statue = 0";
		// 获取数据库连接
		conn = JDBCUtil.getConnection();
		try {
			// 获取编译好sql的对象
			stmt = conn.prepareStatement(sql);
			// 执行sql语句获取结果集
			rs = stmt.executeQuery(sql);
			// 输出结果
			while (rs.next()) {
				// 注意要开辟user空间，否则会产生空指针异常
				user = new User();
				user.setId(rs.getInt("id"));
				user.setUser_name(rs.getString("user_name"));
				user.setUser_password(rs.getString("user_password"));
				user.setUser_type(rs.getInt("user_type"));
				user.setUser_statue(rs.getInt("user_statue"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 关闭数据库
			JDBCUtil.close(conn, stmt, null, rs);
		}
		return user;

		// JDBCUtil.close(conn, stmt, pstmt, rs);
	}

	/*
	 * 用户注册
	 */
	public boolean user_reg(User ruser) {
		// System.out.println(ruser.getUser_name());
		String sql = "insert into tb_user(user_name,user_password,user_type,user_statue)values(?,?,0,0)";
		// System.out.println(sql);
		int i = 0;
		// 获取数据库连接（未连接有可能报空指针异常）
		conn = JDBCUtil.getConnection();
		try {
			// 获取预编译sql的对象
			pstmt = conn.prepareStatement(sql);
			// 插入数据
			pstmt.setString(1, ruser.getUser_name());
			pstmt.setString(2, ruser.getUser_password());
			// 执行sql更新语句，返回的i是指更新了多少条
			i = pstmt.executeUpdate();
			// 输出结果
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 关闭数据库
			JDBCUtil.close(conn, stmt, pstmt, rs);
		}
		return i > 0;
	}

	/*
	 * 用户注册验证
	 */
	public boolean user_reg_re(String username) {
		String sql = "select * from tb_user where user_name='" + username + "'";
		boolean f = false;
		conn = JDBCUtil.getConnection();
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery(sql);
			if (rs.next())
				f = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 关闭数据库
			JDBCUtil.close(conn, stmt, null, rs);
		}
		return f;
	}

	/*
	 * 通过ID查找用户
	 */
	public List<User> getUserById(String id,int begin,int end) {
		// TODO Auto-generated method stub
		List<User> userlist = new ArrayList<User>();
		String sql = "select * from tb_user";
		if (!"".equals(id)&&id!=null) {
			sql += " where id=" + "'" + id + "'"+" and user_statue = 0";
		} else {
			sql += " where user_statue = 0";
		}
		sql+=" LIMIT "+begin+","+end+" ";
		//System.out.println(sql);
		conn = JDBCUtil.getConnection();
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery(sql);
			//System.out.println("ss");
			while (rs.next()) {
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setUser_name(rs.getString("user_name"));
				user.setUser_password(rs.getString("user_password"));
				user.setUser_type(rs.getInt("user_type"));
				user.setUser_statue(rs.getInt("user_statue"));
				userlist.add(user);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 关闭数据库
			JDBCUtil.close(conn, stmt, null, rs);
		}
		//System.out.println(userlist.size());
		return userlist;
	}
/*
 * 查询所有用户
 */
	public List<User> getUsers() {
		// TODO Auto-generated method stub
		List<User> userlist = new ArrayList<User>();		
		String sql = "select * from tb_user where user_statue = 0 ";	
		//System.out.println(sql);
		conn = JDBCUtil.getConnection();
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery(sql);
			//System.out.println("ss");
			while (rs.next()) {
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setUser_name(rs.getString("user_name"));
				user.setUser_password(rs.getString("user_password"));
				user.setUser_type(rs.getInt("user_type"));
				user.setUser_statue(rs.getInt("user_statue"));
				userlist.add(user);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 关闭数据库
			JDBCUtil.close(conn, stmt, null, rs);
		}
		//System.out.println(userlist.size());
		return userlist;
	}
	/*
	 * 删除
	 */
	public boolean user_delete_id(int id) {
		// TODO Auto-generated method stub
		int i=0;
		String sql="delete from tb_user where id = ?";
		conn=JDBCUtil.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			i = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCUtil.close(conn, stmt,pstmt, rs);
		}
		return i>0;
	}
	/*
	 * 逻辑删除（修改状态）
	 */
	public boolean user_up_id(int id) {
		// TODO Auto-generated method stub
		int i=0;
		String sql="update tb_user set user_statue = 1 where id = ?";
		//System.out.println(sql);
		conn=JDBCUtil.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			i = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCUtil.close(conn, stmt, pstmt, rs);
		}
		return i>0;
	}
	/*
	 * 通过id获取一个用户
	 */
	public User getUser(int id) {
		// TODO Auto-generated method stub
			User user =null;		
			String sql = "select * from tb_user where user_statue = 0 and id=" + "'" + id+"'";	
			//System.out.println(sql);
			conn = JDBCUtil.getConnection();
			try {
				stmt = conn.prepareStatement(sql);
				rs = stmt.executeQuery(sql);
				//System.out.println("ss");
				while (rs.next()) {
					user = new User();
					user.setId(rs.getInt("id"));
					user.setUser_name(rs.getString("user_name"));
					user.setUser_password(rs.getString("user_password"));
					user.setUser_type(rs.getInt("user_type"));
					user.setUser_statue(rs.getInt("user_statue"));
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				// 关闭数据库
				JDBCUtil.close(conn, stmt, null, rs);
			}
			//System.out.println(userlist.size());
			return user;
	}
/*
 * 通过id修改用户
 */
	public boolean user_update(int id, String usp) {
		// TODO Auto-generated method stub
		int i=0;
		String sql="update tb_user set user_password = ? where id = ?";
		//System.out.println(sql);
		conn=JDBCUtil.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, usp);
			pstmt.setInt(2, id);
			i = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCUtil.close(conn, stmt, pstmt, rs);
		}
		return i>0;
	}
}
