/**
 * @identity SysUserMapper.java
 * @author 경성구
 * @since 2023-01-28
 *
 */
package com.sun.studio.mapper;


import org.apache.ibatis.annotations.Mapper;

import com.sun.studio.model.SysUser;
import com.sun.studio.model.SysUserVEO;


/**
 * 회원 관련 매퍼
 *
 * @author 경성구
 * @since 2023-01-28
 * @history 2023-01-28 최초 작성
 */
@Mapper
public interface SysUserMapper {
	SysUserVEO selectOneSysUserVEO(int pno);
	int insertSysUser(SysUser user);
	int updateSysUser(SysUser user);
	int deleteSysUser(int pno);
	String loginCheck(SysUser user) throws Exception;
	Integer loginCheck2(SysUser user) throws Exception;
	Integer loginCheck3(SysUser user) throws Exception;

}
