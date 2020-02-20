package manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import config.DB;
import crypt.BCrypt;

public class ManagerDAO {
	
	public ManagerDTO managerDetail(String userid) {
		ManagerDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DB.getConn();
			String sql = "select * from manager where userid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new ManagerDTO();
				dto.setUserid(rs.getString("userid"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setName(rs.getString("name"));	
				dto.setEmail(rs.getString("email"));
				dto.setJoin_date(rs.getDate("join_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(pstmt!=null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}//finally
		return dto;
	}//end memberDetail()
	
	public void insert(ManagerDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConn();
			String sql = "insert into manager (userid,passwd,nameemail,) values (?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try { 
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}//end insert()
	
	public List<ManagerDTO> managerList(){
		List<ManagerDTO> items=new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DB.getConn();
			String sql = "select * from manager order by userid";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ManagerDTO dto = new ManagerDTO();
				dto.setUserid(rs.getString("userid"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setJoin_date(rs.getDate("join_date"));
				items.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(pstmt!=null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}//finally
		return items;
	}

	
	public String loginCheck(ManagerDTO dto) {
		String result = "";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=DB.getConn();
			String sql 
			= "select * from manager where userid=? and passwd=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getPasswd());
			rs = pstmt.executeQuery();
			if(rs.next()) {//로그인 성공
				result=rs.getString("name") + "님 환영합니다.";
			}else {//로그인 실패
				result="로그인 실패";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(pstmt!=null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}

	
	//bcrypt 방식의 비밀번호 암호화 처리
	public void insertBcrypt(ManagerDTO dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		try {
			conn = DB.getConn();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into manager ");
			sql.append(" (userid,passwd,name,email) values ");
			sql.append(" (?,?,?,?)");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getUserid());
			String passwd = 
				BCrypt.hashpw(dto.getPasswd(), BCrypt.gensalt());
			pstmt.setString(2, passwd);
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}//finally
	}//insertBcrypt(MemberDTO dto)

	public String loginCheckBcrypt(ManagerDTO dto) {
		String result = "";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=DB.getConn();
			String sql = 
				"select * from manager where email=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			rs = pstmt.executeQuery();
			if(rs.next()) {//로그인 성공
				String passwd = rs.getString("passwd");
				// checkpw(평문, 암호문)
				if (BCrypt.checkpw(dto.getPasswd(), passwd)) {
					result = rs.getString("name")+"님 환영합니다.";
				} else {
					result = "로그인 실패";
				}
			}else {//로그인 실패
				result = "로그인 실패";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	

}//end class
