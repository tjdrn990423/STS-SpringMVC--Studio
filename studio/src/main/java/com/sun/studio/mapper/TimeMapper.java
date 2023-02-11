package com.sun.studio.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface TimeMapper {

	// ; 없어야 한다.
	@Select("select sysdate from dual")
	String getTime();
	
	String getTime2();
	
}
