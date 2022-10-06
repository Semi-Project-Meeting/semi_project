package test.com.notice;

import java.util.List;

public interface NoticeDAO {

	/*
	 * 만든이 : 박지연
	 * 기능 : 알림 추가
	 */
	public int insert(NoticeVO vo);

	/*
	 * 만든이 : 박지연
	 * 기능 : 알림 삭제
	 */
	public int delete(long notice_id);
	
	/*
	 * 만든이 : 박지연
	 * 기능 : 알림 목록
	 */
	public List<NoticeVO> selectAll(String member_id);
	
	/*
	 * 만든이 : 박지연
	 * 기능 : 액티비티 시작 종료
	 */
	public int activity_notice(long member_id);

}
