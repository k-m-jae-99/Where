package web;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class UserDAO {
	private ConnectionMgr pool;
	
	public UserDAO() {
		try {
			pool = ConnectionMgr.getInstance();
		} catch(Exception e) {
			e.printStackTrace();
	}
}

 ConnectionMgr cm = new ConnectionMgr();
 Connection con = null;
 
 // DB에서 로그인 정보 가져오기
 public UserDTO login(String id, String pw){
  UserDTO dto = new UserDTO();
  try {
	con= cm.getConnection();
} catch (Exception e) {
	e.printStackTrace();
}
  ResultSet rs=null;
  PreparedStatement pstmt = null; 
  String sql="select * from travel_login where id=? and pw=?";
  
  try{
   pstmt=con.prepareStatement(sql);
   pstmt.setString(1, id); 
   pstmt.setString(2, pw);
   
   rs=pstmt.executeQuery();
   while(rs.next()){ 
    dto.setId(rs.getString("id"));
    dto.setPw(rs.getString("pw"));
    dto.setName(rs.getString("name"));
   }  
  
  }catch(Exception e){
   System.out.println(e);
  }
  return dto;
}

// 아이디 찾기 
 public String find_id(String name, String phone) {
		String id = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			String sql ="select id from travel_login where name=? and phone=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				id = rs.getString("id");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return id;
	}
 
// 비밀번호 찾기
 public String find_pw(String id, String phone) {
		String pw = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			String sql ="select pw from travel_login where id=? and phone=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, phone);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pw = rs.getString("pw");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return pw;
	}
 

 
// 아이디 체크
public boolean checkId(String id) {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	boolean flag = false;
	try {
		con = pool.getConnection();
		sql = "select id from travel_login where id = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,  id);
		rs = pstmt.executeQuery();
		flag = rs.next();
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		pool.freeConnection(con, pstmt, rs);
	}
	return flag;
}

// 회원가입

public boolean insertMember(UserDTO bean) {
	Connection con = null;
	PreparedStatement pstmt = null;
	String sql = null;
	boolean flag = false;
	try {
		con = pool.getConnection();
		sql = "insert into travel_login(id,pw,name,gender,birthday,email,zipcode,address,datailaddress,phone) values(?,?,?,?,?,?,?,?,?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, bean.getId());
		pstmt.setString(2, bean.getPw());
		pstmt.setString(3, bean.getName());
		pstmt.setString(4, bean.getGender());
		pstmt.setString(5, bean.getBirthday());
		pstmt.setString(6, bean.getEmail());
		pstmt.setString(7, bean.getZipcode());
		pstmt.setString(8, bean.getAddress());
		pstmt.setString(9, bean.getDatailaddress());
		pstmt.setString(10, bean.getPhone());
		if(pstmt.executeUpdate() == 1)
			flag = true;			
	}catch(Exception e) {
		e.printStackTrace();
	} finally {
		pool.freeConnection(con, pstmt);
	}
	return flag;		
	}
}


