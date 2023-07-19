package board.spring.mybatis;

import java.util.HashMap;
import java.util.List;

public interface BoardService {
	int insertBoard(BoardDTO dto);
	int getTotalBoard();
	List<BoardDTO> getPagingBoard(int num1, int num2);
	BoardDTO getOneBoard(int seq);
	int deleteBoard(int seq);
	int updateBoard(BoardDTO dto);
	List<BoardDTO> searchAllList(HashMap<String, String> map);
	List<BoardDTO> searchDetailList(HashMap<String, String> map);
	int getSearchBoard(HashMap<String, String> map);
	BoardMemberDTO boardWriterInform(int seq);
	
	
	List<BoardDTO> getTotalBoard2(SearchDTO dto);
	int getCount(SearchDTO dto);
}
