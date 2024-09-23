package com.spring.project.bid.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.project.bid.service.BidService;

@Controller
public class BidController {
	
	@Autowired
	BidService bidService;
	
	
	
	
}
