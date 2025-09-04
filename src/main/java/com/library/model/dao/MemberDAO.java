package com.library.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class MemberDAO {

	public int insertMember(Member member, Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		int result =  0;
		String query = "INSERT INTO MEMBER_TBL VALUES(?,?,?,?,?,?,DEFAULT)";
		
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, member.getMemberId());
		pstmt.setString(2, member.getMemberPw());
		pstmt.setString(3, member.getMemberName());
		pstmt.setString(4, member.getPhone());
		pstmt.setString(5, member.getGender());
		pstmt.setInt(6, member.getAge());
		pstmt.setString(7, member.getAdminYN());
		
		result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		
		
		return result;
		
	}

	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
