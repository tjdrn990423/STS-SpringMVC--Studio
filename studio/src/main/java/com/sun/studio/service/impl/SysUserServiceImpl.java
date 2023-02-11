/**
 * @identity SysUserServiceImpl.java
 * @author   경성구
 * @since    2023-01-28
 *
 */
package com.sun.studio.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.studio.mapper.SysUserMapper;
import com.sun.studio.model.SysUser;
import com.sun.studio.model.SysUserVEO;
import com.sun.studio.service.SysUserService;

/**
 * 회원 관련 서비스
 *
 * @author  경성구
 * @since   2023-01-28
 * @history 2023-01-28 경성구 - 최초 작성
 */
@Service
public class SysUserServiceImpl implements SysUserService {

	@Autowired
	private SysUserMapper sysUserMapper;
	
	/**
	 * 회원 상세정보
	 *
	 * @author 경성구
	 * @since  2023-01-28
	 * @param  pno
	 * @return SysUserVEO
	 */
	@Override
	public SysUserVEO detailSysUserVEO(int pno) {
		return sysUserMapper.selectOneSysUserVEO(pno);
	}
	
	/**
	 * 회원 등록
	 *
	 * @author 경성구
	 * @since  2023-01-28
	 * @param  SysUser
	 * @return Map<String, Object> : RESULT, MESSAGE
	 */
	@Override
	public Map<String, Object> createSysUser(SysUser user) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		String id = user.getId();
		String password = user.getPassword();
		String name = user.getName();
		
		if(id == null || id.equals("") || password == null || password.equals("")
				|| name == null || name.equals("")) {
			map.put("RESULT", "FAIL");
			map.put("MESSAGE", "필수값이 누락되었습니다.");
			return map;
		}
		
		int insertCnt = sysUserMapper.insertSysUser(user);
		
		if(insertCnt < 1) {
			map.put("RESULT", "FAIL");
			map.put("MESSAGE", "Database 오류");
		}
		else {
			map.put("RESULT", "OK");
			map.put("MESSAGE", "회원가입이 되셨습니다.");
		}
		
		return map;
	}

	/**
	 * 회원 수정
	 *
	 * @author 경성구
	 * @since  2023-01-28
	 * @param  user
	 * @return Map<String, Object> : RESULT, MESSAGE
	 */
	@Override
	public Map<String, Object> modifySysUser(SysUser user) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		Integer pno = user.getPno();
		String password = user.getPassword();
		String name = user.getName();
		
		if(pno == null || password == null || password.equals("")
				|| name == null || name.equals("")) {
			map.put("RESULT", "FAIL");
			map.put("MESSAGE", "필수값이 누락되었습니다.");
			return map;
		}
		
		int updateCnt = sysUserMapper.updateSysUser(user);
		
		if(updateCnt < 1) {
			map.put("RESULT", "FAIL");
			map.put("MESSAGE", "Database 오류");
		}
		else {
			map.put("RESULT", "OK");
			map.put("MESSAGE", "회원정보가 수정 되었습니다.");
		}
		
		return map;
	}

	/**
	 * 회원 삭제
	 *
	 * @author 경성구
	 * @since  2023-01-25
	 * @param  pno
	 * @return Map<String, Object> : RESULT, MESSAGE
	 */
	@Override
	public Map<String, Object> removeSysUser(int pno) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int deleteCnt = sysUserMapper.deleteSysUser(pno);
		
		if(deleteCnt < 1) {
			map.put("RESULT", "FAIL");
			map.put("MESSAGE", "Database 오류");
		}
		else {
			map.put("RESULT", "OK");
			map.put("MESSAGE", "회원이 삭제 되었습니다.");
		}
		
		return map;
	}
	
	/**
	 * 로그인 체크
	 *
	 * @author 경성구
	 * @since  2023-01-31
	 * @param  user , session
	 * @return String
	 */
	@Override
	public String loginCheck(SysUser user, HttpSession session) throws Exception {
		String name = sysUserMapper.loginCheck(user);
		 
		if (name == null) { // 세션 변수 저장
			 return null;
		 }
		 else {
			 session.setAttribute("userid", user.getId());
			 session.setAttribute("name", name);
		 }
		 return name; 
	}
	
	/**
	 * 로그아웃
	 *
	 * @author 경성구
	 * @since  2023-01-31
	 * @param   session
	 */
	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

	/**
	 * 로그인 체크2 -> pno
	 *
	 * @author 경성구
	 * @since  2023-02-04
	 * @param  user , session
	 * @return int
	 */
	@Override
	public Integer loginCheck2(SysUser user, HttpSession session) throws Exception {
		Integer pno = sysUserMapper.loginCheck2(user);
		 
		if (pno == null) { // 세션 변수 저장
			 return null;
		 }
		 else {
			 session.setAttribute("pno", pno);
		 }
		 return pno; 
	}

	/**
	 * 로그인 체크3 -> user_level
	 *
	 * @author 경성구
	 * @since  2023-02-06
	 * @param  user , session
	 * @return int
	 */
	@Override
	public Integer loginCheck3(SysUser user, HttpSession session) throws Exception {
		Integer user_level = sysUserMapper.loginCheck3(user);
		 
		if (user_level == null) { // 세션 변수 저장
			 return null;
		 }
		 else {
			 session.setAttribute("user_level", user_level);
		 }
		 return user_level; 
	}
	

}
