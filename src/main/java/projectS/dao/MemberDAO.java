package projectS.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import projectS.dto.MemberDTO;

public class MemberDAO { 

	private Connection conn = null;
	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private DataSource ds;

	//커넥션풀
	public MemberDAO() {
		try { 
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env"); 
			ds = (DataSource) envContext.lookup("jdbc/oracle");
			
			//System.out.println("커넥션풀 ds: "+ds);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//전체 조회
	public List<MemberDTO> listMember() {

		List<MemberDTO> list = new ArrayList<>();

		try {
			conn = ds.getConnection();

			String sql = "SELECT * FROM MemberTest";

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String email = rs.getString("email");
				Date joinDate = rs.getDate("joinDate");

				MemberDTO dto = new MemberDTO();
				dto.setId(id);
				dto.setPwd(pwd);
				dto.setName(name);
				dto.setEmail(email);
				dto.setJoinDate(joinDate);

				list.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if (rs != null)rs.close();} catch (Exception e2) {}
			try {if (stmt != null)stmt.close();} catch (Exception e2) {}
			try {if (conn != null)conn.close();} catch (Exception e2) {}
		}

		return list;
	}

	// 입력
	public int addMember(MemberDTO dto) {
		int result = 0;
		try {
			Connection conn = ds.getConnection();

			String id = dto.getId();
			String pwd = dto.getPwd();
			String name = dto.getName();
			String email = dto.getEmail();

			String sql = "insert into MemberTest" + "(id,pwd,name,email)" + "values(?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);
			pstmt.setString(4, email);

			// 비정상 처리시 '-1' 반환
			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 수정
	public void updateMember(MemberDTO dto) {
		try {
			Connection conn = ds.getConnection();

			String id = dto.getId();
			String pwd = dto.getPwd();
			String name = dto.getName();
			String email = dto.getEmail();
			
			String sql = "UPDATE MemberTest"
					+ " SET"
					+ " 	pwd = ?"
					+ " 	, name = ?"
					+ " 	, email = ?"
					+ " where id = ?";

			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			pstmt.setString(4, id);

			// 비정상 처리시 '-1'반환
			pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 삭제
	public void delMember(String id) {
		try {
			Connection conn = ds.getConnection();

			String sql = "delete from MemberTest where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 회원 정보 조회
	public MemberDTO getMember(String mem_id) {
		MemberDTO dto = new MemberDTO();

		try {
			Connection conn = ds.getConnection();
			String sql = "select*from MemberTest where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_id);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String email = rs.getString("email");

 				dto.setId(id);
				dto.setPwd(pwd);
				dto.setName(name);
				dto.setEmail(email);
			}
			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;

	}
//------------------------------------------T
	// 아이디, 비밀번호 확인
	public MemberDTO getID(String user_id, String user_pwd) {

		MemberDTO dto = new MemberDTO();
		try {
			Connection conn = ds.getConnection();
			
			String sql = "Select * from MemberTest where id=? and pwd=?";
	 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, user_pwd);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String id = rs.getString("id");//테이블 컬럼명
				String pwd = rs.getString("pwd");
				
				dto.setId(id);
				dto.setPwd(pwd);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
// 로그인-------------------------------ㅎㅇㅈㅂ
	/*
	public int login(MemberDTO dto) {
		int result=-1;
		
		try {
			String sql = "SELECT pwd"
						+" From MemberList"
						+" where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			
			rs = pstmt.executeQuery();
			System.out.println(pstmt);
			
			if(rs.next()) { // 아이디 일치
				if(dto.getPwd().equals(rs.getString("pwd"))) { // 비번일치
					result = 1;
				}else {		// 비번 불일치
					result = 0;
				}
			}else {			// 아이디 불일치(존재X)
				result = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			
			try {if (rs != null) rs.close();} catch (Exception e2) {}
			try {if (pstmt != null) pstmt.close();} catch (Exception e2) {}
		}
		return result;
	}
	*/
	

//아이디 중복 확인----------------------ㄱㄱㄹ
	public int idCheck(String id) { 
		System.out.println("아디");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " Select * from MemberList where id=?";
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
					
			rs = pstmt.executeQuery();
			if(rs.next() || id.equals("")) {
				return 0; // 이미 존재
			} else {
				return 1; // 가입 가능 id
			} 
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt !=null) pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return -1; // 오류
	}
}
