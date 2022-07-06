package com.hi.trip.placeComment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.hi.trip.place.PlaceVO;

@Component // 싱글톤으로 만들어달라고 스프링에게 요청
public class ReviewDAO {

	@Autowired
	SqlSessionTemplate my;
	//리뷰 페이지
		public List<ReviewVO> pReview(ReviewVO vo) {
			return my.selectList("review.list", vo); //place.XML의 namespace이름.id
		}

	//리뷰 업로드
	public int create(ReviewVO vo) {
		int result = 0;
		try {
			result = my.insert("review.create", vo);
		}catch(Exception e) {
			System.out.println("에러발생.");
		}
		return result;
	}

	//리뷰수정
	public int up(ReviewVO vo) {
		return my.update("review.up", vo);
	}
	//리뷰 삭제
	public int del(ReviewVO vo) {
		return my.delete("review.del", vo);
	}
	//리뷰보기
	public ReviewVO one(ReviewVO vo) {
		return my.selectOne("review.one", vo);
	}


}