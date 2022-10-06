package test.com.meeting;

import java.util.List;

import test.com.member.MemberVO;

public interface MeetingDAO {

	/*
	 * 만든이 : 최현민
	 * 기능 : 모임 개설하기
	 */
	public int insert(MeetingVO vo);

	/*
	 * 만든이 : 최현민
	 * 기능 : 모임 수정하기
	 */
	public int update(MeetingVO vo);

	// 모임 탈퇴하기 
	public int leave(MemberVO vo);

	/*
	 * 만든이 : 최현민
	 * 기능 : 모임 목록보기
	 */
	public List<MeetingVO> selectAll();

	/*
	 * 만든이 : 최현민
	 * 기능 : 모임 검색하기
	 */
	public List<MeetingVO> searchList(MeetingVO vo,String searchWord);

	/*
	 * 만든이 : 최현민
	 * 기능 : 모임 상세보기 
	 */
	public MeetingVO selectOne(MeetingUserVO vo);
	
	/*
	 * 만든이 : 최현민
	 * 기능 : 모임 입장하기
	 */
	public int enter(MeetingUserVO vo);

	/*
	 * 만든이 : 박지연
	 * 기능 : 내 모임 목록보기
	 */
	public List<MeetingVO> mySelectAll(String member_id);
	
	/*
	 * 만든이 : 박지연
	 * 기능 : 추천 모임 목록보기
	 */
	public List<MeetingVO> recommendSelectAll(String member_id);
}
