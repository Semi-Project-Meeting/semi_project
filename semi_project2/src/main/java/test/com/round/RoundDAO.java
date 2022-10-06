package test.com.round;

import java.util.List;

public interface RoundDAO {

	/*
	 * 만든이 : 최현민
	 * 기능 : 라운드 개설하기
	 */
	public int insert(RoundVO vo);

	/*
	 * 만든이 : 최현민
	 * 기능 : 라운드 수정하기
	 */
	public int update(RoundVO vo);

	/*
	 * 만든이 : 최현민
	 * 기능 : 라운드 목록보기
	 */
	public List<RoundVO> selectAll();

	/*
	 * 만든이 : 박지연
	 * 기능 : 내 라운드 목록보기
	 */
	public List<RoundVO> mySelectAll(String member_id);

	/*
	 * 만든이 : 최현민
	 * 기능 : 라운드 검색하기
	 */
	public List<RoundVO> searchList(String searchWord);

	/*
	 * 만든이 : 최현민
	 * 기능 : 라운드 상세보기
	 */
	public RoundVO selectOne(RoundUserVO vo1);
	
	/*
	 * 만든이 : 최현민
	 * 기능 : 라운드 입장하기
	 */
	public int enter(RoundUserVO vo);

	
}
