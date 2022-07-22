package kr.ac.kopo.board.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.board.service.BoardService;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.framework.ModelAndView;
import kr.ac.kopo.framework.annotation.Controller;
import kr.ac.kopo.framework.annotation.RequestMapping;

/*
 * 전체 게시글 조회 	/board/list.do			list()
 * 새글등록(form) 	/board/writeForm.do		writeForm()
 * 새글등록		/board/write.do			write()
 * 상세게시글조회	/board/detail..do		detail()
 * 게시글수정		
 * 게시글삭제		
 */
@Controller
public class BoardController {
	
	@RequestMapping(value = "/board/list.do")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		ServletContext sc = request.getServletContext();
		
		BoardService service= (BoardService)sc.getAttribute("boardService");
		List<BoardVO> boardList = service.selectAllboard();
		
		ModelAndView mav = new ModelAndView("/jsp/board/list.jsp");
		mav.setAttribute("list", boardList);
		return mav;
	}
	
	@RequestMapping("/board/detail.do")
	public ModelAndView  detail(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int no = Integer.parseInt(request.getParameter("no"));
		
		ServletContext sc = request.getServletContext();
		BoardService service = (BoardService)sc.getAttribute("boardService");
		BoardVO board = service.selectBoardByNo(no);
		
		ModelAndView mav = new ModelAndView();
		mav.setView("/jsp/board/detail.jsp");
		mav.setAttribute("board", board);
		
		return mav;
	}
	
	@RequestMapping("/board/writeForm.do")
	public ModelAndView writeForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView("/jsp/board/writeForm.jsp");
		
		return mav;
	}
}
