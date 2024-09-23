package com.spring.project.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.bid.dto.BidDTO;
import com.spring.project.member.dao.IMemberDAO;
import com.spring.project.member.dto.MemberDTO;

@Service
public class MemberService {

	@Autowired
	IMemberDAO dao;
	
	public int registMember(MemberDTO member) {
		
		int result = dao.registMember(member);
		return result;
	}
	
	public MemberDTO loginMemeber(MemberDTO member) {
		
		MemberDTO result = dao.loginMember(member);
		return result;
	}
	
	public int updateMoney(BidDTO bid) {
		int result = dao.updateMoney(bid);
		return result;
	}
	
	public int editMember(MemberDTO mem) {
		int result = dao.editMember(mem);
		return result;
	}
	
	public int updateDownBid(BidDTO bid) {
		int result = dao.updateDownBid(bid);
		return result;
	}
}
