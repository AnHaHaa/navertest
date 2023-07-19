package board.spring.mybatis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@Controller
public class MemberBoardController {
	@Autowired
	@Qualifier("memberServiceImpl")
	MemberService service;
	
	@GetMapping("/boardlogin")
	public String login() {
		return "/board/loginform";
	}
	
	@PostMapping("/boardlogin") 
	public String loginprocess(String memberid, int pw, HttpSession session) { //세션 선언하면 자동 생성
		//1) c_member id / pw 확인
		MemberDTO dto = service.oneMember(memberid);
		
		if(dto!=null) {
			if(dto.getPw()==pw) {
				//HttpSession 객체 'sessionid':id 저장
				session.setAttribute("sessionid", memberid);
			}else {
				//암호다시입력
				session.setAttribute("sessionid", "암호 재입력");
			}
		}else {
			//id가 존재하지 않음
			session.setAttribute("sessionid", "id 존재하지 않음");
		}
		
		return "/board/start";
	}
	
	@RequestMapping("/boardlogout")
	public String logout(HttpSession session) {
		if(session.getAttribute("sessionid")!=null) {
			session.removeAttribute("sessionid");
		}
		return "/board/start";
	}
	
	@RequestMapping("/boardwrite")
	public String write(HttpSession session) {
		return "/board/start";
	}
	
}
