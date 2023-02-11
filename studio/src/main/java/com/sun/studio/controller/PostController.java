/**
 * @identity PostController.java
 * @author   경성구
 * @since    2023-01-18
 *
 */
package com.sun.studio.controller;


import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sun.studio.model.Post;
import com.sun.studio.model.PostVEO;
import com.sun.studio.service.BbsService;
import com.sun.studio.service.PostService;

import lombok.extern.log4j.Log4j;
/**
 * 게시물 관련 컨트롤러
 *
 * @author  경성구
 * @since   2023-01-18
 * @history 2022-01-18 경성구
 *
 */
@Controller
@RequestMapping("/post/*")
@Log4j
public class PostController {
	
	@Autowired
	private BbsService bbsService;
	
	@Autowired
	private PostService postService;
	
	/**
	 * 게시물 목록 화면
	 *
	 * @author 경성구
	 * @since  2023-01-18
	 *
	 */
	@RequestMapping(value = "/postL")
	public String postL( @RequestParam(required = true) String bbs_id
					   , @RequestParam(required = false) Integer page
					   , @RequestParam(required = false) String subject
					   , ModelMap modelMap) {
		log.info("게시물 목록...........");
		
		modelMap.put("bbs", bbsService.detailBbs(bbs_id));
		modelMap.put("page", page);
		modelMap.put("subject", subject);
		
		return "post/postL";
	}
	
	/**
	 * 게시물 검색
	 *
	 * @author 경성구
	 * @since  2023-01-19
	 * @param  bbs_id
	 * @param  PostVEO
	 * @return Map<String, Object>
	 *
	 */
	@RequestMapping(value="/search.do")
	@ResponseBody
	public Map<String,Object> searchPostVEOAsPaging(@RequestParam(required = true) String bbs_id
												  , @ModelAttribute PostVEO postVEO){
		
		return postService.searchPostVEOAsPaging(postVEO);
	}
	
	/**
	 * 게시물 상세 화면
	 *
	 * @author 경성구
	 * @since  2023-01-20
	 *
	 */
	@RequestMapping(value = "/postD")
	public String postD( @RequestParam(required = true) String bbs_id
					   , @RequestParam(required = true) Integer post_no
					   , @RequestParam(required = false) Integer page
					   , @RequestParam(required = false) String subject
					   , ModelMap modelMap) {
		log.info("게시물 상세정보...........");
		
		postService.addReadCnt(post_no);
		
		modelMap.put("bbs", bbsService.detailBbs(bbs_id));
		modelMap.put("post", postService.detailPostVEO(post_no));
		modelMap.put("page", page);
		modelMap.put("subject", subject);
		
		return "post/postD";
	}
	
	/**
	 * 게시물 생성 화면
	 *
	 * @author 경성구
	 * @since  2023-01-20
	 * @param  bbs_id
	 * @param  page
	 * @param  subject
	 *
	 */
	@RequestMapping(value = "/postC")
	public String postC( @RequestParam(required = true) String bbs_id
					   , @RequestParam(required = false) Integer page
					   , @RequestParam(required = false) String subject
					   , ModelMap modelMap) throws Exception{
		log.info("게시물 등록 화면...........");
		
		modelMap.put("bbs", bbsService.detailBbs(bbs_id));
		modelMap.put("page", page);
		modelMap.put("searchSubject", subject);
		
		return "post/postC";
	}
	
	/**
	 * 게시판 생성
	 * @author 경성구
	 * @since  2023-01-20
	 * @param  post
	 * @return Map<String, Object>
	 */
	@PostMapping("/create.do")
	//@ResponseBody
	public String createPost(Post post) throws IOException{
		log.info("createPost : " + post.getPost_no());
		
		String file_name = null;
		MultipartFile uploadFile = post.getUploadFile();
		log.info("uploadFile : " + uploadFile);
		if(!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);
			log.info("originalFileName : " + originalFileName);
			log.info("ext : " + ext);
			UUID uuid = UUID.randomUUID();
			file_name=uuid+"."+ext;
			log.info("uuid : " + uuid);
			log.info("file_name : " + file_name);
			uploadFile.transferTo(new File("C:\\upload\\" + file_name)); 
		}
		post.setFile_name(file_name);
		log.info("file_name : " + post.getFile_name());
		postService.createPost(post);
		return "home";
	}
	/*public Map<String,Object> createPost(Post post) throws IOException{
		log.info("createPost : " + post.getPost_no());
		
		String file_name = null;
		MultipartFile uploadFile = post.getUploadFile();
		log.info("uploadFile : " + uploadFile);
		if(!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);
			log.info("originalFileName : " + originalFileName);
			log.info("ext : " + ext);
			UUID uuid = UUID.randomUUID();
			file_name=uuid+"."+ext;
			log.info("uuid : " + uuid);
			log.info("file_name : " + file_name);
			uploadFile.transferTo(new File("C:\\upload\\" + file_name)); 
		}
		post.setFile_name(file_name);
		log.info("file_name : " + post.getFile_name());
		
		return postService.createPost(post);
	}*/
	
	/**
	 * 게시물 수정 화면
	 *
	 * @author 경성구
	 * @since  2023-01-25
	 * @param  bbs_id
	 * @param  page
	 * @param  subject
	 *
	 */
	@RequestMapping(value = "/postM")
	public String postM( @RequestParam(required = true) String bbs_id
					   , @RequestParam(required = true) Integer post_no
					   , @RequestParam(required = false) Integer page
					   , @RequestParam(required = false) String subject
					   , ModelMap modelMap) {
		log.info("게시물 수정 화면...........");
		
		modelMap.put("bbs", bbsService.detailBbs(bbs_id));
		modelMap.put("post", postService.detailPostVEO(post_no));
		modelMap.put("page", page);
		modelMap.put("subject", subject);
		
		return "post/postM";
	}
	
	/**
	 * 게시물 수정
	 *
	 * @author 경성구
	 * @since  2023-01-25
	 * @param  post
	 * @return Map<String, Object> : RESULT, MESSAGE
	 *
	 */
	@PostMapping(value = "/modify.do")
	@ResponseBody
	public Map<String, Object> modifyPost(@ModelAttribute Post post) {
		log.info("modifyPost : " + post.getPost_no());
		
		return postService.modifyPost(post);
	}
	
	/**
	 * 게시물 삭제
	 *
	 * @author  경성구
	 * @since   2023-01-25
	 * @param   post_no
	 * @return  Map<String, Object> : RESULT, MESSAGE
	 *
	 */
	@RequestMapping(value = "/remove.do")
	@ResponseBody
	public Map<String, Object> removePost(@RequestParam(required = true) int post_no){
		log.info("modifyPost : " + post_no);
		
		return postService.removePost(post_no);
	}
	
	
	
}
