package board;

import java.io.*;
import java.io.BufferedReader;
import java.sql.Clob;
import java.sql.*;
import java.util.Vector;

import javax.servlet.http.*;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardMgr {
	private DBConnectionMgr pool;
	private static final String SAVEFOLDER = "D:/LHU/jspWork/Where/src/main/webapp/fileupload";
	private static final String ENCTYPE = "UTF-8";
	private static final int MAXSIZE = 5*1024*1024;
	
	public BoardMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	// 게시물 입력
	public void insertBoard(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		MultipartRequest multi = null;
		int filesize = 0;
		String filename = null;
		try {
			con = pool.getConnection();
			sql = "select max(num) from tblboard";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int ref = 1;
			int category = 0;
			if(rs.next()) {
				ref = rs.getInt(1) + 1;
			}
			File file = new File(SAVEFOLDER);
			if(!file.exists()) {
				file.mkdirs();
			}	
			multi = new MultipartRequest(req, SAVEFOLDER,MAXSIZE,ENCTYPE,
							new DefaultFileRenamePolicy());
			if(multi.getFilesystemName("filename") != null) {
				filename = multi.getFilesystemName("filename");
				filesize = (int)multi.getFile("filename").length();
			}
			sql = "insert into tblboard values(?,?,?,?,0,?,0,SYSDATE,?,?,0,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setString(2, multi.getParameter("name"));
			pstmt.setString(3, multi.getParameter("subject"));
			pstmt.setString(4, multi.getParameter("content"));
			pstmt.setInt(5, ref);
			pstmt.setString(6, multi.getParameter("pass"));
			pstmt.setString(7, multi.getParameter("ip"));
			pstmt.setString(8, filename);
			pstmt.setInt(9, filesize);
			pstmt.setString(10, multi.getParameter("category"));
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
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
				sql = "select count(num) from tblboard";
				pstmt = con.prepareStatement(sql);
			} else {
				sql = "select count(num) from tblboard where " + keyField + " like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+keyWord+"%");
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
	public Vector<BoardBean> getBoardList(String keyField, String keyWord, int start, int end) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BoardBean> vlist = new Vector<BoardBean>();
		try {
			con = pool.getConnection();
			if(keyWord.equals("null") || keyWord.equals("")) {
				sql = "SELECT SA2.* FROM(SELECT ROWNUM R1, SA1.* FROM(SELECT * FROM tblboard ORDER BY ref desc, pos)SA1)SA2 WHERE R1 >= ? AND R1 <= ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else {
				//sql = "select * from(select * from tblboard where "+keyField+" like ? order by ref desc, pos) where ROWNUM >= ? AND ROWNUM <= ?";
				sql = "SELECT SA2.* FROM(SELECT ROWNUM R1, SA1.* FROM(SELECT * FROM tblboard ORDER BY ref desc, pos)SA1 where " + keyField + " like ?)SA2 WHERE R1 >= ? AND R1 <= ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+keyWord+"%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setSubject(rs.getString("subject"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setCount(rs.getInt("count"));
				bean.setCategory(rs.getString("category"));
				vlist.add(bean);
			}		
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	// 조회수 증가
	public void upCount(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblboard set count = count+1 where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	// 게시물 얻어오기
	public BoardBean getBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BoardBean bean = new BoardBean();
		try {
			con = pool.getConnection();
			sql = "select * from tblboard where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setSubject(rs.getString("subject"));
				bean.setContent(rs.getString("content"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setPass(rs.getString("pass"));
				bean.setIp(rs.getString("ip"));
				bean.setCount(rs.getInt("count"));
				bean.setFilename(rs.getString("filename"));
				bean.setFilesize(rs.getInt("filesize"));
				bean.setCategory(rs.getString("category"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return bean;
	}
	
	// 파일 다운로드
	public void downLoad(HttpServletRequest req, HttpServletResponse res, JspWriter out, PageContext pageContext) {
		try {
			String filename = req.getParameter("filename");			
			File file = new File(UtilMgr.con(SAVEFOLDER + File.separator + filename));
			byte b[] = new byte[(int)file.length()];
			res.setHeader("Accept-Range", "bytes");
			String strClient = req.getHeader("User-Agent");
			if(strClient.indexOf("MSIE6.0") != -1) {
				res.setContentType("application/smnet; charset=UTF-8");
				res.setHeader("Content-Disposition", "filename=" + filename + ";");
			} else {
				res.setContentType("application/smnet; charset=UTF-8");
				res.setHeader("Content-Disposition", "attachment;filename=" + filename + ";");
			}
			out.clear();
			out = pageContext.pushBody();
			if(file.isFile()) {
				BufferedInputStream fin = new BufferedInputStream(new FileInputStream(file));
				BufferedOutputStream outs = new BufferedOutputStream(res.getOutputStream());
				int read = 0;
				while((read = fin.read(b)) != -1) {
					outs.write(b, 0, read);
				}
				outs.close();
				fin.close();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 게시물 삭제
	public void deleteBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select filename from tblboard where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next() && rs.getString(1) != null) {
				if(!rs.getString(1).equals("")) {
					File file = new File(SAVEFOLDER + "/" + rs.getString(1));
					if(file.exists())
						UtilMgr.delete(SAVEFOLDER + "/" + rs.getString(1));
				}
			}		
			sql = "delete from tblboard where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}
	
	// 게시물 수정
	public void updateBoard(BoardBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblboard set name=?, subject=?, content=?, category=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getSubject());
			pstmt.setString(3, bean.getContent());
			pstmt.setString(4, bean.getCategory());
			pstmt.setInt(5, bean.getNum());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	// 답변의 위치값 증가
	public void replyUpBoard(int ref, int pos) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblboard set pos = pos+1 where ref=? and pos > ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, pos);
			pstmt.executeUpdate();			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	// 답변글 입력 : num이 자동증가로 안되어 있을때
	public void replyBoard(BoardBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int num = 0;
		try {
			con = pool.getConnection();
			sql = "select max(num) from tblboard";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				num = rs.getInt(1)+1;
			}			
			sql = "insert into tblboard(num,name,subject,content,pos,ref,depth,regdate,pass,count,ip,category)"
					+ " values(?,?,?,?,?,?,?,SYSDATE,?,0,?,?)";
			int depth = bean.getDepth() + 1;
			int pos = bean.getPos() + 1;
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,num);
			pstmt.setString(2,bean.getName());
			pstmt.setString(3,bean.getSubject());
			pstmt.setString(4,bean.getContent());
			pstmt.setInt(5,pos);
			pstmt.setInt(6,bean.getRef());
			pstmt.setInt(7,depth);
			pstmt.setString(8,bean.getPass());
			pstmt.setString(9,bean.getIp());
			pstmt.setString(10, bean.getCategory());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
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