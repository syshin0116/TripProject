package com.hi.trip.placeComment;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hi.trip.place.PlaceVO;

@Controller 

public class ReviewController {
	

		@Autowired
		ReviewDAO dao; 
		
		@RequestMapping("pReview")
		public void info1(ReviewVO vo , Model model ) {
			List<ReviewVO> list = dao.pReview(vo);
			System.out.println(list);
			model.addAttribute("list", list);
		}
		

		@RequestMapping("pReview.write")
		public void info(ReviewVO vo , Model model ) {
			ReviewVO vo2 = dao.one(vo);
			model.addAttribute("one", vo2);
		}
		
		@RequestMapping("pReview.del")
		public void del(ReviewVO vo) {
			int result = dao.del(vo);
		}
	
		
		
		@RequestMapping("pReview.up")
		public String up(ReviewVO vo, Model model) {
			System.out.println("1>>" + vo);
			int result = dao.up(vo);
			ReviewVO vo2 = dao.one(vo);
			System.out.println("2>>" + vo2);
			model.addAttribute("one", vo2);
			return "pReview";
			
		}
		
	
		

		
}
		