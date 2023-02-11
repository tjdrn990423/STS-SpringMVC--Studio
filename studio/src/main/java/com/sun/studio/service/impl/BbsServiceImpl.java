/**
 * @identity BbsServiceImpl.java
 * @author   경성구
 * @since    2023-01-14
 *
 */
package com.sun.studio.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.studio.mapper.BbsMapper;
import com.sun.studio.model.Bbs;
import com.sun.studio.service.BbsService;


/**
 * 게시판 관련 서비스
 *
 * @author  경성구
 * @since   2023-01-14
 * @history 2023-01-14 경성구 - 최초 작성
 */
@Service
public class BbsServiceImpl implements BbsService{
	
	@Autowired
	private BbsMapper bbsMapper;

	/**
     * 게시판 목록 조회
     *
     * @author 경성구
     * @since  2023-01-14
     * @return List<Bbs>
     */
	@Override
	public List<Bbs> searchBbs() {
		return bbsMapper.selectBbs();
	}

	/**
	 * 게시판 상세 조회
	 *
	 * @author 경성구
	 * @since  2023-01-14
	 * @param  bbs_id
	 * @return Bbs
	 */
	@Override
	public Bbs detailBbs(String bbs_id) {
		return bbsMapper.selectOneBbs(bbs_id);
	}

	/**
     * 게시판 수정
     *
     * @author 경성구
     * @since  2023-01-16
     * @param  Bbs
     * @return Map<String, Object> : RESULT, MESSAGE
     */
	@Override
	public Map<String, Object> modifyBbs(Bbs bbs) {
		Map<String,Object> resultMap = new HashMap<String,Object>();
		
		String bbs_id = bbs.getBbs_id();
		String bbs_name = bbs.getBbs_name();
		Integer read_level = bbs.getRead_level();
		Integer write_level = bbs.getWrite_level();
		
		if(bbs_id == null || bbs_id.equals("") || bbs_name == null || bbs_name.equals("") 
				|| read_level == null || write_level == null) {
			
			resultMap.put("RESULT", "FAIL");
			resultMap.put("MESSAGE", "필수값이 누락되었습니다.");
			
			return resultMap;
		}
		
		int updateBbs = bbsMapper.updateBbs(bbs);
		
		if(updateBbs < 1) {
			resultMap.put("RESULT", "FAIL");
			resultMap.put("MESSAGE", "Database 오류");
		}
		else {
			resultMap.put("RESULT", "OK");
			resultMap.put("MESSAGE", "게시판이 수정되었습니다.");
		}
		
		return resultMap;
	}
	
	
}
