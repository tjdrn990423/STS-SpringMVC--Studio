/**
 * @identity Post.java
 * @author   경성구
 * @since    2023-01-14
 * 
 */
package com.sun.studio.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;


/**
 * 게시물 (POST) 테이블 클래스 
 *
 * @author  경성구
 * @since   2023-01-14
 * @history 2023-01-14 최초 작성
 */
public class Post extends Pagenation {

	private int    post_no;				// 게시물 번호
	private String bbs_id;				// 게시판ID
	private String subject;				// 제목
	private String post_content;		// 게시물 내용
	private int    read_cnt;			// 조회수
	private Date create_dt;				// 생성 일시
	private Date modify_dt;				// 수정 일시
	private String writer; 				// 작성자
	private int create_pno;				// 작성자 번호 (pno와 연관)
	private String file_name;			// 파일첨부(이름)
	private MultipartFile uploadFile;	// 업로드파일
	
	public int getPost_no() {
		return post_no;
	}
	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}
	public String getBbs_id() {
		return bbs_id;
	}
	public void setBbs_id(String bbs_id) {
		this.bbs_id = bbs_id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPost_content() {
		return post_content;
	}
	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}
	public int getRead_cnt() {
		return read_cnt;
	}
	public void setRead_cnt(int read_cnt) {
		this.read_cnt = read_cnt;
	}
	public Date getCreate_dt() {
		return create_dt;
	}
	public void setCreate_dt(Date create_dt) {
		this.create_dt = create_dt;
	}
	public Date getModify_dt() {
		return modify_dt;
	}
	public void setModify_dt(Date modify_dt) {
		this.modify_dt = modify_dt;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getCreate_pno() {
		return create_pno;
	}
	public void setCreate_pno(int create_pno) {
		this.create_pno = create_pno;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	
	
	
	
	
}
