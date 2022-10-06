package test.com.member;

import java.util.List;

public interface MemberDAO {
	
	/*
	 * 만든이 : 신유수
	 * 기능 : 회원가입하기
	 */
	public int insert(MemberVO vo);

	/*
	 * 만든이 : 신유수
	 * 기능 : 회원 정보 수정하기
	 */
	public int update(MemberVO vo);

	/*
	 * 만든이 : 신유수
	 * 기능 : 회원 삭제하기
	 */
	public int delete(MemberVO vo);

	/*
	 * 만든이 : 박지연
	 * 기능 : 회원 목록보기
	 */
	public List<MemberVO> selectAll();
	
	/*
	 * 만든이 : 신유수
	 * 기능 : 아이디 중복체크
	 */
	public MemberVO idCheck(MemberVO vo);
	
	/*
	 * 만든이 : 신유수
	 * 기능 : 닉네임 중복체크
	 */
	public MemberVO nickNameCheck(MemberVO vo);

	/*
	 * 만든이 : 신유수
	 * 기능 : 로그인
	 */
	public MemberVO login(MemberVO vo);
	
	/*
	 * 만든이 : 신유수
	 * 기능 : 회원 상세보기
	 */
	public MemberVO selectOne(String member_id);


}
