package com.spring.project.member.dao;

import org.apache.ibatis.annotations.Mapper;

import com.spring.project.bid.dto.BidDTO;
import com.spring.project.member.dto.MemberDTO;

@Mapper
public interface IMemberDAO {

	int registMember(MemberDTO member);
	
	MemberDTO loginMember(MemberDTO member);
	
	int updateMoney(BidDTO bid);
	
	int editMember(MemberDTO mem);
	
	int updateDownBid(BidDTO bid);
}
