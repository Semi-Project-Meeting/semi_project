package test.com.board;

import java.util.List;


public interface BoardDAO {
	
	/*
	 * 만든이 : 신유수
	 * 기능 : 게시판 작성하기
	 */
	public int createBoard(BoardVO vo);
	
	/*
	 * 만든이 : 신유수
	 * 기능 : 게시판 수정하기
	 */
	public int update(BoardVO vo);
	
	/*
	 * 만든이 : 신유수
	 * 기능 : 게시판 삭제하기
	 */
	public int delete(BoardVO vo);
	
	/*
	 * 만든이 : 신유수
	 * 기능 : 게시판 리스트
	 */
	public List<BoardVO> selectAll();
	
	/*
	 * 만든이 : 신유수
	 * 기능 : 게시판 상세보기
	 */
	public BoardVO selectOne(BoardVO vo);
}
