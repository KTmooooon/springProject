package com.spring.project.auction.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.auction.dao.IAuctionDAO;
import com.spring.project.auction.dto.AuctionDTO;
import com.spring.project.bid.dto.BidDTO;

@Service
public class AuctionService {
	
	@Autowired
	IAuctionDAO dao;
	
	public int registAuction(AuctionDTO auc) {
		int result = dao.registAuction(auc);
		return result;
	}
	
	public List<AuctionDTO> getAuctionList(){
		List<AuctionDTO> result = dao.getAuctionList();
		return result;
	}
	
	public AuctionDTO getAuction(String aucId) {
		AuctionDTO result = dao.getAuction(aucId);
		
		return result;
	}
	
	public int updateCurPrice(BidDTO bid) {
		int result = dao.updateCurPrice(bid);
		return result; 
	}
	
	public int updateTime() {
		int result = dao.updateTime();
		return result; 
	}
	
	public int finishAuction() {
		int result = dao.finishAuction();
		return result;
			
	}
	
	public AuctionDTO getCartAucList(String aucId) {
		AuctionDTO result = dao.getCartAucList(aucId);
		return result;
		
	}
	
	public int updateLastId(AuctionDTO auc) {
		int result = dao.updateLastId(auc);
		return result;
	}
	
	public List<AuctionDTO> getMyList(String memId) {
		List<AuctionDTO> result = dao.getMyList(memId);
		return result;
	}
	
	public List<BidDTO> getInvalidateBid(AuctionDTO auc){
		List<BidDTO> result = dao.getInvalidateBid(auc);
		return result;
	}
	
	public List<AuctionDTO> getSellList(String memId){
		List<AuctionDTO> result = dao.getSellList(memId);
		return result;
	}
	
	public List<AuctionDTO> findLast(){
		List<AuctionDTO> result = dao.findLast();
		return result;
	}
	
	public int updateRefYn(String aucId) {
		int result = dao.updateRefYn(aucId);
		return result;
	}
}

