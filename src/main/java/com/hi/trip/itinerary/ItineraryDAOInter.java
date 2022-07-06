package com.hi.trip.itinerary;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface ItineraryDAOInter {

	List<ItineraryVO> itineraryList(int pageNumber);

	ItineraryVO itineraryReadOne(ItineraryVO vo);

	int itineraryDelete(ItineraryVO vo);

	int itineraryCreate(ItineraryVO vo);

	int itineraryUpdate(ItineraryVO vo);

	String getDate();

	String getTime();

	int getNext();

	boolean nextPage(int pageNumber);

	List<ItineraryVO> searchList(Map<String, Object> map);

	int getCount();
}