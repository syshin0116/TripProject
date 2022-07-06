package com.hi.trip.member;

import java.util.List;

public interface MemberStatisticsInter {

	void update(MemberStatisticsVO vo);

	List<MemberStatisticsVO> selectAll();

}