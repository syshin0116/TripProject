package com.hi.trip.member;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hi.trip.place.PlaceDAO;
import com.hi.trip.place.PlaceVO;

@Controller
public class FavoriteController {

	@Autowired
	FavoriteInter dao;
	
	@Autowired
	PlaceDAO dao2;
	
	@RequestMapping("member/favorite")
	public void favorite(HttpSession session, Model model, FavoriteVO vo, 
			PlaceVO vo2, ArrayList<FavoriteVO> list, ArrayList<PlaceVO> list2)
	{
		
		vo.setMember_idx((int)session.getAttribute("member_idx"));
		System.out.println(vo.getMember_idx());
		list=(ArrayList<FavoriteVO>) dao.selectFromMember(vo);
		System.out.println(list);
		
		for(int i=0;i<list.size();i++)
		{
			vo2.setPlace_idx(list.get(i).getPlace_idx());
			list2.add(dao2.selectOne(vo2));
		}
		
		
		if((list!=null)&&(list2!=null))
		{
			model.addAttribute("list", list);		
			model.addAttribute("list2", list2);
		}
		
	}
	
	@RequestMapping("member/createFavorite")
	public void createFavorite(HttpSession session, FavoriteVO vo)
	{
		System.out.println(vo.getPlace_idx());
		vo.setMember_idx((int)session.getAttribute("member_idx"));
		dao.create(vo);
	}
	
	@RequestMapping("member/deleteFavorite")
	public void deleteFavorite(FavoriteVO vo)
	{
		System.out.println(vo.getFavorite_idx());
		dao.delete(vo);
	}
}
