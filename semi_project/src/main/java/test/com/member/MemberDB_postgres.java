package test.com.member;

public interface MemberDB_postgres {
	String DRIVER_NAME = "oracle.jdbc.OracleDriver";
	String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	String USER = "KOSTA";
	String PASSWORD = "hi123456";
	
	String SQL_LOGIN = "select * from member where member_name=? and password=?";
	String SQL_INSERT = "INSERT INTO member (member_id,nickname,member_name,password,age,handy,location,gender,role,image_url)"
			+ "values(SEQ_MEMBER.nextval ,?,?,?,?,?,?,?,'ROLE_MEMBER','default.png')";
	String SQL_ID_CHECK = "select * from member where member_name=?";
	String SQL_NICK_CHECK = "select * from member where NICKNAME=?";


}
