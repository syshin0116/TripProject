package com.hi.trip.member;

public class MemberStatisticsVO {

	private int memberstatistics_idx;
	private String memberstatistics_name;
	private int memberstatistics_count;
	
	public int getMemberstatistics_idx() {
		return memberstatistics_idx;
	}
	public void setMemberstatistics_idx(int memberstatistics_idx) {
		this.memberstatistics_idx = memberstatistics_idx;
	}
	public String getMemberstatistics_name() {
		return memberstatistics_name;
	}
	public void setMemberstatistics_name(String memberstatistics_name) {
		this.memberstatistics_name = memberstatistics_name;
	}
	public int getMemberstatistics_count() {
		return memberstatistics_count;
	}
	public void setMemberstatistics_count(int memberstatistics_count) {
		this.memberstatistics_count = memberstatistics_count;
	}
	@Override
	public String toString() {
		return "MemberStatisticsVO [memberstatistics_idx=" + memberstatistics_idx + ", memberstatistics_name="
				+ memberstatistics_name + ", memberstatistics_count=" + memberstatistics_count + "]";
	}
	
	
}
