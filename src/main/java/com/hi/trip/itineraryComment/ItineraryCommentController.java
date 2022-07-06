package com.hi.trip.itineraryComment;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hi.trip.itinerary.ItineraryVO;

@Controller
public class ItineraryCommentController {
	
	@Autowired
	ItineraryCommentDAOInter itineraryCommentDao = new ItineraryCommentDAO();
	
	@RequestMapping("itineraryComment/iCommentList")
	public void list(ItineraryVO itineraryVO, ItineraryCommentVO vo, Model model, HttpSession session, Integer itinerary_idx) {
//		int itinerary_idx = Integer.parseInt(request.getParameter("itinerary_idx"));
		System.out.println("idx========="+itinerary_idx);

//		session.setAttribute("member_idx", "1");
		
//        HttpHeaders responseHeaders = new HttpHeaders();
        vo.setItinerary_idx(itinerary_idx);
//        ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
        
        // 해당 게시물 댓글
		List<ItineraryCommentVO> itineraryCommentList = itineraryCommentDao.itineraryCommentList(vo); // Dao에서 VO형태로 수신
		System.out.println("itvo:"+ itineraryVO);
		System.out.println("vo:"+vo);
		
		System.out.println("itineraryCommentList:" + itineraryCommentList);
		
		model.addAttribute("iCommentList", itineraryCommentList);
		
//        if(itineraryCommentList.size() > 0){
//            for(int i=0; i<itineraryCommentList.size(); i++){
//                HashMap hm = new HashMap();
//                hm.put("c_code", itineraryCommentList.get(i).getC_code());
//                hm.put("comment", itineraryCommentList.get(i).getComment());
//                hm.put("writer", itineraryCommentList.get(i).getWriter());
//                
//                hmlist.add(hm);
//            }
//            
//        }
//        
//        JSONArray json = new JSONArray(hmlist);        
//        return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping("itineraryComment/iCommentDelete")
	public void delete(ItineraryCommentVO vo, Model model) {
		int result = itineraryCommentDao.itineraryCommentDelete(vo);
		model.addAttribute("itineraryCommentResult", result);
	}
	
	@RequestMapping(value="itineraryComment/iCommentCreate", produces="application/json; charset=utf8")
	public void insert(@ModelAttribute("ItineraryCommentVO") ItineraryCommentVO vo, HttpServletRequest request, Model model	) {

		int result = itineraryCommentDao.itineraryCommentCreate(vo);
		String text = "설문지 문제 등록 성공";
		if (result != 1) {
			text = "설문지 문제 등록 실패";
		}
		model.addAttribute("result", text);
	}

	@RequestMapping("itineraryComment/iCommentUpdate1")
	public void update(ItineraryCommentVO vo, Model model) {
		List<ItineraryCommentVO> itineraryCommentList = itineraryCommentDao.itineraryCommentList(vo);
		model.addAttribute("itineraryCommentList", itineraryCommentList);
	}

	@RequestMapping("itineraryComment/iCommentUpdate2")
	public void update2(ItineraryCommentVO vo, Model model) {
		// 수정하고 싶은 것이 있으면 수정처리 요청.
		int result = itineraryCommentDao.itineraryCommentUpdate(vo);
		String text = "설문지 수정 성공";
		if (result != 1) {
			text = "설문지 수정 실패";
		}
		model.addAttribute("result", text);
		model.addAttribute("readone", vo);
	}
	
	@RequestMapping("itineraryComment/iComment")
	public void comment(ItineraryCommentVO vo, Model model, @RequestParam Map<String, Object> itinerary_idx) {
		Integer itinerary_idx1 = Integer.valueOf((String) itinerary_idx.get("itinerary_idx"));
		model.addAttribute("itinerary_idx", itinerary_idx1);
	}
}
