package web;

import java.sql.*;

public class UserMgr {
		 UserDAO dao=new UserDAO();
		 private ConnectionMgr pool;
		 
		 public UserDTO login(String id, String pw){
		  return dao.login(id, pw);
	}
}
