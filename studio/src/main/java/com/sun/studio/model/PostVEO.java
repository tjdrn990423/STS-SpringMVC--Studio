/**
 * @identity PostVEO.java
 * @author   경성구
 * @since    2023-01-14
 *
 */
package com.sun.studio.model;

/**
 * 게시물 (POST) 테이블 확장 속성 클래스
 *
 * @author  경성구
 * @since   2023-01-14
 * @history 2023-01-14 최초 작성
 */
public class PostVEO extends Post {
	
	private String create_date; 		// 작성일 (YYYY-MM-DD)
	private String modify_date;			// 수정일 (YYYY-MM-DD)
	
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	public String getModify_date() {
		return modify_date;
	}
	public void setModify_date(String modify_date) {
		this.modify_date = modify_date;
	}
	
	
	
	
	
}
