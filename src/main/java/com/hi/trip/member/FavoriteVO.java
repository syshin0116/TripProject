package com.hi.trip.member;

public class FavoriteVO {

	private int favorite_idx;
	private int member_idx;
	private int place_idx;
	
	public int getFavorite_idx() {
		return favorite_idx;
	}
	public void setFavorite_idx(int favorite_idx) {
		this.favorite_idx = favorite_idx;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public int getPlace_idx() {
		return place_idx;
	}
	public void setPlace_idx(int place_idx) {
		this.place_idx = place_idx;
	}
	@Override
	public String toString() {
		return "FavoriteVO [favorite_idx=" + favorite_idx + ", member_idx=" + member_idx + ", place_idx=" + place_idx
				+ "]";
	}
	
	
	
	
	
	
}
