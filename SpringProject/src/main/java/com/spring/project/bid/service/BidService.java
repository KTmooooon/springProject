package com.spring.project.bid.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.auction.dto.AuctionDTO;
import com.spring.project.bid.dao.IBidDAO;
import com.spring.project.bid.dto.BidDTO;

@Service
public class BidService {
	
	@Autowired
	IBidDAO dao;
	
	public List<BidDTO> getBidList(String aucId){
		List<BidDTO> result = dao.getBidList(aucId);
		return result;
	}
	
	public int wirteBid(BidDTO bid) {
		int result = dao.writeBid(bid);
		return result;
	}
	
	public int updateBid(BidDTO bid) {
		int result = dao.updateBid(bid);
		return result;
		
	}
	
	public List<BidDTO> getCartBidList(String memId) {
		List<BidDTO> result = dao.getCartBidList(memId);
		return result;
	}
	
	public BidDTO getPreBid(BidDTO bid) {
		BidDTO result = dao.getPreBid(bid);
		return result;
	}
	
	public List<BidDTO> findDownBid(AuctionDTO auc){
		List<BidDTO> result = dao.findDownBid(auc);
		return result;
	}
	public BidDTO findUpBid(AuctionDTO auc){
		BidDTO result = dao.findUpBid(auc);
		return result;
	}
}
