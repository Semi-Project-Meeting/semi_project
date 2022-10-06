package test.com.invitation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import test.com.member.MemberVO;
import test.com.notice.NoticeDAO;
import test.com.notice.NoticeDAOimpl;
import test.com.notice.NoticeVO;
import test.com.utils.DB_oracle;

public class InvitationDAOimpl implements InvitationDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	private NoticeDAO noticeDAO = new NoticeDAOimpl();

	public InvitationDAOimpl() {
		try {
			Class.forName(DB_oracle.DRIVER_NAME);
			System.out.println("Driver Successed...");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	@Override
	public MemberVO searchOne(String searchKey, String searchWord, long meeting_id) {
		MemberVO vo = new MemberVO();
		searchKey = "nick";
		try {
			conn = DriverManager.getConnection(DB_oracle.URL, DB_oracle.USER, DB_oracle.PASSWORD);

			// 분기처리
			if (searchKey.equals("nick")) {
				pstmt = conn.prepareStatement(DB_oracle.MEMBER_SEARCH_NAME);
			}

			pstmt.setString(1, searchWord);
			pstmt.setLong(2, meeting_id);

			rs = pstmt.executeQuery();

			// rs.next() 읽어올 것이 있으면
			while (rs.next()) {
				vo.setMember_id(rs.getLong("member_id"));
				vo.setMember_name(rs.getString("member_name"));
				vo.setNickname(rs.getString("nickname"));
				vo.setImage_url(rs.getString("image_url"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // close가 있어서 finally 해줘야ㅕ 됨.
			if (rs != null) {
				try {
					rs.close(); // 나중에 쓴걸 먼저 닫는다.
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		} // end finally
		return vo;
	}

	@Override
	public int insert(String meeting_id, String i_member_id) {

		try {
			conn = DriverManager.getConnection(DB_oracle.URL, DB_oracle.USER, DB_oracle.PASSWORD);
			pstmt = conn.prepareStatement(DB_oracle.MEETING_SELECT_ONE);
			pstmt.setLong(1, Long.parseLong(meeting_id));

			rs = pstmt.executeQuery();
			rs.next();
			String name = rs.getString("name");

			NoticeVO noticeVO = new NoticeVO("\'" + name + "\'" + "모임에 초대되었습니다.", Long.parseLong(i_member_id),
					Long.parseLong(meeting_id));
			int flag = noticeDAO.insert(noticeVO);
			if(flag==1) System.out.println("알림 push 완료");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // close가 있어서 finally 해줘야ㅕ 됨.
			if (rs != null) {
				try {
					rs.close(); // 나중에 쓴걸 먼저 닫는다.
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		} // end finally
		return 1;
	}

}
