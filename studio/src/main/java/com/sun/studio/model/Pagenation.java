package com.sun.studio.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class Pagenation {
	private String rn;			// 행 번호
	private String st;			// 시작번호
	private String ed;			// 끝번호
	private String total; 		// 총 건수
	private String per;			// 한 페이지의 글 개수
	private String num;			// 현재 페이지
	private String pageCount;  	// 전체 페이지 수
	
	public void setPagenation()
	{
		if (num == null || num.equals("")) this.setNum("1");
		if (per == null || per.equals("")) {
			this.setPer("50");
		}
	}
	
	@JsonIgnore
	public Pagenation getPagenationInfo()
	{
		return this;
	}
	
	public Pagenation setPaging(int total) {
		int totalCount = total;
    	int perPage = Integer.parseInt(per);
    	int pageNum = Integer.parseInt(num);
    	
    	this.total  = totalCount + "";
    	st = ((pageNum - 1) * perPage) + 1 + "";
    	ed = pageNum * perPage + "";
    	
    	int numberingMaxNum = totalCount / perPage;
    	
    	if (totalCount % perPage > 0) {
    		numberingMaxNum += 1;
    	}
    	
    	pageCount = numberingMaxNum + "";
    	
    	return this;
    }
	
	public String getPageCount() {
		return pageCount;
	}
	public void setPageCount(String pageCount) {
		this.pageCount = pageCount;
	}
	public String getRn() {
		return rn;
	}
	public void setRn(String rn) {
		this.rn = rn;
	}
	public String getSt() {
		return st;
	}
	public void setSt(String st) {
		this.st = st;
	}
	public String getEd() {
		return ed;
	}
	public void setEd(String ed) {
		this.ed = ed;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getPer() {
		return per;
	}
	public void setPer(String per) {
		this.per = per;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	
}
