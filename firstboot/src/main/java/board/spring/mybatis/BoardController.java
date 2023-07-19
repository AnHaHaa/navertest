package board.spring.mybatis;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	@Autowired
	@Qualifier("boardServiceimpl")
	BoardServiceimpl service;
	
	@RequestMapping("/")
	public String start() {
		return "board/start";
	}
	
	@GetMapping("/boardwrite")
	public String writeform() {
		return "board/writingform";
	}
	
	@PostMapping("/boardwrite")
	public ModelAndView writeprocess(BoardDTO dto) {
		int insertcount = service.insertBoard(dto);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("insertcount", insertcount);
		mv.setViewName("board/writeresult");
		
		return mv;
	}
	//-------------------------------------------------------
	@RequestMapping("/boardlist2")
	public ModelAndView boardlist2(@ModelAttribute SearchDTO params) {
		PagingResponse<BoardDTO> list = service.getTotalBoard22(params);
		ModelAndView mv = new ModelAndView();
		mv.addObject("response", list);
		mv.setViewName("board/list2");
		
		return mv;
	}
	//-------------------------------------------------------

	@RequestMapping("/boardlist")
	public ModelAndView boardlist(@RequestParam(value="page", required = false, defaultValue = "1") int page) {
		//page라는 파라미터가 그대로 전달되지만 필수값은 아니며, 값이 없으면 기본값은 1
		
		//전체 게시물 개수 가져와서 몇페이지까지 가능한지 (1p당 4개 게시물)
		int totalBoard = service.getTotalBoard();
		
		//페이지에 해당하는 게시물 4개 리스트 조회하기
		int limitcount = 30;
		int limitindex = (page-1)*limitcount;
		
		List<BoardDTO> list = service.getPagingBoard(limitindex, limitcount);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("totalBoard", totalBoard);
		mv.addObject("list", list);
		mv.setViewName("board/list");
		
		return mv;
	}
	
	@RequestMapping("/boarddetail")
	public ModelAndView getOneBoard(int seq) {
		BoardDTO oneBoard = service.getOneBoard(seq);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("oneBoard", oneBoard);
		mv.setViewName("board/detail");
		
		return mv;
	}
	
	@RequestMapping("/boarddelete")
	public String boardDelete(int seq) {
		//delete처리
		service.deleteBoard(seq);
		//return "board/list"; //list.jsp이동 (모델 전달x, nullpointexception 발생)
		return "redirect:/boardlist"; //boardlist 매핑 메소드 실행 호출
	}

	@RequestMapping("/updateBoard")
	public String boardUpdate(BoardDTO dto) {
		service.updateBoard(dto);
		return "redirect:/boardlist"; //boardlist 매핑 메소드 실행 호출
	}
	
	@RequestMapping("/boardsearchlist")
	public ModelAndView boardSearchList(
			@RequestParam(value="search", required = false, defaultValue = "all") String search,
			@RequestParam(value="searchtxt", required = false, defaultValue = "") String searchtxt,
			@RequestParam(value="page", required = false, defaultValue = "1") int page) {
		List<BoardDTO> list = null;
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("searchtxt", searchtxt);
		//paging처리
		map.put("limitindex", String.valueOf((page-1)*4));
		map.put("limitcount", String.valueOf(4));
		
		if(search.equals("all")) {
			list = service.searchAllList(map);
		}else {
			list = service.searchDetailList(map);
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.addObject("totalBoard", list.size());
		mv.setViewName("board/searchlist");
		return mv;
	}
	
	@RequestMapping("/boardWriterInform")
	public ModelAndView boardWriterInform(int seq) {
		BoardMemberDTO writerdto = service.boardWriterInform(seq);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("writerdto", writerdto);
		mv.setViewName("board/writerinform");
		return mv;
	}
}
