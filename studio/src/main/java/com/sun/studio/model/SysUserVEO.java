/**
 * @identity SysUserVEO.java
 * @author   경성구
 * @since    2023-01-28
 * 
 */
package com.sun.studio.model;


/**
 * 회원 (SysUser) 테이블 확장 속성 클래스 
 *
 * @author  경성구
 * @since   2023-01-28
 * @history 2023-01-28 최초 작성
 */
public class SysUserVEO extends SysUser {
	
	private String create_date; 		// 작성일 (YYYY-MM-DD)
	
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	
	

}
