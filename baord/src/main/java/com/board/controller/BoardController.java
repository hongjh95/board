package com.board.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.dao.BoardDAO;
import com.board.domain.BoardVO;
import com.board.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Inject
	private BoardService service;
	
	// 게시물 리스트 가져오기
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(Model model) throws Exception {
		List list = null;
		list = service.list();
		model.addAttribute("list", list);
	}
	
	// 게시물 작성
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWirte() throws Exception {
	   
	}
	
	// 게시물 작성
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String postWirte(BoardVO vo) throws Exception{
		service.write(vo);
		
		return "redirect:/board/listSearch";
	}
	
	// 게시물 조회
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("bno") int bno, Model model) throws Exception {
		BoardVO vo = service.view(bno);
		if (vo != null) {
			model.addAttribute("view",vo);
		}else {
			getListSearch(model, "", "");
		}
		
	}
	
	// 게시물 수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getModify(@RequestParam("bno") int bno, Model model) throws Exception {
		BoardVO vo = service.view(bno);
		   
		model.addAttribute("view", vo);
	}
	
	// 게시물 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(BoardVO vo) throws Exception {
		service.modify(vo);
	   
		return "redirect:/board/view?bno=" + vo.getBno();
	}
	
	// 게시물 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("bno") int bno) throws Exception {
		service.delete(bno);  

		return "redirect:/board/listSearch?";
	}
	
	// 게시물 목록 + 페이징 추가
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void getListPage(Model model, @RequestParam("num") int num) throws Exception {

		// 게시물 총 갯수
		int count = service.count();

		// 한 페이지에 출력할 게시물 갯수
		int postNum = 10;

		// 하단 페이징 번호 ([ 게시물 총 갯수 ÷ 한 페이지에 출력할 갯수 ]의 올림)
		int pageNum = (int) Math.ceil((double) count / postNum);

		// 출력할 게시물
		int displayPost = (num - 1) * postNum;

		List list = null;
		list = service.listPage(displayPost, postNum);
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
	}
	
	// 게시물 목록 + 검색
	@RequestMapping(value = "/listSearch", method = RequestMethod.GET)
	public void getListSearch(Model model, @RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType,@RequestParam(value = "keyword",required = false, defaultValue = "") String keyword) throws Exception {
		
		List list = null;
		list = service.listSearch(searchType, keyword);
		
		model.addAttribute("list", list);
	}
}