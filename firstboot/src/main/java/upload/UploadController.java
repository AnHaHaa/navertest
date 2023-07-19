package upload;

import java.io.IOException;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UploadController {
	// 업로드 form 화면 리턴
	@GetMapping("/fileupload")
	public String uploadForm() {
		return "/upload/uploadform";
	}

	// 업로드 처리 결과 화면 리턴
	@PostMapping("/fileupload")
	public ModelAndView uploadResult(UploadDTO dto) throws IOException {
		String savePath = "c:/kdt/upload/";
		
		//프로젝트 외부 경로 = 기본적으로 브라우저 url 접근 공간X
		//프로젝트 내부 경로 = 
		
		// System.out.println(UUID.randomUUID().toString());
		// bbde385c-a76c-45d9-be0a-7ae879805f88 랜덤문자열 생성
		// pom(bbde385c-a76c-45d9-be0a-7ae879805f88).xml 로 만들기 (파일 중복 피하기 위함)

		MultipartFile file1 = dto.getFile1();
		String newfilename1 = "";
		if (!file1.isEmpty()) {
			String originalname1 = file1.getOriginalFilename(); // 전송된 파일 이름
			String beforeext1 = originalname1.substring(0, originalname1.indexOf("."));
			String ext1 = originalname1.substring(originalname1.indexOf("."));
			newfilename1 = beforeext1 + "(" + UUID.randomUUID().toString() + ")" + ext1;

			file1.transferTo(new java.io.File(savePath + newfilename1));
		}

		MultipartFile file2 = dto.getFile2();
		String newfilename2 = "";
		if (!file2.isEmpty()) {
			String originalname2 = file2.getOriginalFilename(); // 전송된 파일 이름
			String beforeext2 = originalname2.substring(0, originalname2.indexOf("."));
			String ext2 = originalname2.substring(originalname2.indexOf("."));
			newfilename2 = beforeext2 + "(" + UUID.randomUUID().toString() + ")" + ext2;

			file2.transferTo(new java.io.File(savePath + newfilename2));
		}

		ModelAndView mv = new ModelAndView();
		mv.addObject("uploadresult1", savePath + newfilename1 + "파일에 저장했습니다.");
		mv.addObject("uploadresult2", savePath + newfilename2 + "파일에 저장했습니다.");
		mv.setViewName("upload/uploadresult");
		return mv;
	}
}
