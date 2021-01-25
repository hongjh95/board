package com.board.service;

import java.util.List;

import com.board.domain.BoardVO;

public interface BoardService {

	// 게시판 리스트 가
	public List list() throws Exception;
	
	// 게시물 쓰기
	public void write(BoardVO vo) throws Exception;
	
	// 게시물 조회
	public BoardVO view(int bno) throws Exception;
	
	// 게시물 수정
	public void modify(BoardVO vo) throws Exception;
	
	// 게시물 삭제
	public void delete(int bno) throws Exception;
}