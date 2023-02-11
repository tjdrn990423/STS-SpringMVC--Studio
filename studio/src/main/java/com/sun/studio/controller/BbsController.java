/**
 * @identity BbsController.java
 * @author   경성구
 * @since    2023-01-14
 *
 */
package com.sun.studio.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sun.studio.model.Bbs;
import com.sun.studio.service.BbsService;

import lombok.extern.log4j.Log4j;

/**
 * 게시판 관련 컨트롤러
 *
 * @author  경성구
 * @since   2023-01-14
 * @history 2022-01-14 경성구
 *
 */
@Controller
@RequestMapping("/bbs/*")
@Log4j
public class BbsController {
	
	@Autowired
	private BbsService bbsService;
	
	/**
	 * 게시판 관리 화면
	 *
	 * @author 경성구
	 * @since  2023-01-14
	 *
	 */
	//@GetMapping("/bbsM")
	@RequestMapping(value = "/bbsM")
	public String bbsM(Model model) {
		log.info("list.......");
		
		model.addAttribute("list",bbsService.searchBbs());
		
		return "bbs/bbsM";
	}
	
	/**
	 * 게시판관리 화면 -> 게시판 상세정보 영역(폼)
	 *
	 * @author 경성구
	 * @since  2023-01-14
	 * @param  bbs_id
	 */
	//@GetMapping("/bbsD")
	@RequestMapping(value = "/bbsD")
	public String bbsD(@RequestParam(required = false)String bbs_id, Model model) {
		log.info("OneList.......");
		
		Bbs bbs = bbsService.detailBbs(bbs_id);
		
		model.addAttribute("bbs",bbs);
		
		return "bbs/bbsD";
	}
	
	/**
	 * 게시판 수정
	 * @author 경성구
	 * @since  2023-01-14
	 * @param  bbs
	 * @return Map<String, Object>
	 */
	@PostMapping("/modifyBbs.do")
	@ResponseBody
	public Map<String,Object> modifyBbs(Bbs bbs){
		log.info("modifyBbs" + bbs.getBbs_id());
		
		return bbsService.modifyBbs(bbs);
	}
	
}
