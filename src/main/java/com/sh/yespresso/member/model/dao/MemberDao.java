package com.sh.yespresso.member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.sh.yespresso.member.model.dto.Gender;
import com.sh.yespresso.member.model.dto.Member;
import com.sh.yespresso.member.model.dto.MemberRole;
import com.sh.yespresso.member.model.exception.MemberException;
public class MemberDao {
	private Properties prop = new Properties();
	
	public MemberDao() {
		String path = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		} catch(IOException e) {
			e.printStackTrace();
		}
		System.out.println("[query load 완료!]" + prop);
	}
	/**
	 * hj start
	 */
	/**
	 * hj end
	 */


	/**
	 * yeji start
	 */
	/**
	 * yeji end
	 */


	/**
	 * awon start
	 */


	public int UpdateMember(Connection conn, Member member) {
		// updateMember = update member set member_name = ?, birthday = ?, email = ?, phone = ?, address = ? where member_id = ?
		String sql = prop.getProperty("updateMember");
		int result = 0;
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, member.getMemberName());
			pstmt.setDate(3, member.getBirthday());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getPhone());
			pstmt.setString(6, member.getAddress());
			pstmt.setString(7, member.getMemberId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw new MemberException("회원정보 수정 오류", e);
		}
		return result;
	}
	/**
	 * awon end
	 */


	/** * jooh start */
	public Member selectOneMember(Connection conn, String memberId) {
		String sql = prop.getProperty("SelectOneMember");
		Member member = null;
		
		// 1. PreparedStatement 객체 생성 및 미완성 쿼리 값대입
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, memberId);
			
			// 2. pstmt 실행 및 결과반환
			try(ResultSet rset = pstmt.executeQuery()){
				
				// 3. ResultSet -> dto 객체
				while(rset.next()) {
					member = handleMemberResultSet(rset);
				}
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return member;
	}
	
	private Member handleMemberResultSet(ResultSet rset) throws SQLException {
		Member member = new Member();
		member.setMemberId(rset.getString("MEMBER_ID"));
		member.setMemberRole(MemberRole.valueOf(rset.getString("FK_MEMBER_ROLE_ID")));
		member.setPassword(rset.getString("PASSWORD"));
		member.setMemberName(rset.getString("MEMBER_NAME"));
		member.setBirthday(rset.getDate("BIRTHDAY"));
		member.setGender(rset.getString("GENDER") != null ?
							Gender.valueOf(rset.getString("GENDER")) : 
								null);
		member.setEmail(rset.getString("EMAIL"));
		member.setPhone(rset.getString("PHONE"));
		member.setAddress(rset.getString("ADDRESS"));
		member.setEnrollDate(rset.getTimestamp("ENROLL_DATE"));
		return member;
	}
	/** * jooh end */


}








