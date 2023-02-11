/**
 * @identity BbsService.java
 * @author   경성구
 * @since    2023-01-14
 * 
 */
package com.sun.studio.service;

import java.util.List;
import java.util.Map;

import com.sun.studio.model.Bbs;

public interface BbsService {

	List<Bbs> searchBbs();
	Bbs detailBbs(String bbs_id);
	Map<String,Object> modifyBbs(Bbs bbs);
}
