package test.com.voting;

import java.util.List;

public interface VotingDAO {

	// 투표등록하기 
	public int insert(VotingVO vo);

	// 투표수정하기
	public int update(VotingVO vo);

	// 투표삭제하기 
	public int delete(VotingVO vo);

	// 투표리스트
	public List<VotingVO> selectAll();
}
