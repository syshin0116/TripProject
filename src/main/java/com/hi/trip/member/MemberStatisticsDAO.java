package com.hi.trip.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MemberStatisticsDAO implements MemberStatisticsInter {

	@Autowired
	SqlSessionTemplate my;

	@Override
	public void update(MemberStatisticsVO vo) {
		my.update("memberstatistics.update", vo);
	}

	@Override
	public List<MemberStatisticsVO> selectAll() {
		return my.selectList("memberstatistics.all");
	}
}
