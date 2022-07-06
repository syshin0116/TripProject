package com.hi.trip.member;

import java.util.List;

public interface MemberInter {

	void create(MemberVO vo);

	void update(MemberVO vo);

	List<MemberVO> selectAll();

	MemberVO selectOneIdx(MemberVO vo);

	MemberVO selectOneId(MemberVO vo);

	MemberVO selectOneName(MemberVO vo);

	MemberVO loginHiTrip(MemberVO vo);

	MemberVO loginNaver(MemberVO vo);

	MemberVO loginGoogle(MemberVO vo);

}