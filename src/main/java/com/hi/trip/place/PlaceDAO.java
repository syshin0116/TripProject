package com.hi.trip.place;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.hi.trip.place.JDBCUtil;
import com.hi.trip.place.Paging;
import com.hi.trip.place.PagingVO;
import com.hi.trip.place.PlaceVO;

import java.sql.DriverManager;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component // 싱글톤으로 만들어달라고 스프링에게 요청
public class PlaceDAO {
	private Connection       		conn = null;
	private PreparedStatement		stmt = null;
	private ResultSet				rs   = null;
	
	private final String Place_LIST = "select * from place order by place_idx desc";
	private final String Place_LIST_T = "select * from place where place_info like '%'||?||'%' order by place_idx desc";
	private final String Place_LIST_C = "select * from place where place_addr like '%'||?||'%' order by place_idx desc";
	private final String Place_UPDAT_CNT = "update place set cnt=cnt+1 where place_idx=?";
	
	private final String Place_LIST2_CNT = "SELECT COUNT(*) FROM ( SELECT * FROM place ORDER BY place_idx DESC ) place";
	private final String Place_LIST_T2_CNT = "SELECT COUNT(*) from ( SELECT place_idx+1 AS row_num, place.* FROM ( SELECT * FROM place ORDER BY place_idx DESC ) place ) WHERE place_info LIKE '%'||?||'%'";
	private final String Place_LIST_C2_CNT = "SELECT COUNT(*) from ( SELECT place_idx+1 AS row_num, place.* FROM ( SELECT * FROM place ORDER BY place_idx DESC ) place ) WHERE place_addr LIKE '%'||?||'%'";
	
	private final String Place_LIST2_WITH_PAGING = "SELECT * from ( SELECT place_idx+1 AS row_num, place.* FROM ( SELECT * FROM place ORDER BY place_idx DESC ) place ) WHERE row_num >= ? AND row_num <= ?";
	private final String Place_LIST_T2_WITH_PAGING = "SELECT * from ( SELECT place_idx+1 AS row_num, place.* FROM ( SELECT * FROM place WHERE place_info LIKE '%'||?||'%' ORDER BY place_idx DESC ) place ) WHERE row_num >= ? AND row_num <= ?";
	private final String Place_LIST_C2_WITH_PAGING = " SELECT * from ( SELECT place_idx+1 AS row_num, place.* FROM ( SELECT * FROM place WHERE place_addr '%'||?||'%' ORDER BY place_idx DESC ) place ) WHERE row_num >= ? AND row_num <= ?";
	


	@Autowired
	SqlSessionTemplate my;

	//jsp->controller->dao->mybatis->mapper->db

	
	//검색정보 상세보기
	public List<PlaceVO> pShowSearch(PlaceVO vo) {
		List<PlaceVO> list = my.selectList("place.list", vo);
		System.out.println(list);
		return list; //place.XML의 namespace이름.id
	}
	//검색정보 상세보기
		public PlaceVO one(PlaceVO vo) {
			return my.selectOne("pDetail", vo);
		}
		
		public List<PlaceVO> getBoardListWithPaging(int currentPage, PlaceVO vo){
			System.out.println("===> JDBC로 getpShowSearchWithPaging() 기능 처리");
			PagingVO paging = new PagingVO();
			List<PlaceVO> placeList = new ArrayList<PlaceVO>();
			String flagpShowSearchFromSearch = "N";
			
	        int startNum = (currentPage - 1) * paging.getDisplayRow() + 1;
	        int endNum = currentPage * paging.getDisplayRow();
	        //System.out.println("===> startNum = " + startNum );
	        //System.out.println("===> endNum = " + endNum );
	        try{
	            conn = JDBCUtil.getConnection();
	            
				if (vo.getSearchCondition() != null && vo.getSearchKeyword() != null) {
					flagpShowSearchFromSearch = "Y";
				}
				
				//페이징
				if("Y".equals(flagpShowSearchFromSearch) && vo.getSearchCondition().equals("place_info")) {
					stmt = conn.prepareStatement(Place_LIST_T2_WITH_PAGING);
					stmt.setString(1, (String) vo.getSearchKeyword());
					stmt.setInt(2, startNum);
					stmt.setInt(3, endNum);
				} else if("Y".equals(flagpShowSearchFromSearch) && vo.getSearchCondition().equals("place_addr") ) {
					stmt = conn.prepareStatement(Place_LIST_C2_WITH_PAGING);
					stmt.setString(1, (String) vo.getSearchKeyword());
					stmt.setInt(2, startNum);
					stmt.setInt(3, endNum);
				} else {
					stmt = conn.prepareStatement(Place_LIST2_WITH_PAGING);
					stmt.setInt(1, startNum);
					stmt.setInt(2, endNum);
				}
				
	            rs = stmt.executeQuery();
	            while(rs.next()){
	            	PlaceVO place = new PlaceVO();
	            	place.setPlace_idx(rs.getInt("place_idx"));
	            	place.setPlace_info(rs.getString("place_info"));
	            	place.setPlace_number(rs.getString("place_number"));
	            	place.setPlace_addr(rs.getString("place_addr"));
	            	place.setPlace_img(rs.getString("place_img"));
	            	place.setPlace_detail(rs.getString("place_detail"));
	            	placeList.add(place);
	            }
	        }catch(Exception e){
	            e.printStackTrace();
	        }finally{
	        	JDBCUtil.close(stmt, conn);
	        }
	        return placeList;
	    }
		// 게시글 수 조회
		public int getPlaceCnt(PlaceVO vo) {
			System.out.println("===> JDBC로 getBoardCnt() 기능 처리");
			String flagBoardListFromSearch = "N";
			int placeListcnt = 0;
	        try{
	            conn = JDBCUtil.getConnection();
	            
				if (vo.getSearchCondition() != null && vo.getSearchKeyword() != null) {
					flagBoardListFromSearch = "Y";
				}
				
				//페이징
				if("Y".equals(flagBoardListFromSearch) && vo.getSearchCondition().equals("TITLE")) {
					stmt = conn.prepareStatement(Place_LIST_T2_CNT);
					stmt.setString(1, (String) vo.getSearchKeyword());
				} else if("Y".equals(flagBoardListFromSearch) && vo.getSearchCondition().equals("CONTENT") ) {
					stmt = conn.prepareStatement(Place_LIST_C2_CNT);
					stmt.setString(1, (String) vo.getSearchKeyword());
				} else {
					stmt = conn.prepareStatement(Place_LIST2_CNT);
				}
			
	            rs = stmt.executeQuery();
	            if(rs.next()){
	            	placeListcnt = rs.getInt(1);
	            }
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(stmt, conn);
			}
	        return placeListcnt;
		}
		public List<PlaceVO> getPlaceListWithPaging(int currentPage, PlaceVO vo){
			System.out.println("===> JDBC로 getBoardListWithPaging() 기능 처리");
			PagingVO paging = new PagingVO();
			List<PlaceVO> placeList = new ArrayList<PlaceVO>();
			String flagBoardListFromSearch = "N";
			
	        int startNum = (currentPage - 1) * paging.getDisplayRow() + 1;
	        int endNum = currentPage * paging.getDisplayRow();
	        //System.out.println("===> startNum = " + startNum );
	        //System.out.println("===> endNum = " + endNum );
	        try{
	            conn = JDBCUtil.getConnection();
	            
				if (vo.getSearchCondition() != null && vo.getSearchKeyword() != null) {
					flagBoardListFromSearch = "Y";
				}
				
				//페이징
				if("Y".equals(flagBoardListFromSearch) && vo.getSearchCondition().equals("place_info")) {
					stmt = conn.prepareStatement(Place_LIST_T2_WITH_PAGING);
					stmt.setString(1, (String) vo.getSearchKeyword());
					stmt.setInt(2, startNum);
					stmt.setInt(3, endNum);
				} else if("Y".equals(flagBoardListFromSearch) && vo.getSearchCondition().equals("place_addr") ) {
					stmt = conn.prepareStatement(Place_LIST_C2_WITH_PAGING);
					stmt.setString(1, (String) vo.getSearchKeyword());
					stmt.setInt(2, startNum);
					stmt.setInt(3, endNum);
				} else {
					stmt = conn.prepareStatement(Place_LIST2_WITH_PAGING);
					stmt.setInt(1, startNum);
					stmt.setInt(2, endNum);
				}
				
	            rs = stmt.executeQuery();
	            while(rs.next()){
	            	PlaceVO place = new PlaceVO();
	            	place.setPlace_idx(rs.getInt("place_idx"));
	            	place.setPlace_info(rs.getString("place_info"));
	            	place.setPlace_number(rs.getString("place_number"));
	            	place.setPlace_addr(rs.getString("place_addr"));
	            	place.setPlace_img(rs.getString("place_img"));
	            	place.setPlace_detail(rs.getString("place_detail"));
	            	placeList.add(place);
	            }
	        }catch(Exception e){
	            e.printStackTrace();
	        }finally{
	        	JDBCUtil.close(stmt, conn);
	        }
	        return placeList;
	    }
		
		public PlaceVO selectOne(PlaceVO vo) {
		return my.selectOne("place.selectOne", vo);
		}
	
		public List<PlaceVO> slidelist() {
		return my.selectList("place.slidelist");
		}
		public List<PlaceVO> likelist() {
		return my.selectList("place.likelist");
		}
}

