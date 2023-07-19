package board.spring.mybatis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface BoardDAO {
	public int insertBoard(BoardDTO dto);
	public int getTotalBoard();
	public List<BoardDTO> getPagingBoard(ArrayList<Integer> array);
	public BoardDTO getOneBoard(int seq);
	public int updateViewCount(int seq);
	public int deleteBoard(int seq);
	public int updateBoard(BoardDTO dto);
	public List<BoardDTO> searchAllList(HashMap<String, String> map);
	public List<BoardDTO> searchDetailList(HashMap<String, String> map);
	public int getSearchBoard(HashMap<String, String> map);
	public BoardMemberDTO boardWriterInform(int seq);
	
	List<BoardDTO> getTotalBoard2(SearchDTO dto);
	int getCount(SearchDTO dto);
}
