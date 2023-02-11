/**
 * @identity PostServiceImpl.java
 * @author   경성구
 * @since    2023-01-19
 *
 */
package com.sun.studio.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.studio.mapper.PostMapper;
import com.sun.studio.model.Pagenation;
import com.sun.studio.model.Post;
import com.sun.studio.model.PostVEO;
import com.sun.studio.service.PostService;

/**
 * 게시물 관련 서비스
 *
 * @author  경성구
 * @since   2023-01-19
 * @history 2023-01-19 경성구 - 최초 작성
 */
@Service
public class PostServiceImpl implements PostService{
	
	@Autowired
	private PostMapper postMapper;
	
	
	/**
	 * 게시물 검색
	 *
	 * @author 경성구
	 * @since  2023-01-19
	 * @param  PostVEO
	 * @return Map<String, Object>
	 */
	@Override
	public Map<String, Object> searchPostVEOAsPaging(PostVEO postVEO) {
		
		Pagenation pagenation = new Pagenation();
		pagenation.setNum("1");
		pagenation.setPer("10");
		
		int totalCount = postMapper.countPost(postVEO);
		pagenation = pagenation.setPaging(totalCount);
		
		postVEO.setSt(pagenation.getSt());
		postVEO.setEd(pagenation.getEd());
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("postList", postMapper.selectPagePostVEO(postVEO));
		map.put("pagenation", pagenation);
		
		return map;
	}
	
	/**
	 * 게시물 상세정보
	 *
	 * @author 경성구
	 * @since  2023-01-20
	 * @param  post_no
	 * @return PostVEO
	 */
	@Override
	public PostVEO detailPostVEO(int post_no) {
		return postMapper.selectOnePostVEO(post_no);
	}
	
	/**
	 * 게시물 조회수 증가
	 *
	 * @author 경성구
	 * @since  2023-01-20
	 * @param  post_no
	 */
	@Override
	public int addReadCnt(int post_no) {
		return postMapper.updateReadCnt(post_no);
	}
	
	/**
	 * 게시물 등록
	 *
	 * @author 경성구
	 * @since  2023-01-20
	 * @param  post
	 * @return Map<String, Object> : RESULT, MESSAGE
	 */
	@Override
	public Map<String, Object> createPost(Post post){
		Map<String,Object> map = new HashMap<String,Object>();
		
		Integer post_no = post.getPost_no();
		String bbs_id = post.getBbs_id();
		String subject = post.getSubject();
		String post_content = post.getPost_content();
		
		
		if(post_no == null || bbs_id == null || bbs_id.equals("") || subject == null || subject.equals("")
				|| post_content == null || post_content.equals("")) {
			map.put("RESULT", "FAIL");
			map.put("MESSAGE", "필수값이 누락되었습니다.");
			return map;
		}
		
		int insertCnt = postMapper.insertPost(post);
		
		if(insertCnt < 1) {
			map.put("RESULT", "FAIL");
			map.put("MESSAGE", "Database 오류");
		}
		else {
			map.put("RESULT", "OK");
			map.put("MESSAGE", "게시물이 등록되었습니다.");
		}
		
		return map;
	}
	
	/**
	 * 게시물 수정
	 *
	 * @author 경성구
	 * @since  2023-01-25
	 * @param  post
	 * @return Map<String, Object> : RESULT, MESSAGE
	 */
	@Override
	public Map<String, Object> modifyPost(Post post) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		String subject = post.getSubject();
		String post_content = post.getPost_content();
		
		if(subject == null || subject.equals("") || post_content == null || post_content.equals("")) {
			map.put("RESULT", "FAIL");
			map.put("MESSAGE", "필수값이 누락되었습니다.");
			return map;
		}
		
		int updateCnt = postMapper.updatePost(post);
		
		if(updateCnt < 1) {
			map.put("RESULT", "FAIL");
			map.put("MESSAGE", "Database 오류");
		}
		else {
			map.put("RESULT", "OK");
			map.put("MESSAGE", "게시물이 수정되었습니다.");
		}
		
		return map;
	}
	
	/**
	 * 게시물 삭제
	 *
	 * @author 경성구
	 * @since  2023-01-25
	 * @param  post_no
	 * @return Map<String, Object> : RESULT, MESSAGE
	 */
	@Override
	public Map<String, Object> removePost(int post_no) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int deleteCnt = postMapper.deletePost(post_no);
		
		if(deleteCnt < 1) {
			map.put("RESULT", "FAIL");
			map.put("MESSAGE", "Database 오류");
		}
		else {
			map.put("RESULT", "OK");
			map.put("MESSAGE", "게시물이 삭제되었습니다.");
		}
		
		return map;
	}
	
	/**
	 * 최근 게시물 4건 조회
	 *
	 * @author 경성구
	 * @since  2023-02-07
	 * @param  bbs_id
	 * @return PostVEO
	 */
	@Override
	public List<PostVEO> getRecentPostVEO(String bbs_id) {
		return postMapper.selectRecentPostVEO(bbs_id);
	}

}
