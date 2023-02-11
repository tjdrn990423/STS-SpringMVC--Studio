package com.sun.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sun.studio.service.BbsService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BbsServiceTests {
	
	@Autowired
	private BbsService bbsService;
	
	@Test
	public void testSearchBbs() {
		//log.info(bbsService.searchBbs());
		bbsService.searchBbs().forEach(bbs -> log.info(bbs));
	}
	
}
