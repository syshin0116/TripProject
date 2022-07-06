package com.hi.trip.placeComment;

import java.sql.Timestamp;

public class ReviewVO {
	int placeComment_idx;
	int memeber_id;
	int place_idx;
	Timestamp placeComment_mdfydate;
	Timestamp placeComment_traveldate;
	String placeComment_relationship;
	String place_title;
	String place_content;
	
	public String getPlace_title() {
		return place_title;
	}
	public void setPlace_title(String place_title) {
		this.place_title = place_title;
	}
	public String getPlace_content() {
		return place_content;
	}
	public void setPlace_content(String place_content) {
		this.place_content = place_content;
	}
	public int getPlaceComment_idx() {
		return placeComment_idx;
	}
	public void setPlaceComment_idx(int placeComment_idx) {
		this.placeComment_idx = placeComment_idx;
	}
	public int getMemeber_id() {
		return memeber_id;
	}
	public void setMemeber_id(int memeber_id) {
		this.memeber_id = memeber_id;
	}
	public int getPlace_idx() {
		return place_idx;
	}
	public void setPlace_idx(int place_idx) {
		this.place_idx = place_idx;
	}
	public Timestamp getPlaceComment_mdfydate() {
		return placeComment_mdfydate;
	}
	public void setPlaceComment_mdfydate(Timestamp placeComment_mdfydate) {
		this.placeComment_mdfydate = placeComment_mdfydate;
	}
	public Timestamp getPlaceComment_traveldate() {
		return placeComment_traveldate;
	}
	public void setPlaceComment_traveldate(Timestamp placeComment_traveldate) {
		this.placeComment_traveldate = placeComment_traveldate;
	}
	public String getPlaceComment_relationship() {
		return placeComment_relationship;
	}
	public void setPlaceComment_relationship(String placeComment_relationship) {
		this.placeComment_relationship = placeComment_relationship;
	}
	
}
