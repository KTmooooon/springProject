package com.spring.project.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.cart.dao.ICartDAO;
import com.spring.project.cart.dto.CartDTO;

@Service
public class CartService {
	
	
	
	@Autowired
	ICartDAO dao;

	
}
