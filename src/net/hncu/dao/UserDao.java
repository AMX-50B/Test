package net.hncu.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;//ע���ǵ�java��Ĭ�ϵ����д�

import net.hncu.model.User;
import net.hncu.util.JDBCUtil;

public class UserDao {

	private Connection conn;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;

	/*
	 * �û���¼��ѯ ͨ����ѯuser_name��user_password�����ݿ���Ҳ���ȡһ��������Ϣ
	 */
	public User user_login(String userName, String userPassword) {

		User user = null;
		// ����sql���
		String sql = "select * from tb_user where user_name='" + userName + "' and user_password='" + userPassword
				+ "'"+"and user_statue = 0";
		// ��ȡ���ݿ�����
		conn = JDBCUtil.getConnection();
		try {
			// ��ȡ�����sql�Ķ���
			stmt = conn.prepareStatement(sql);
			// ִ��sql����ȡ�����
			rs = stmt.executeQuery(sql);
			// ������
			while (rs.next()) {
				// ע��Ҫ����user�ռ䣬����������ָ���쳣
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
			// �ر����ݿ�
			JDBCUtil.close(conn, stmt, null, rs);
		}
		return user;

		// JDBCUtil.close(conn, stmt, pstmt, rs);
	}

	/*
	 * �û�ע��
	 */
	public boolean user_reg(User ruser) {
		// System.out.println(ruser.getUser_name());
		String sql = "insert into tb_user(user_name,user_password,user_type,user_statue)values(?,?,0,0)";
		// System.out.println(sql);
		int i = 0;
		// ��ȡ���ݿ����ӣ�δ�����п��ܱ���ָ���쳣��
		conn = JDBCUtil.getConnection();
		try {
			// ��ȡԤ����sql�Ķ���
			pstmt = conn.prepareStatement(sql);
			// ��������
			pstmt.setString(1, ruser.getUser_name());
			pstmt.setString(2, ruser.getUser_password());
			// ִ��sql������䣬���ص�i��ָ�����˶�����
			i = pstmt.executeUpdate();
			// ������
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// �ر����ݿ�
			JDBCUtil.close(conn, stmt, pstmt, rs);
		}
		return i > 0;
	}

	/*
	 * �û�ע����֤
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
			// �ر����ݿ�
			JDBCUtil.close(conn, stmt, null, rs);
		}
		return f;
	}

	/*
	 * ͨ��ID�����û�
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
			// �ر����ݿ�
			JDBCUtil.close(conn, stmt, null, rs);
		}
		//System.out.println(userlist.size());
		return userlist;
	}
/*
 * ��ѯ�����û�
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
			// �ر����ݿ�
			JDBCUtil.close(conn, stmt, null, rs);
		}
		//System.out.println(userlist.size());
		return userlist;
	}
	/*
	 * ɾ��
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
	 * �߼�ɾ�����޸�״̬��
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
	 * ͨ��id��ȡһ���û�
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
				// �ر����ݿ�
				JDBCUtil.close(conn, stmt, null, rs);
			}
			//System.out.println(userlist.size());
			return user;
	}
/*
 * ͨ��id�޸��û�
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
