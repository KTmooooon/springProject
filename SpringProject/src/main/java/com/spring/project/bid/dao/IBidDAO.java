package com.spring.project.bid.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.project.auction.dto.AuctionDTO;
import com.spring.project.bid.dto.BidDTO;

@Mapper
public interface IBidDAO {
	List<BidDTO> getBidList(String aucId);
	
	int writeBid(BidDTO bid);
	
	int updateBid(BidDTO bid);
	
	List<BidDTO> getCartBidList(String memId);
	
	BidDTO getPreBid(BidDTO bid);
	
	List<BidDTO> findDownBid(AuctionDTO auc);
	
	BidDTO findUpBid(AuctionDTO auc);
}
