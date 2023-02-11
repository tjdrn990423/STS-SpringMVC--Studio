/**
 * @identity SysUser.java
 * @author   경성구
 * @since    2023-01-28
 * 
 */
package com.sun.studio.model;

import java.util.Date;

/**
 * 회원 (SysUser) 테이블 클래스 
 *
 * @author  경성구
 * @since   2023-01-28
 * @history 2023-01-28 최초 작성
 */
public class SysUser {
	
	private int    pno;				    // 회원 번호
	private String name;				// 이름
	private String id;					// 아이디
	private String password;			// 비밀번호
	private String email;				// 이메일
	private int phone;					// 번호
	private Date create_dt;				// 생성 일시
	private int user_level;				// 회원레벨
	
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public Date getCreate_dt() {
		return create_dt;
	}
	public void setCreate_dt(Date create_dt) {
		this.create_dt = create_dt;
	}
	public int getUser_level() {
		return user_level;
	}
	public void setUser_level(int user_level) {
		this.user_level = user_level;
	}
	
	
	

}
