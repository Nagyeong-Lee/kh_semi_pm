package dao;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.MemberDTO;

public class MemberDAO {
	private static MemberDAO instance;
	synchronized public static MemberDAO getInstance() {
		if(instance == null) {

			instance = new MemberDAO();
		}
		return instance;
	}

	private MemberDAO() {}
	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}


	// 암호화 메서드
	public static String getSHA256(String input){

		String toReturn = null;

		try {

			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			digest.reset();
			digest.update(input.getBytes("utf8"));
			toReturn = String.format("%064x", new BigInteger(1, digest.digest()));

		} catch (Exception e) {
			e.printStackTrace();

		}
		return toReturn;

	}


	// ID 중복확인
	public boolean isIdExist(String id) throws Exception{
		String sql = "select * from member where id = ?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, id);
			try(ResultSet rs = pstat.executeQuery();){
				return rs.next();
			}
		}
	}


	// NICKNAME 중복확인
	public boolean isNicknameExist(String nickname) throws Exception{
		String sql = "select * from member where nickname = ?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, nickname);
			try(ResultSet rs = pstat.executeQuery();){
				return rs.next();
			}
		}
	}


	// 회원가입
	public int insert(MemberDTO dto) throws Exception{
		String sql = "insert into member values(? , ? , ? , ? , ? , ? , ? , ? , ? , sysdate)";
		try(Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){

			pstat.setString(1, dto.getId());
			pstat.setString(2,dto.getNickname());
			pstat.setString(3, getSHA256(dto.getPw()));
			pstat.setString(4, dto.getName());
			pstat.setString(5, dto.getPhone());
			pstat.setString(6, dto.getEmail());
			pstat.setString(7, dto.getPostcode());
			pstat.setString(8, dto.getAddress1());
			pstat.setString(9, dto.getAddress2());
			int result = pstat.executeUpdate();

			con.commit();
			return result;
		}
	}


	// 마이페이지 회원정보
	public MemberDTO selectById(String id) throws Exception{// 마이페이지 회원정보출력
		String sql = "select * from member where id = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){

			pstat.setString(1, id);
			try(ResultSet rs = pstat.executeQuery();){

				rs.next();
				MemberDTO dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setNickname(rs.getString("nickname"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				String totalEmail=rs.getString("email");
				int indexOfEmail=totalEmail.indexOf("@");
				String email=totalEmail.substring(0,indexOfEmail);
				System.out.println(email);
				dto.setEmail(email);
				dto.setPostcode(rs.getString("postcode"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setSignup_date(rs.getTimestamp("signup_date"));
				return dto;
			}

		}

	}


	// 마이페이지 회원정보수정
	public int update(MemberDTO dto) throws Exception{ // 회원정보수정
		String sql = "update member set nickname=?, pw=?, name=?, phone=?, email=?, postcode=?, address1=?, address2=? where id=?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, dto.getNickname());
			pstat.setString(2, getSHA256(dto.getPw()));
			pstat.setString(3, dto.getName());
			pstat.setString(4, dto.getPhone());
			pstat.setString(5, dto.getEmail());
			pstat.setString(6, dto.getPostcode());
			pstat.setString(7, dto.getAddress1());
			pstat.setString(8, dto.getAddress2());
			pstat.setString(9, dto.getId());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}


	// 마이페이지 회원탈퇴
	public int delete(String id) throws Exception{ // 회원탈퇴
		String sql = "delete from member where id=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setString(1, id);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}

	}


	//로그인
	public boolean isloginExist(String id, String pw) throws Exception{
		String sql="select * from member where id=? and pw=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, id);
			pstat.setString(2, getSHA256(pw));
			try(ResultSet rs = pstat.executeQuery();){
				return rs.next();
			}
		}
	}

	// 관리자페이지_회원 전체 조회
	public List<MemberDTO> selectAll() throws Exception{
		String sql = "select * from member order by SIGNUP_DATE desc";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();){

			List<MemberDTO> list = new ArrayList<>();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setNickname(rs.getString("nickname"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setEmail(rs.getString("email"));
				dto.setPostcode(rs.getString("postcode"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setSignup_date(rs.getTimestamp("signup_date"));
				list.add(dto);
			}
			return list;
		}
	}
}