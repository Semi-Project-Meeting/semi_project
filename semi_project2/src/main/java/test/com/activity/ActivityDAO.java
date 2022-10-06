package test.com.activity;

import java.util.List;

import test.com.meeting.MeetingVO;

public interface ActivityDAO {

	/*
	 * 만든이 : 최현민
	 * 기능 : 액티비티 개설
	 */
	public int insert(ActivityVO vo); 
	
	/*
	 * 만든이 : 최현민
	 * 기능 : 액티비티 입장
	 */
	public int enter(ActivityUserVO vo);

	// 액티비티 수정하기     
	public int update(ActivityVO vo);

	// 액티비티 삭제하기      
	public int delete(ActivityVO vo);

	/*
	 * 만든이 : 최현민
	 * 기능 : 액티비티 목록
	 */
	public List<ActivityVO> selectAll();
	
	/*
	 * 만든이 : 박지연
	 * 기능 : 내 액티비티 목록
	 */
	public List<ActivityVO> mySelectAll(String member_name, String activityState);
	
	/*
	 * 만든이 : 박지연
	 * 기능 : 모임 내 액티비티 리스트
	 */
	public List<ActivityVO> inSelectAll(String meeting_id, String activityState);

	// 액티비티 검색하기     
	public List<ActivityVO> searchList(String key, String value);

	/*
	 * 만든이 : 박지연
	 * 기능 : 추천 액티비티 리스트
	 */
	public List<ActivityVO> recommendSelectAll(String member_id, String category);
	
	/*
	 * 만든이 : 박지연
	 * 기능 : 마감 액티비티 리스트
	 */
	public List<ActivityVO> imminentSelectAll(String member_id);
}
