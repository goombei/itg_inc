package inc.itgbbs.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import inc.itgbbs.dao.EventDao;
import inc.itgbbs.domain.BoardDTO;
import inc.itgbbs.domain.EventDTO;
import inc.itgbbs.util.FileUtil;
import inc.itgbbs.util.TimeConvert;

@Controller
public class EventWriteController {

	private Logger log=Logger.getLogger(this.getClass());
	
	@Autowired
	private EventDao eventDao;//메서드호출

	/*
	  public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
		System.out.println("InsertController의 setMemberDao()호출");
	}*/
	
	//입력->insertForm.jsp->액션컨트롤러 필요
	//submit->요청명령어가 틀리면->따로 작성(p303)
	//1.Get방식value="/요청명령어",method=RequestMethod.GET
	@RequestMapping(value="/evinfo/eventWrite.do",method=RequestMethod.GET)
		public String form(){
		    System.out.println("form()");
			return "eventWriteForm";//이동할 페이지명
		}
	//커맨드 객체 초기화->사용자로부터 값을 입력받은 부분(객체)->Model
	@ModelAttribute("command")
	//public MemberCommand test(){
	public BoardDTO makeBoardDTO(){
		System.out.println("makeBoardDTO()호출됨");
		return new BoardDTO();
	}
	
	
	
	//2.Post방식
	@RequestMapping(value="/evinfo/eventWrite.do",method=RequestMethod.POST)
	public String submit(@ModelAttribute("command") BoardDTO command,
									@ModelAttribute("event") EventDTO event,
									BindingResult result,
									HttpServletRequest request){
		System.out.println("writeForm post="+command +"event=" + event);
//		ReviewDTO review = null;
		//전달되는 입력값들,유효성검사 결과값
		if(log.isDebugEnabled()){
			log.debug("BoardDTO="+command);//앞에서 입력받은값을 확인
		}
/*		//유효성 체크메서드 호출
		new ReviewWriteValidator().validate(command, result);
		//만약에 필수입력인데 입력을 하지 않았다면
		if(result.hasErrors()){ //입력받은 값에 문제가 발생이 된다면
			return form();//insertForm.jsp로 되돌아가라
		}
*/		//파일업로드 유무
		try{
			String newName="";//업로드할 파일명 저장
			//파일업로드된 파일이 존재한다면
			if(!command.getUpload().isEmpty()){
				//맨처음에 업로드한 파일명(바꾸기전의 파일명)
				newName=FileUtil.rename
						             (command.getUpload().getOriginalFilename());
				System.out.println("newName="+newName);
				command.setAfile("/img/"+newName);//DB에 저장하기 직전에 저장(변경파일명)
				event.setEimg("/img/"+newName);//DB에 저장하기 직전에 저장(변경파일명)
			}
			else
			{
				command.setAfile(" ");//DB에 저장하기 직전에 저장(변경파일명)
				event.setEimg(" ");//DB에 저장하기 직전에 저장(변경파일명)
			}
			//최대값을 구하기->+1
			int newSeq=eventDao.getNewAnum()+1;
			System.out.println("eventDao.getNewSeq()="+eventDao.getNewAnum());
			System.out.println("newSeq="+newSeq);
			
			command.setAnum(newSeq);
			String ip = request.getRemoteAddr();
			command.setIp(ip);
			command.setCategory(1); // 이벤트
			TimeConvert tc = new TimeConvert();
			event.setBegin(tc.strToTimeStamp(event.getBeginStr()));
			event.setEnd(tc.strToTimeStamp(event.getEndStr()));
			eventDao.insertBoard(command);
			System.out.println("writeForm post="+command +"event="+event);
			event.setEvnum(command.getAnum());
			eventDao.insertEvent(event);
			
			
			
			
		    ///실질적인 업로드가 될 수있도록
		    if(!command.getUpload().isEmpty()){ //탐색기의 파일=>업로드위치 복사
		    	File file=new File(FileUtil.UPLOAD_PATH+"/"+newName);
		    	//Multipart객체명.transferTo(이동할 경로포함한 파일의 정보객체명)//복사해줌
		    	command.getUpload().transferTo(file);
		    }
		}catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:/evinfo/list.do";//redirect:/요청명령어
	}
}