/**
 * @identity PostMapper.java
 * @author 경성구
 * @since 2023-01-19
 *
 */
package com.sun.studio.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sun.studio.model.Post;
import com.sun.studio.model.PostVEO;

/**
 * 게시물 관련 매퍼
 *
 * @author 경성구
 * @since 2023-01-19
 * @history 2023-01-19 최초 작성
 */
@Mapper
public interface PostMapper {
	List<PostVEO> selectPagePostVEO(PostVEO postVEO);
	int countPost(PostVEO postVEO);
	PostVEO selectOnePostVEO(int post_no);
	int updateReadCnt(int post_no);
	int insertPost(Post post);
	int updatePost(Post post);
	int deletePost(int post_no);
	List<PostVEO> selectRecentPostVEO(String bbs_id);

}
