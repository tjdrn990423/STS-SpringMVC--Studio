/**
 * @identity BbsVEO.java
 * @author   경성구
 * @since    2023-01-14
 *
 */
package com.sun.studio.model;

import lombok.Data;

/**
 * 게시판 (BBS) 테이블 클래스 
 *
 * @author  경성구
 * @since   2023-01-14
 * @history 2023-01-14 최초 작성
 */
@Data
public class Bbs {

	private String bbs_id;
	private String bbs_name;
	private int write_level;
	private int read_level;
}
