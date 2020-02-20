package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import config.DB;
import crypt.BCrypt;

public class MemberDAO {
	
	public MemberDTO memberDetail(String email) {
		MemberDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DB.getConn();
			String sql = "select * from member where email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new MemberDTO();
				dto.setEmail(rs.getString("email"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setName(rs.getString("name"));	
				dto.setCourse(rs.getString("course"));
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
	
	public void insert(MemberDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConn();
			String sql = "insert into member (email,passwd,name,course) values (?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getEmail());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getCourse());
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
	
	public List<MemberDTO> memberList(){
		List<MemberDTO> items=new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DB.getConn();
			String sql = "select * from member order by name";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setEmail(rs.getString("email"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setName(rs.getString("name"));
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

	public void update(MemberDTO dto) {
		Connection conn=null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConn();
			StringBuilder sb = new StringBuilder();
			sb.append("update member set ");
			sb.append(" passwd=?, name=?, course=?");
			sb.append(" where email=?");
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, dto.getPasswd());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getCourse());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null)
					pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn!=null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}//end update()

	public void delete(String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConn();
			String sql = "delete from member where email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.executeUpdate();//레코드 삭제
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
	}//end delete()

	public String loginCheck(MemberDTO dto) {
		String result = "";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=DB.getConn();
			String sql 
			= "select * from member where email=? and passwd=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getEmail());
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
	public void insertBcrypt(MemberDTO dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		try {
			conn = DB.getConn();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into member ");
			sql.append(" (email,passwd,name) values ");
			sql.append(" (?,?,?)");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getEmail());
			String passwd = 
				BCrypt.hashpw(dto.getPasswd(), BCrypt.gensalt());
			pstmt.setString(2, passwd);
			pstmt.setString(3, dto.getName());
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

	public String loginCheckBcrypt(MemberDTO dto) {
		String result = "";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=DB.getConn();
			String sql = 
				"select * from member where email=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getEmail());
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
