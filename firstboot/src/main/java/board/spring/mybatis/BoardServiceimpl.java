package board.spring.mybatis;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceimpl implements BoardService {
	@Autowired
	BoardDAO dao;
	
	
	@Override
	public int getCount(SearchDTO dto) {
		return dao.getCount(dto);
	}

	//------------------------------------------
	public PagingResponse<BoardDTO> getTotalBoard22(SearchDTO dto) {

        // 조건에 해당하는 데이터가 없는 경우, 응답 데이터에 비어있는 리스트와 null을 담아 반환
        int count = dao.getCount(dto);
        if (count < 1) {
            return new PagingResponse<>(Collections.emptyList(), null);
        }

        // Pagination 객체를 생성해서 페이지 정보 계산 후 SearchDto 타입의 객체인 params에 계산된 페이지 정보 저장
        Pagination pagination = new Pagination(count, dto);
        dto.setPagination(pagination);

        // 계산된 페이지 정보의 일부(limitStart, recordSize)를 기준으로 리스트 데이터 조회 후 응답 데이터 반환
        List<BoardDTO> list = dao.getTotalBoard2(dto);
        return new PagingResponse<>(list, pagination);
    }
	//------------------------------------------
	
	
	@Override
	public List<BoardDTO> getTotalBoard2(SearchDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertBoard(BoardDTO dto) {
		return dao.insertBoard(dto);
	}

	@Override
	public int getTotalBoard() {
		return dao.getTotalBoard();
	}

	@Override
	public List<BoardDTO> getPagingBoard(int num1, int num2) {
		ArrayList<Integer> array = new ArrayList<Integer>();
		array.add(num1);
		array.add(num2);
		return dao.getPagingBoard(array);
	}

	@Override
	public BoardDTO getOneBoard(int seq) {
		dao.updateViewCount(seq);
		return dao.getOneBoard(seq);
	}

	@Override
	public int deleteBoard(int seq) {
		return dao.deleteBoard(seq);
	}

	@Override
	public int updateBoard(BoardDTO dto) {
		return dao.updateBoard(dto);
	}

	@Override
	public List<BoardDTO> searchAllList(HashMap<String, String> map) {
		return dao.searchAllList(map);
	}

	@Override
	public List<BoardDTO> searchDetailList(HashMap<String, String> map) {
		return dao.searchDetailList(map);
	}

	@Override
	public int getSearchBoard(HashMap<String, String> map) {
		return dao.getSearchBoard(map);
	}

	@Override
	public BoardMemberDTO boardWriterInform(int seq) {
		return dao.boardWriterInform(seq);
	}
	
	

}
