package com.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.board.domain.BoardVo;
import com.board.menus.domain.MenuVo;
@Mapper
public interface BoardMapper {

	List<BoardVo> getBoardList(MenuVo menuVo);

	BoardVo getBoard(BoardVo boardVo);

	void incHit(BoardVo boardVo);

	void delete(BoardVo boardVo);

	void update(BoardVo boardVo);

	void insert(BoardVo boardVo);

}
