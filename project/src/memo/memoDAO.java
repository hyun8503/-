package memo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import config.DB;
import memo.memoDTO;


public class memoDAO {

	public List<memoDTO> listMemo() {
		List<memoDTO> list=new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DB.getConn();
			String sql = "select * from memo order by post_date desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				memoDTO dto = new memoDTO();
				dto.setName(rs.getString("name"));
				dto.setMemo(rs.getString("memo"));
				dto.setPost_date(rs.getString("post_date"));
				list.add(dto);
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
		return list;
	}//end 
	public void insert(memoDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConn();
			String sql = "insert into memo (name, memo) values (?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getMemo());
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
	public void delete(String name) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConn();
			String sql = "delete from memo where name=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
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
}