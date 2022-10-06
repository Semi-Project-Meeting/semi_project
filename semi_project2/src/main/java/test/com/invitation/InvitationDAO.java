package test.com.invitation;

import test.com.member.MemberVO;

public interface InvitationDAO {

	/*
	 * 만든이 : 박지연
	 * 기능 : 친구 검색하기
	 */
	public MemberVO searchOne(String searchKey, String searchWord, long meeting_id);
	
	/*
	 * 만든이 : 박지연
	 * 기능 : 초대하기
	 */
	public int insert(String meeting_id, String i_member_id);
	
}
