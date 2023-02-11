package com.sun.studio;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.sun.studio.model.Bbs;
import com.sun.studio.model.PostVEO;
import com.sun.studio.service.PostService;

import lombok.extern.log4j.Log4j;


/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private PostService postService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		List<PostVEO> list = postService.getRecentPostVEO("PHOTO");
		model.addAttribute("photo", list );
		model.addAttribute("serverTime", formattedDate );
		
		System.out.println(this);
		
		return "home";
	}
	
	@GetMapping("/exUpload")
	public void exUpload() { 
		log.info("exUpload.........");
	}
	
	@PostMapping("/exUploadPost")
	public void exUploadPost(ArrayList<MultipartFile> files) {
		
		files.forEach(file -> {
			log.info(file.getOriginalFilename());
			log.info(file.getSize());
			log.info(file.getContentType());
		});
		
	}
	
	@GetMapping("/ex1")
	public void ex1(Bbs bbs) { 
		log.info(bbs);
	}
	
}
