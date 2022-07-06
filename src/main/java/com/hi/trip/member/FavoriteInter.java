package com.hi.trip.member;

import java.util.List;

public interface FavoriteInter {

	void create(FavoriteVO vo);

	List<FavoriteVO> selectFromMember(FavoriteVO vo);

	void delete(FavoriteVO vo);

}