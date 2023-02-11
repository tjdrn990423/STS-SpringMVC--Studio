/**
 * @identity PostService.java
 * @author   경성구
 * @since    2023-01-19
 *
 */
package com.sun.studio.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.sun.studio.model.SysUser;
import com.sun.studio.model.SysUserVEO;

public interface SysUserService {
	SysUserVEO detailSysUserVEO(int pno);
	Map<String, Object> createSysUser(SysUser user);
	Map<String, Object> modifySysUser(SysUser user);
	Map<String, Object> removeSysUser(int pno);
	String loginCheck(SysUser user, HttpSession session) throws Exception;
	Integer loginCheck2(SysUser user, HttpSession session) throws Exception;
	Integer loginCheck3(SysUser user, HttpSession session) throws Exception;
	void logout(HttpSession session);
}
