package com.board.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "com.board.mappers.board";

	@Override
	public List list() throws Exception {
		return sql.selectList(namespace + ".list");
	}

	// 게시물 총 갯수
	@Override
	public int count() throws Exception {
		return sql.selectOne(namespace + ".count");
	}

	@Override
	public void write(BoardVO vo) throws Exception {
		sql.insert(namespace + ".write", vo);
	}

	@Override
	public BoardVO view(int bno) throws Exception {
		
		return sql.selectOne(namespace + ".view", bno);
	}

	@Override
	public void modify(BoardVO vo) throws Exception {
		sql.update(namespace + ".modify", vo);
	}

	@Override
	public void delete(int bno) throws Exception {
		sql.delete(namespace + ".delete", bno);
	}

	@Override
	public void view_update(int bno) throws Exception {
		sql.update(namespace + ".view_update", bno);

	}



	// 게시물 목록 +검색
	@Override
	public List<BoardVO> listSearch(String searchType, String keyword) throws Exception {

		HashMap<String, Object> data = new HashMap<String, Object>();

		data.put("searchType", searchType);
		data.put("keyword", keyword);

		return sql.selectList(namespace + ".listSearch", data);
	}

}