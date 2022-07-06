package com.hi.trip.itinerary;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hi.trip.itineraryComment.ItineraryCommentVO;
import com.hi.trip.member.MemberDAO;
import com.hi.trip.member.MemberVO;
import com.hi.trip.place.PlaceDAO;
import com.hi.trip.place.PlaceVO;

@Controller
public class ItineraryController {
	
	@Autowired
	ItineraryDAOInter itineraryDao = new ItineraryDAO();
	
	@Autowired
	PlaceDAO placeDao = new PlaceDAO();
	
	@Autowired
	MemberDAO memberDao = new MemberDAO();

	@Autowired
	ItineraryDAO dao;

	@RequestMapping("/slideshow")
	public void slideshow(ItineraryVO vo, Model model) {
		List<ItineraryVO> list = dao.slideshow();
		//System.out.println("디비값" + list);
		model.addAttribute("list", list);
		String s1 = list.get(0).getItinerary_places();
		String s2 = list.get(1).getItinerary_places();
		String s3 = list.get(2).getItinerary_places();
		
		String s = s1 + "," + s2 + "," + s3;
		String[] result = s.split(",");
		//System.out.println(s);
		HashSet<Integer> set = new HashSet<>();
		for (int i = 0; i < result.length; i++) {
			int result2 = Integer.parseInt(result[i]);
			set.add(result2);
		}
				
		PlaceVO vo2 = new PlaceVO();
		for(int i=0;i<result.length;i++)
		{
			//System.out.println(result[i]+"번 여행지의 이미지 가져옴");
			vo2.setPlace_idx(Integer.parseInt(result[i]));
			result[i]=placeDao.selectOne(vo2).getPlace_img();
		}
		
		for(int i=0;i<result.length;i++)
		{
			System.out.println(result[i]);
		}
		
		model.addAttribute("images1", result);
		model.addAttribute("images2", result);
	}
	
	@RequestMapping("itinerary/itineraryList")// 여행일정 게시판
	public ModelAndView list(ItineraryVO vo, MemberVO memberVO, Model model, HttpSession session,
			@RequestParam(name = "pageNumber", required = false, defaultValue = "1") int pageNumber, // 페이징 파라메터, 기본값 1
			@RequestParam(defaultValue="member_idx") String search_option, //기본 검색 옵션값을 작성자로 한다.
            @RequestParam(defaultValue="") String keyword //키워드의 기본값을 ""으로 한다.
            ) { 

		
		List<ItineraryVO> itineraryList = itineraryDao.itineraryList(pageNumber); // Dao에서 VO형태로 수신
		List<MemberVO> memberList = memberDao.selectAll();
		Boolean nextPage = itineraryDao.nextPage(pageNumber+1);
		ModelAndView mav = new ModelAndView();
	    Map<String,Object> map = new HashMap<>();
		map.put("search_option", search_option);
        map.put("keyword", keyword);
		List<ItineraryVO> searchList = itineraryDao.searchList(map);
		int count = itineraryDao.getCount();
        
           //넘길 데이터가 많기 때문에 해쉬맵에 저장한 후에 modelandview로 값을 넣고 페이지를 지정
        
//        map.put("list", list);                         //map에 list(게시글 목록)을 list라는 이름의 변수로 자료를 저장함.
//        map.put("pager", pager);
//        map.put("count", count);
        
        mav.addObject("map", map);                    //modelandview에 map를 저장
        
//        System.out.println("map : "+map);
        mav.setViewName("itinerary/itineraryList");                //자료를 넘길 뷰의 이름
        
//		System.out.println("pageNumber=" + pageNumber);
        model.addAttribute("count", count);
		model.addAttribute("member", memberList);
		model.addAttribute("itineraryList", itineraryList);
		model.addAttribute("nextPage", nextPage);
		model.addAttribute("pageNumber", pageNumber);
		return mav;//게시판 페이지로 이동
		
	}
	
	@RequestMapping("itinerary/itineraryOne")
	public void one(ItineraryVO itineraryVO, ItineraryCommentVO iCommentvo, Model model, PlaceVO placeVO, MemberVO memberVO) {
		ItineraryVO itineraryVO2 = itineraryDao.itineraryReadOne(itineraryVO);
//		System.out.println("itinerayOne vo:"+itineraryVO);
		// itineraryVO 에 있는 member_idx를 memberVO의 member_idx로 연결해 member정보 호출
		memberVO.setMember_idx(itineraryVO2.getMember_idx()); 
		MemberVO memberVO2 = memberDao.selectOneIdx(memberVO);
		iCommentvo.setItinerary_idx(itineraryVO2.getItinerary_idx());
		//itineraryVO에서 ,로 연결된 place_idx들을 가져와 split 한 후에 각 place_idx에 해당하는 placeVO호출
		String placesString = itineraryVO2.getItinerary_places();
		String[] placesIdx = placesString.split(",");
		List<PlaceVO> placeList = new ArrayList<PlaceVO>();
		int j=0;
		for (String placeIdx : placesIdx){
			System.out.println("placeIdx >>"+ placeIdx);
			placeVO=new PlaceVO();
			placeVO.setPlace_idx(Integer.parseInt(placeIdx));
			placeVO = placeDao.one(placeVO);
			
			placeList.add(j,placeVO);
			j++;
			for(int i=0;i<placeList.size();i++)
			{
				System.out.println(placeList.get(i).getPlace_idx());
			}
			
			}
		for(int i=0;i<placeList.size();i++)
		{
			System.out.println(placeList.get(i).getPlace_idx());
		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("itineraryVO", itineraryVO2);
		mav.setViewName("itineraryComment/iCommentList"); 
		model.addAttribute("memberModel_idx", itineraryVO2.getMember_idx());
		model.addAttribute("memberOne", memberVO2);
		model.addAttribute("one", itineraryVO2);
		model.addAttribute("placeList", placeList);
//		System.out.println("placeList"+placeList);
//		System.out.println(memberVO2);
		System.out.println(placeList);
	}
	
	@RequestMapping("itinerary/itineraryDelete")
	public void delete(ItineraryVO vo, Model model) { // 게시판 작성글 삭제 기능
		int result = itineraryDao.itineraryDelete(vo);
		model.addAttribute("itineraryResult", result);
	}
	
	@RequestMapping("itinerary/itineraryCreate")
	public void insert(ItineraryVO vo, Model model) { // 게시판 글 작성 기능

		int result = itineraryDao.itineraryCreate(vo); // 성공여부 확인
		String text = "설문지 문제 등록 성공";
		if (result != 1) {
			text = "설문지 문제 등록 실패";
		}
		model.addAttribute("result", text);
	}

	@RequestMapping("itinerary/itineraryUpdate") // 게시판 글 수정1
	public void update(ItineraryVO vo, Model model) {
		ItineraryVO itineraryVO2 = itineraryDao.itineraryReadOne(vo);

		model.addAttribute("itinerary", itineraryVO2);
	}

	@RequestMapping("itinerary/itineraryUpdate2") // 게시판 글 수정2
	public void update2(ItineraryVO vo, Model model) {
		// 수정하고 싶은 것이 있으면 수정처리 요청.
		int result = itineraryDao.itineraryUpdate(vo);
		String text = "설문지 수정 성공";
		if (result != 1) {
			text = "설문지 수정 실패";
		}
		model.addAttribute("result", text);
		model.addAttribute("readone", vo);
	}
}
