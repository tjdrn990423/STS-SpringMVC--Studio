/**
 * @identity PostService.java
 * @author   경성구
 * @since    2023-01-19
 *
 */
package com.sun.studio.service;

import java.util.List;
import java.util.Map;


import com.sun.studio.model.Post;
import com.sun.studio.model.PostVEO;

public interface PostService {
	Map<String,Object> searchPostVEOAsPaging(PostVEO postVEO);
	PostVEO detailPostVEO(int post_no);
	int addReadCnt(int post_no);
	Map<String, Object> createPost(Post post);
	Map<String, Object> modifyPost(Post post);
	Map<String, Object> removePost(int post_no);
	List<PostVEO> getRecentPostVEO(String bbs_id);
}
