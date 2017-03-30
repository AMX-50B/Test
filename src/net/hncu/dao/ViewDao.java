package net.hncu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import net.hncu.model.Message;
import net.hncu.util.JDBCUtil;

public class ViewDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;

	/*
	 * 存信息
	 */
	public boolean setMessage(Message m) {
		// TODO Auto-generated method stub
		String sql = "insert into tb_info(info_type,info_title,info_text,info_phone,info_name,info_mail,info_date)values(?,?,?,?,?,?,now())";
		// System.out.println(sql);
		int i = 0;
		// 获取数据库连接（未连接有可能报空指针异常）
		conn = JDBCUtil.getConnection();
		try {
			// 获取预编译sql的对象
			pstmt = conn.prepareStatement(sql);
			// 插入数据
			pstmt.setInt(1, m.getType());
			pstmt.setString(2, m.getTitle());
			pstmt.setString(3, m.getContext());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getName());
			pstmt.setString(6, m.getMail());
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
	 * 通过type获取一个Message对象
	 */
	public Message getMessageByType(int type, int state, int pay) {
		// TODO Auto-generated method stub
		String sql = "select tb_info.*,tb_type.type_name from tb_info,tb_type WHERE tb_info.info_type=tb_type.info_type and tb_info.info_type = "
				+ type + " and tb_info.info_state = " + state + " and tb_info.info_pay = " + pay;
		Message me = null;
		conn = JDBCUtil.getConnection();
		try {
			// 获取编译好sql的对象
			stmt = conn.prepareStatement(sql);
			// 执行sql语句获取结果集
			rs = stmt.executeQuery(sql);
			// 输出结果
			while (rs.next()) {
				// 注意要开辟user空间，否则会产生空指针异常
				me = new Message();
				me.setId(rs.getInt("id"));
				me.setType(rs.getInt("info_type"));
				me.setTitle(rs.getString("info_title"));
				me.setContext(rs.getString("info_text"));
				me.setPhone(rs.getString("info_phone"));
				me.setName(rs.getString("info_name"));
				me.setMail(rs.getString("info_mail"));
				me.setDate(rs.getDate("info_date"));
				me.setState(rs.getInt("info_state"));
				me.setPay(rs.getInt("info_pay"));
				me.setTypename(rs.getString("type_name"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 关闭数据库
			JDBCUtil.close(conn, stmt, null, rs);
		}
		return me;
	}
	/*
	 * 关键词查找
	 */
	public List<Message> searchMessages(String subsql, String sqlvalue, String searchtype) {
		// TODO Auto-generated method stub
		String sql = "select a.*,b.* from tb_info a,tb_type b WHERE a.info_type=b.info_type and a.info_state= 1 and " + "a."+subsql;
		if ("all".equals(searchtype)) {
			sql = sql + " = '" + sqlvalue + "' ";
		} else if("like".equals(searchtype)){
			sql = sql + " like '%" + sqlvalue + "%'";
		}
		sql=sql+" order by a.id";
		//System.out.println(sql);
		List<Message> list = new ArrayList<Message>();
		conn = JDBCUtil.getConnection();
		try { 
			// 获取编译好sql的对象
			stmt = conn.prepareStatement(sql);
			// 执行sql语句获取结果集
			rs = stmt.executeQuery(sql);
			// 输出结果
			while (rs.next()) {
				// 注意要开辟user空间，否则会产生空指针异常
				Message me = new Message();
				me.setId(rs.getInt("id"));
				me.setType(rs.getInt("info_type"));
				me.setTitle(rs.getString("info_title"));
				me.setContext(rs.getString("info_text"));
				me.setPhone(rs.getString("info_phone"));
				me.setName(rs.getString("info_name"));
				me.setMail(rs.getString("info_mail"));
				me.setDate(rs.getDate("info_date"));
				me.setState(rs.getInt("info_state"));
				me.setPay(rs.getInt("info_pay"));
				me.setTypename(rs.getString("type_name"));
				list.add(me);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 关闭数据库
			JDBCUtil.close(conn, stmt, null, rs);
		}
		//System.out.println(list.size());
		return list;
	}
	/*
	 * 关键词分页查找
	 */
	public List<Message> searchMessage(String subsql, String sqlvalue, String searchtype,int begin,int end) {
		// TODO Auto-generated method stub
		String sql = "select a.*,b.* from tb_info a,tb_type b WHERE a.info_type=b.info_type and a.info_state= 1 and " + "a."+subsql;
		if ("all".equals(searchtype)) {
			sql = sql + " = '" + sqlvalue + "' ";
		} else if("like".equals(searchtype)){
			sql = sql + " like '%" + sqlvalue + "%'";
		}
		sql=sql+" order by a.id";
		sql+=" LIMIT "+begin+","+end+" ";
		//System.out.println(sql);
		List<Message> list = new ArrayList<Message>();
		conn = JDBCUtil.getConnection();
		try { 
			// 获取编译好sql的对象
			stmt = conn.prepareStatement(sql);
			// 执行sql语句获取结果集
			rs = stmt.executeQuery(sql);
			// 输出结果
			while (rs.next()) {
				// 注意要开辟user空间，否则会产生空指针异常
				Message me = new Message();
				me.setId(rs.getInt("id"));
				me.setType(rs.getInt("info_type"));
				me.setTitle(rs.getString("info_title"));
				me.setContext(rs.getString("info_text"));
				me.setPhone(rs.getString("info_phone"));
				me.setName(rs.getString("info_name"));
				me.setMail(rs.getString("info_mail"));
				me.setDate(rs.getDate("info_date"));
				me.setState(rs.getInt("info_state"));
				me.setPay(rs.getInt("info_pay"));
				me.setTypename(rs.getString("type_name"));
				list.add(me);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 关闭数据库
			JDBCUtil.close(conn, stmt, null, rs);
		}
		//System.out.println(list.size());
		return list;
	}
	/*
	 * 通过id获取一个Message对象	
	 */
	public Message getMessageById(int id) {
		// TODO Auto-generated method stub
		String sql = "select tb_info.*,tb_type.type_name from tb_info,tb_type WHERE tb_info.info_type=tb_type.info_type and tb_info.id = "+id;
		Message me = null;
		conn = JDBCUtil.getConnection();
		try {
			// 获取编译好sql的对象
			stmt = conn.prepareStatement(sql);
			// 执行sql语句获取结果集
			rs = stmt.executeQuery(sql);
			// 输出结果
			while (rs.next()) {
				// 注意要开辟user空间，否则会产生空指针异常
				me = new Message();
				me.setId(rs.getInt("id"));
				me.setType(rs.getInt("info_type"));
				me.setTitle(rs.getString("info_title"));
				me.setContext(rs.getString("info_text"));
				me.setPhone(rs.getString("info_phone"));
				me.setName(rs.getString("info_name"));
				me.setMail(rs.getString("info_mail"));
				me.setDate(rs.getDate("info_date"));
				me.setState(rs.getInt("info_state"));
				me.setPay(rs.getInt("info_pay"));
				me.setTypename(rs.getString("type_name"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 关闭数据库
			JDBCUtil.close(conn, stmt, null, rs);
		}
		return me;
	}
	/*
	 * 后台分页查找
	 */
	public List<Message> getMessageList(String pay, String state, String type,int begin,int end) {
		// TODO Auto-generated method stub
		String sql = "select tb_info.*,tb_type.type_name from tb_info,tb_type WHERE tb_info.info_type=tb_type.info_type "; 
		if(!"".equals(type)){
			sql=sql+" and tb_info.info_type = "+type;
		}
		if(!"all".equals(state)){
			sql=sql+"  and tb_info.info_state = " + state;
		}
		if(!"all".equals(pay)){
			sql=sql+" and tb_info.info_pay = " + pay;
		}
		sql=sql+" order by tb_info.id";
		sql+=" LIMIT "+begin+","+end+" ";
		//System.out.println("2222222"+sql);
		//System.out.println(sql);
		List<Message> list = new ArrayList<Message>();
		conn = JDBCUtil.getConnection();
		try { 
			// 获取编译好sql的对象
			stmt = conn.prepareStatement(sql);
			// 执行sql语句获取结果集
			rs = stmt.executeQuery(sql);
			// 输出结果
			while (rs.next()) {
				// 注意要开辟user空间，否则会产生空指针异常
				Message me = new Message();
				me.setId(rs.getInt("id"));
				me.setType(rs.getInt("info_type"));
				me.setTitle(rs.getString("info_title"));
				me.setContext(rs.getString("info_text"));
				me.setPhone(rs.getString("info_phone"));
				me.setName(rs.getString("info_name"));
				me.setMail(rs.getString("info_mail"));
				me.setDate(rs.getDate("info_date"));
				me.setState(rs.getInt("info_state"));
				me.setPay(rs.getInt("info_pay"));
				me.setTypename(rs.getString("type_name"));
				list.add(me);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 关闭数据库
			JDBCUtil.close(conn, stmt, null, rs);
		}
		//System.out.println(list.size());
		return list;
	}
	/*
	 * 后台查找
	 */
	public List<Message> getMessageLists(String pay, String state, String type) {
		// TODO Auto-generated method stub
		String sql = "select tb_info.*,tb_type.type_name from tb_info,tb_type WHERE tb_info.info_type=tb_type.info_type "; 
		if(!"".equals(type)){
			sql=sql+" and tb_info.info_type = "+type;
		}
		if(!"all".equals(state)){
			sql=sql+"  and tb_info.info_state = " + state;
		}
		if(!"all".equals(pay)){
			sql=sql+" and tb_info.info_pay = " + pay;
		}
		sql=sql+" order by tb_info.id";
		//System.out.println(sql);
		//System.out.println("111111"+sql);
		List<Message> list = new ArrayList<Message>();
		conn = JDBCUtil.getConnection();
		try { 
			// 获取编译好sql的对象
			stmt = conn.prepareStatement(sql);
			// 执行sql语句获取结果集
			rs = stmt.executeQuery(sql);
			// 输出结果
			while (rs.next()) {
				// 注意要开辟user空间，否则会产生空指针异常
				Message me = new Message();
				me.setId(rs.getInt("id"));
				me.setType(rs.getInt("info_type"));
				me.setTitle(rs.getString("info_title"));
				me.setContext(rs.getString("info_text"));
				me.setPhone(rs.getString("info_phone"));
				me.setName(rs.getString("info_name"));
				me.setMail(rs.getString("info_mail"));
				me.setDate(rs.getDate("info_date"));
				me.setState(rs.getInt("info_state"));
				me.setPay(rs.getInt("info_pay"));
				me.setTypename(rs.getString("type_name"));
				list.add(me);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 关闭数据库
			JDBCUtil.close(conn, stmt, null, rs);
		}
		//System.out.println("11111111"+list.size());
		return list;
	}
	/*
	 * 设置付费
	 */
	public boolean updatePay(int id) {
		// TODO Auto-generated method stub
		int i=0;
		String sql="update tb_info set info_pay = 1 where id = ?";
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
	 * 设置审核
	 */
	public boolean updateState(int id) {
		// TODO Auto-generated method stub
		int i=0;
		String sql="update tb_info set info_state = 1 where id = ?";
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
}
