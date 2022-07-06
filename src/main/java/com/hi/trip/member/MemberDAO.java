package com.hi.trip.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MemberDAO implements MemberInter {

	@Autowired
	SqlSessionTemplate my;
	
	@Override
	public void create(MemberVO vo) 
	{
		my.insert("member.create", vo);
	}
	
	@Override
	public void update(MemberVO vo) 
	{
		my.update("member.update", vo);
	}
	
	@Override
	public List<MemberVO> selectAll() {
		return my.selectList("member.all");
	}
	
	@Override
	public MemberVO selectOneIdx(MemberVO vo)
	{
		return my.selectOne("member.oneIdx", vo);
	}
	
	@Override
	public MemberVO selectOneId(MemberVO vo)
	{
		return my.selectOne("member.oneId", vo);
	}
	
	@Override
	public MemberVO selectOneName(MemberVO vo)
	{
		return my.selectOne("member.oneName", vo);
	}
	
	@Override
	public MemberVO loginHiTrip(MemberVO vo)
	{
		return my.selectOne("member.loginHiTrip", vo);
	}
	
	@Override
	public MemberVO loginNaver(MemberVO vo)
	{
		return my.selectOne("member.loginNaver", vo);
	}
	
	@Override
	public MemberVO loginGoogle(MemberVO vo)
	{
		return my.selectOne("member.loginGoogle", vo);
	}

	
	
	
}