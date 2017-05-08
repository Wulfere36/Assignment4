package Assign4;

import java.sql.*;
import java.util.ArrayList;


public class DB_Access {
	private String url = "jdbc:mysql://localhost:3306/test";
	private String driver = "com.mysql.jdbc.Driver";
	private String uname = "morris";
	private String upass = "morris";
	
	private Connection c;
	private Statement st;
	private PreparedStatement pst;
	
	
	public DB_Access() {
		try {
			Class.forName(driver).newInstance();
			c = DriverManager.getConnection(url, uname, upass);
			st = c.createStatement();
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	public int validateLogin(String un, String up) {
		int uid = -1; // lets agree that -1 is for invalid user login
		
		String sql = "select uid from tuser02 where loginname = ? and loginpass = ?";
		try {
			pst = c.prepareStatement(sql);
			pst.setString(1, un);
			pst.setString(2, up);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				uid = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return uid;
	}
	
	public String getUserName(int uid) {
		String sql = "select name from tuser02 where uid = " + uid;
		String uname = "";
		try {
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()) uname = rs.getString(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return uname;
	}
	
	public ArrayList<Item> getAllUserItems(int uid) {
		ArrayList<Item> all = new ArrayList<Item>();
		
		String sql = "select iid, itemname, qty from titems02 where uid = " + uid;
		
		try {
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				Item i = new Item(rs.getInt(1), rs.getString(2), rs.getInt(3));
				all.add(i);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
			
		return all;
	}
	
	public int createUserAccount(User u) {
		// 0 means everything is OK, user is created
		// 1 means values are too long
		// 2 means unique constraint on the login name has been violated
		// 3 means that an empty form field was submitted
		// 4 means that the passwords are not the same
		int status = 0;
		
		if(u.getLoginName().trim().equals("") || 
				u.getName().trim().equals("") || 
				u.getLoginPass1().trim().equals("") ||
				u.getLoginPass2().trim().equals("")) return 3;
		if(u.getLoginName().trim().length() > 20 || 
				u.getName().trim().length() > 20 || 
				u.getLoginPass1().trim().length()> 20 ||
				u.getLoginPass2().trim().length()>20) return 1;
		
		if(!u.getLoginPass1().trim().equals(u.getLoginPass2().trim())) return 4;
		
		String sql = "insert into tuser02 (LoginName, Name, LoginPass) values (?, ?, ?)";
		
		try {
			pst = c.prepareStatement(sql);
			pst.setString(1, u.getLoginName());
			pst.setString(2, u.getName());
			pst.setString(3, u.getLoginPass1());
			pst.executeUpdate();
		} catch (SQLException e) {
			status = 2;
			e.printStackTrace();
		}

		return status;
	}
	
	public int updateUserAccount(User u) {
		// 0 means everything is OK, user is created
		// 1 means values are too long
		// 2 means unique constraint on the login name has been violated
		// 3 means that an empty form field was submitted
		// 4 means that the passwords are not the same
		int status = 0;
		boolean changePass = true;
		String sql;
		if (u.getLoginPass1().trim().equals("") && u.getLoginPass2().trim().equals("")) {
			changePass = false;
		}
		if(u.getName().trim().equals("") || u.getLoginName().trim().equals("")) {
			return 3;
		}
		if(u.getName().trim().length()>20 || u.getLoginPass1().trim().length()>20) {
			return 1;
		}
		if (!(u.getLoginPass1().trim().equals(u.getLoginPass2().trim()))) {
			return 4;
		}
		if (changePass) {
			sql = "update tuser02 set Name=?, LoginPass=? where uid=?";
		} else {
			sql = "update tuser02 set Name=? where uid=?";
		}
		try {
			pst = c.prepareStatement(sql);
			pst.setString(1, u.getName());
			if (changePass) {
				pst.setString(2, u.getLoginPass1());
				pst.setInt(3, u.getUid());
			} else {
				pst.setInt(2, u.getUid());
			}
			pst.executeUpdate();
		} catch (SQLException e) {
			status=4;
			e.printStackTrace();
		}
		return status;
	
	}
	
	public User getUserAccount(int uid) {
		User user = new User();
		String sql = "select LoginName, Name, LoginPass from tuser02 where uid="+uid;
		try {
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				user.setLoginName( rs.getString(1) );
				user.setName( rs.getString(2) );
				user.setLoginPass1( rs.getString(3) );
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public int addItem(String iname, String iqty, Integer uid) {
		// 0 - OK - item was inserted
		// 1 - item name was not given
		// 2 - item qty was either not given or not a valid int
		int res = 0;
		int qty = 0;
		if(iname == null || iname.trim().equals("")) return 1;
		if(iname.trim().length()>20) return 3;
		try {
			qty = Integer.parseInt(iqty);
		}catch(Exception e) {return 2;}
		
		String sql = "insert into titems02 (ItemName, Qty, uid) values (?, ?, ?)";
		try {
			pst = c.prepareStatement(sql);
			pst.setString(1, iname);
			pst.setInt(2, qty);
			pst.setInt(3, uid);
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return 4;
		}
		return res;
	}

	public Item getItem(int iid) {
		Item item = new Item();
		
		String sql = "select ItemName, Qty, uid from titems02 where iid = " + iid;
		
		try {
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				item.setName(rs.getString(1));
				item.setQty(rs.getInt(2));
				item.setUid(rs.getInt(3));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
			
		return item;
	}
	
	public int updateItem(int iid, String iname, String iqty, int uid) {
		// 0 - OK - item was inserted
		// 1 - item name was not given
		// 2 - item qty was either not given or not a valid int
		// 3 - item name is too long
		int res = 0;
		int qty = 0;
		if(iname == null || iname.trim().equals("")) return 1;
		if(iname.trim().length()>20) return 3;
		try {
			qty = Integer.parseInt(iqty);
		}catch(Exception e) {return 2;}
		
		String sql = "update titems02 set ItemName=?, Qty=?, uid=? where iid=?";
		try {
			pst = c.prepareStatement(sql);
			pst.setString(1, iname);
			pst.setInt(2, qty);
			pst.setInt(3, uid);
			pst.setInt(4, iid);
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return 4;
		}
		return res;
	}
	
	public int deleteItem(int iid) {
		// 0 - ok, 1 - item not found, 2 - general db error
		int status = 0;
		if (iid!=0) {
			String sql = "delete from titems02 where iid = ?";
			try {
				pst = c.prepareStatement(sql);
				pst.setInt(1, iid);
				pst.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
				status = 2;
			}
		} else {
			status = 1;
		}
		return status;
	}

	public static void main(String[] args) {
		DB_Access db = new DB_Access();
		System.out.println("uid: " + db.validateLogin("user01", "pass01"));

	}

}
























