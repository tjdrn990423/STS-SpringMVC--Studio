/**
 * @identity BbsVEO.java
 * @author   경성구
 * @since    2023-01-14
 *
 */
package com.sun.studio.model;

/**
 * 게시판 (BBS) 테이블 확장 속성 클래스
 *
 * @author  경성구
 * @since   2023-01-14
 * @history 2023-01-14 최초 작성
 */
public class BbsVEO extends Bbs {
	
	private int num;        // 행 번호
	private int post_cnt;   // 게시물수
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getPost_cnt() {
		return post_cnt;
	}
	public void setPost_cnt(int post_cnt) {
		this.post_cnt = post_cnt;
	}
	
	
}
