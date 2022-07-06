package com.hi.trip.place;

public class PlaceVO {
	private int place_idx;
	private String place_big;
	private String place_number;
	private String place_small;
	private String place_city;
	private String place_dong;
	private String place_info;
	private String place_addr;
	private String place_middle;
	private String place_area;
	private String place_img;
	private String place_mapx;
	private String place_mapy;
	private String place_detail;
	private String place_view;
	private String place_like;
	
	String searchCondition;
	String searchKeyword;
	
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public int getPlace_idx() {
		return place_idx;
	}
	public void setPlace_idx(int place_idx) {
		this.place_idx = place_idx;
	}
	public String getPlace_big() {
		return place_big;
	}
	public void setPlace_big(String place_big) {
		this.place_big = place_big;
	}
	public String getPlace_number() {
		return place_number;
	}
	public void setPlace_number(String place_number) {
		this.place_number = place_number;
	}
	public String getPlace_small() {
		return place_small;
	}
	public void setPlace_small(String place_small) {
		this.place_small = place_small;
	}
	public String getPlace_city() {
		return place_city;
	}
	public void setPlace_city(String place_city) {
		this.place_city = place_city;
	}
	public String getPlace_dong() {
		return place_dong;
	}
	public void setPlace_dong(String place_dong) {
		this.place_dong = place_dong;
	}
	public String getPlace_info() {
		return place_info;
	}
	public void setPlace_info(String place_info) {
		this.place_info = place_info;
	}
	public String getPlace_addr() {
		return place_addr;
	}
	public void setPlace_addr(String place_addr) {
		this.place_addr = place_addr;
	}
	public String getPlace_middle() {
		return place_middle;
	}
	public void setPlace_middle(String place_middle) {
		this.place_middle = place_middle;
	}
	public String getPlace_area() {
		return place_area;
	}
	public void setPlace_area(String place_area) {
		this.place_area = place_area;
	}
	public String getPlace_img() {
		return place_img;
	}
	public void setPlace_img(String place_img) {
		this.place_img = place_img;
	}
	public String getPlace_mapx() {
		return place_mapx;
	}
	public void setPlace_mapx(String place_mapx) {
		this.place_mapx = place_mapx;
	}
	public String getPlace_mapy() {
		return place_mapy;
	}
	public void setPlace_mapy(String place_mapy) {
		this.place_mapy = place_mapy;
	}
	public String getPlace_detail() {
		return place_detail;
	}
	public void setPlace_detail(String place_detail) {
		this.place_detail = place_detail;
	}
	public String getPlace_view() {
		return place_view;
	}
	public void setPlace_view(String place_view) {
		this.place_view = place_view;
	}
	public String getPlace_like() {
		return place_like;
	}
	public void setPlace_like(String place_like) {
		this.place_like = place_like;
	}
	
	@Override
	public String toString() {
		return "PlaceVO [place_idx=" + place_idx + ", place_big=" + place_big + ", place_number=" + place_number
				+ ", place_small=" + place_small + ", place_city=" + place_city + ", place_dong=" + place_dong
				+ ", place_info=" + place_info + ", place_addr=" + place_addr + ", place_middle=" + place_middle
				+ ", place_area=" + place_area + ", place_img=" + place_img + ", place_mapx=" + place_mapx
				+ ", place_mapy=" + place_mapy + ", place_detail=" + place_detail + ", place_view=" + place_view
				+ ", place_like=" + place_like + "]";
	}
}
