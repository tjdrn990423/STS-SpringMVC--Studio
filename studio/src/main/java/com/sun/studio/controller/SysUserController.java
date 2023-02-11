/**
 * @identity SysUserController.java
 * @author   경성구
 * @since    2023-01-28
 *
 */
package com.sun.studio.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sun.studio.model.SysUser;
import com.sun.studio.model.SysUserVEO;
import com.sun.studio.service.SysUserService;

import lombok.extern.log4j.Log4j;

/**
 * 회원 관련 컨트롤러
 *
 * @author  경성구
 * @since   2023-01-28
 * @history 2022-01-28 경성구
 *
 */
@Controller
@RequestMapping("/user/*")
@Log4j
public class SysUserController {
	
	@Autowired
	private SysUserService sysUserService;
	
	/**
	 * 로그인 화면
	 *
	 * @author 경성구
	 * @since  2023-01-28
	 *
	 */
	@RequestMapping(value = "/login")
	public String login() {
		log.info("login.......");
		return "user/login";
	}
	
	/**
	 * 회원가입 화면
	 *
	 * @author 경성구
	 * @since  2023-01-30
	 *
	 */
	@RequestMapping(value = "/userC")
	public String userC() {
		log.info("userC.......");
		
		return "user/userC";
	}
	
	/**
	 * 회원정보 수정 화면
	 *
	 * @author 경성구
	 * @since  2023-01-25
	 * @param  bbs_id
	 * @param  page
	 * @param  subject
	 *
	 */
	@RequestMapping(value = "/userM")
	public String userM(@RequestParam(required = true) Integer pno, ModelMap modelMap) {
		log.info("회원정보 수정 화면...........");
		SysUserVEO sysUserVEO = sysUserService.detailSysUserVEO(pno);
		modelMap.put("user", sysUserVEO);
		
		return "user/userM";
	}
	
	/**
	 * 로그인 
	 *
	 * @author 경성구
	 * @since  2023-01-31
	 *
	 */
	//@RequestMapping("/loginCheck.do")
	@PostMapping("/loginCheck.do")
	public String loginCheck(@ModelAttribute SysUser user, HttpSession session,Model model) throws Exception {
		String name = sysUserService.loginCheck(user, session);
		Integer pno = sysUserService.loginCheck2(user, session);
		Integer user_level = sysUserService.loginCheck3(user, session);
		
		if(name == null || pno == null || user_level == null) {
			log.info("실패");
			model.addAttribute("message", "fail");
			return "user/login";
		}
		else {
			log.info("성공");
			log.info(user_level);
			return "home";
		}
	}
	
	/**
	 * 로그아웃 
	 *
	 * @author 경성구
	 * @since  2023-01-31
	 *
	 */
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		sysUserService.logout(session);
		return "home";
	}
	
	/**
	 * 회원 등록
	 * @author 경성구
	 * @since  2023-01-28
	 * @param  user
	 * @return Map<String, Object>
	 */
	@PostMapping("/create.do")
	@ResponseBody
	public Map<String,Object> createUser(SysUser user){
		log.info("createUser : " + user.getPno());
		log.info("id : " + user.getId());
		log.info("pw : " + user.getPassword());
		log.info("name : " + user.getName());
		
		return sysUserService.createSysUser(user);
	}
	
	/**
	 * 화원 수정
	 *
	 * @author 경성구
	 * @since  2023-01-28
	 * @param  user
	 * @return Map<String, Object> : RESULT, MESSAGE
	 */
	@PostMapping(value = "/modify.do")
	@ResponseBody
	public Map<String, Object> modifyUser(@ModelAttribute SysUser user){
		log.info("modifyUser : " + user.getPno());
		
		return sysUserService.modifySysUser(user);
	}
	
	/**
	 * 회원 삭제
	 *
	 * @author  경성구
	 * @since   2023-01-28
	 * @param   pno
	 * @return  Map<String, Object> : RESULT, MESSAGE
	 *
	 */
	@RequestMapping(value = "/remove.do")
	@ResponseBody
	public Map<String, Object> removeUser(@RequestParam(required = true) int pno, HttpSession session){
		log.info("removeUser : " + pno);
		session.invalidate();
		return sysUserService.removeSysUser(pno);
	}
	

}
