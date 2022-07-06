package com.hi.trip.member;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hi.trip.place.PlaceDAO;
import com.hi.trip.place.PlaceVO;
import com.hi.trip.surveyResult.SurveyResultDAO;
import com.hi.trip.surveyResult.SurveyResultVO;

@Controller
public class MemberController {

	@Autowired
	MemberInter dao;
	
	@Autowired
	SurveyResultDAO dao2;
	
	@Autowired
	MemberStatisticsInter dao3;
	
	@RequestMapping("member/createMember")
	public void createMember(MemberVO vo, HttpSession session, 
			MemberStatisticsVO vo2)
	{
		System.out.println(vo);
		dao.create(vo);
		
		vo=dao.selectOneName(vo);
		session.setAttribute("member_idx", vo.getMember_idx());
		session.setAttribute("member_name", vo.getMember_name());
		session.setAttribute("member_type", vo.getMember_type());
		System.out.println("세션 등록 성공");
		
		if(vo.getMember_gender()==1)
		{
			vo2.setMemberstatistics_name("남자회원수");
			dao3.update(vo2);
		}
		else
		{
			vo2.setMemberstatistics_name("여자회원수");
			dao3.update(vo2);
		}
		
		System.out.println(vo.getMember_birth().substring(0, 4));
		LocalDate now = LocalDate.now();
		int age=now.getYear()-Integer.parseInt(vo.getMember_birth().substring(0, 4))+1;
		
		if(age>=60)
		{
			vo2.setMemberstatistics_name("60대 이상");
			dao3.update(vo2);
		}
		else if(age>=50)
		{
			vo2.setMemberstatistics_name("50대");
			dao3.update(vo2);
		}
		else if(age>=40)
		{
			vo2.setMemberstatistics_name("40대");
			dao3.update(vo2);
		}
		else if(age>=30)
		{
			vo2.setMemberstatistics_name("30대");
			dao3.update(vo2);
		}
		else if(age>=20)
		{
			vo2.setMemberstatistics_name("20대");
			dao3.update(vo2);
		}
		else
		{
			vo2.setMemberstatistics_name("10대 이하");
			dao3.update(vo2);
		}
		
		System.out.println(vo.getMember_addr().substring(0, 2));
		vo2.setMemberstatistics_name(vo.getMember_addr().substring(0, 2));
		dao3.update(vo2);
		
		if(vo.getMember_type()==1)
		{
			vo2.setMemberstatistics_name("하이트립 가입 회원");
			dao3.update(vo2);
		}
		else if(vo.getMember_type()==2)
		{
			vo2.setMemberstatistics_name("네이버 가입 회원");
			dao3.update(vo2);
		}
		else
		{
			vo2.setMemberstatistics_name("구글 가입 회원");
			dao3.update(vo2);
		}
		
		
		
		
	}
	
	@RequestMapping("member/modifyMember")
	public void modifyMember(MemberVO vo, HttpSession session)
	{
		System.out.println(vo);
		
		if(vo.getMember_type()!=1)
		{
			vo.setMember_pw(null);
		}
		
		dao.update(vo);
	}
	
	@RequestMapping("member/idCheck")
	public void idCheck(Model model, MemberVO vo)
	{
		System.out.println("ajax로 받은 데이터 " + vo.getMember_id());
		vo=dao.selectOneId(vo);
		System.out.println(vo);
		
		if(vo!=null)
		{
			model.addAttribute("result", true);
		}
		else
		{
			model.addAttribute("result", false);
		}
		
		
	}
	
	@RequestMapping("member/nameCheck")
	public void nameCheck(Model model, MemberVO vo)
	{
		System.out.println("ajax로 받은 데이터 " + vo.getMember_name());
		vo=dao.selectOneName(vo);
		
		if(vo!=null)
		{
			model.addAttribute("result", true);
		}
		else
		{
			model.addAttribute("result", false);
		}
	}
	
	@RequestMapping("member/loginHitrip")
	public String loginHitrip(MemberVO vo, HttpSession session)
	{
		System.out.println(vo);
		vo=dao.loginHiTrip(vo);
		
		if(vo!=null)
		{
			session.setAttribute("member_idx", vo.getMember_idx());
			session.setAttribute("member_name", vo.getMember_name());
			session.setAttribute("member_type", vo.getMember_type());
			System.out.println("세션 등록 성공");
			return "redirect:../main.jsp";
		}
		else
		{
			return "member/loginFail";
		}
		
	}
	
	@RequestMapping("member/loginNaver")
	public String loginNaver(Model model,HttpSession session, String id, String gender, String birthday, String birthyear, MemberVO vo)
	{
		System.out.println(id+" "+gender+" "+birthday+" "+birthyear);
		vo.setMember_naver_token(id);	
		vo=dao.loginNaver(vo);
		
		if(vo!=null)
		{
			session.setAttribute("member_idx", vo.getMember_idx());
			session.setAttribute("member_name", vo.getMember_name());
			session.setAttribute("member_type", vo.getMember_type());
			System.out.println("세션 등록 성공");
			return "redirect:../main.jsp";
		}
		else
		{
			vo= new MemberVO();
			vo.setMember_naver_token(id);
			if(gender.equals("M"))
			{
				vo.setMember_gender(1);
			}
			else
			{
				vo.setMember_gender(2);
			}
			vo.setMember_birth(birthyear+"-"+birthday);
			vo.setMember_type(2);
				
			System.out.println(vo);
			model.addAttribute("vo", vo);
			return "member/createNaverForm";
		}
		
	}
	
	@RequestMapping("member/loginGoogle")
	public String loginGoogle(Model model,HttpSession session, String id, MemberVO vo)
	{
		System.out.println(id);
		
		vo.setMember_google_token(id);	
		vo=dao.loginGoogle(vo);
		
		if(vo!=null)
		{
			session.setAttribute("member_idx", vo.getMember_idx());
			session.setAttribute("member_name", vo.getMember_name());
			session.setAttribute("member_type", vo.getMember_type());
			System.out.println("세션 등록 성공");
			return "redirect:../main.jsp";
		}
		else
		{
			vo= new MemberVO();
			vo.setMember_google_token(id);
			vo.setMember_type(3);
			System.out.println(vo);
			model.addAttribute("vo", vo);
			return "member/createGoogleForm";
		}
	}
	
	@RequestMapping("member/logout")
	public void logout(HttpSession session)
	{
		session.removeAttribute("member_idx");
		session.removeAttribute("member_name");
		session.removeAttribute("member_type");	
	}
	
	@RequestMapping("member/information")
	public void info(HttpSession session, Model model, MemberVO vo)
	{
		vo.setMember_idx((int)session.getAttribute("member_idx"));
		System.out.println(vo.getMember_idx());
		vo=dao.selectOneIdx(vo);
		
		model.addAttribute("vo", vo);
	}
	
	@RequestMapping("member/modify")
	public void mdfy(HttpSession session, Model model, MemberVO vo)
	{
		vo.setMember_idx((int)session.getAttribute("member_idx"));
		System.out.println(vo.getMember_idx());
		vo=dao.selectOneIdx(vo);
		
		model.addAttribute("vo", vo);
	}
	
	@RequestMapping("member/surveyResultList")
	public void surveyList(HttpSession session, Model model, 
			SurveyResultVO vo, ArrayList<SurveyResultVO> list)
	{
		System.out.println("세션 idx값: "+session.getAttribute("member_idx"));
		vo.setMember_idx((int)session.getAttribute("member_idx"));
		
		
		list = (ArrayList<SurveyResultVO>)dao2.selectAllFromMember(vo);
		System.out.println(list);
		
		if(list!=null)
		{
			model.addAttribute("list", list);
		}
		
		
	}
	
	@RequestMapping("member/statistics")
	public void statistics(HttpSession session, Model model, ArrayList<MemberStatisticsVO> list)
	{
		if(session.getAttribute("member_idx").equals(1))
		{
			list=(ArrayList<MemberStatisticsVO>)dao3.selectAll();
			System.out.println(list);
			model.addAttribute("list", list);
			
		}
	}
	
	
	
	
}
