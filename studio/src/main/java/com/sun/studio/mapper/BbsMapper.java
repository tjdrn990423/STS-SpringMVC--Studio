/**
 * @identity BbsMapper.java
 * @author 경성구
 * @since 2023-01-14
 * 
 */
package com.sun.studio.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sun.studio.model.Bbs;

@Mapper
public interface BbsMapper {
	List<Bbs> selectBbs();
	Bbs selectOneBbs(String bbs_id);
	int updateBbs(Bbs bbs);
}
