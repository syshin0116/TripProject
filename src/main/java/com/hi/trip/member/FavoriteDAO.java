package com.hi.trip.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class FavoriteDAO implements FavoriteInter {

	@Autowired
	SqlSessionTemplate my;
	
	@Override
	public void create(FavoriteVO vo)
	{
		my.insert("favorite.create", vo);
	}
	
	@Override
	public List<FavoriteVO> selectFromMember(FavoriteVO vo)
	{
		return my.selectList("favorite.selectFromMember", vo);
	}
	
	@Override
	public void delete(FavoriteVO vo)
	{
		my.delete("favorite.delete", vo);
	}
	
	
}
