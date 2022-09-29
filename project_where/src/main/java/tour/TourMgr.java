package tour;

import java.io.*;
import java.sql.*;
import java.util.*;

import javax.servlet.http.*;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

public class TourMgr {
	private DBConnectionMgr pool;
	
	public TourMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 게시물의 총 갯수
	public int getTotalCount(String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		try {
			con = pool.getConnection();
			if(keyWord.equals("null") || keyWord.equals("")) {
				sql = "SELECT COUNT(NUM) FROM TOUR";
				pstmt = con.prepareStatement(sql);
			} else {
				sql = "SELECT COUNT(NUM) FROM TOUR WHERE " + keyField + " LIKE ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
			}
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalCount = rs.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}
	
	// 게시판 리스트
	public Vector<TourBean> getBoardList(String keyField, String keyWord, int start, int end) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<TourBean> vlist = new Vector<TourBean>();
		try {
			con = pool.getConnection();
			if(keyWord.equals("null") || keyWord.equals("")) {
				sql = "SELECT SA2.* FROM(SELECT ROWNUM R1, SA1.* FROM(SELECT * FROM TOUR ORDER BY NUM)SA1)SA2 WHERE R1 >= ? AND R1 <= ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else {
				// sql = "SELECT * FROM(SELECT * FROM TBLBOARD WHERE "+ keyField + " LIKE ? ORDER BY REF DESC, POS) WHERE ROWNUM >= ? AND ROWNUM <= ?";
				sql = "SELECT SA2.* FROM(SELECT ROWNUM R1, SA1.* FROM(SELECT * FROM TOUR ORDER BY NUM)SA1 WHERE " + keyField + " LIKE ?)SA2 WHERE R1 >= ? AND R1 <= ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+keyWord+"%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				TourBean bean = new TourBean();
				bean.setNum(rs.getInt("num"));
				bean.setCat1(rs.getString("cat1"));
				bean.setCat2(rs.getString("cat2"));
				bean.setCat3(rs.getString("cat3"));
				bean.setContenttypeid(rs.getString("contenttypeid"));
				bean.setAreacode(rs.getString("areacode"));
				bean.setSigungucode(rs.getString("sigungucode"));
				bean.setAddr(rs.getString("addr"));
				bean.setTitle(rs.getString("title"));
				bean.setTel(rs.getString("tel"));
				bean.setMapx(rs.getString("mapx"));
				bean.setMapy(rs.getString("mapy"));
				bean.setFirstimage(rs.getString("firstimage"));
				bean.setFirstimage2(rs.getString("firstimage2"));
				vlist.add(bean);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	// 게시물 얻어오기
	public TourBean getBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		TourBean bean = new TourBean();
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM TOUR WHERE NUM = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setNum(rs.getInt("num"));
				bean.setCat1(rs.getString("cat1"));
				bean.setCat2(rs.getString("cat2"));
				bean.setCat3(rs.getString("cat3"));
				bean.setContenttypeid(rs.getString("contenttypeid"));
				bean.setAreacode(rs.getString("areacode"));
				bean.setSigungucode(rs.getString("sigungucode"));
				bean.setAddr(rs.getString("addr"));
				bean.setTitle(rs.getString("title"));
				bean.setTel(rs.getString("tel"));
				bean.setMapx(rs.getString("mapx"));
				bean.setMapy(rs.getString("mapy"));
				bean.setFirstimage(rs.getString("firstimage"));
				bean.setFirstimage2(rs.getString("firstimage2"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return bean;
	}
	
	public static class CLOBToStringConvert {
		public static String convert(Object targetData) throws Exception{
			StringBuffer buffer = new StringBuffer();
			BufferedReader reader = new BufferedReader(((Clob)targetData).getCharacterStream());
			String dummy = "";
			while((dummy = reader.readLine()) != null){
				buffer.append(dummy);
			}
			reader.close();
			
			return buffer.toString();
		}
	}
}