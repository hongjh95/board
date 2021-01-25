package com.board.dao;

import java.util.List;

import com.board.domain.BoardVO;

public interface BoardDAO {

	// 기시물 가져오기
	public List list() throws Exception;

	// 게시물 총 갯수
	public int count() throws Exception;

	// 게시물 작성
	public void write(BoardVO vo) throws Exception;

	// 게시물 조회
	public BoardVO view(int bno) throws Exception;

	// 게시물 조회수 증가
	public void view_update(int bno) throws Exception;

	// 게시물 수정
	public void modify(BoardVO vo) throws Exception;

	// 게시뮬 삭제
	public void delete(int bno) throws Exception;

	// 게시물 목록 + 페이징
	public List listPage(int displayPost, int postNum) throws Exception;

	// 게시물 목록 + 페이징 + 검색
	public List<BoardVO> listSearch(String searchType, String keyword) throws Exception;

}