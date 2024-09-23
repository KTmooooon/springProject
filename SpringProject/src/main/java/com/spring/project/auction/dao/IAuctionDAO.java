package com.spring.project.auction.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.project.auction.dto.AuctionDTO;
import com.spring.project.bid.dto.BidDTO;

@Mapper
public interface IAuctionDAO {

	int registAuction(AuctionDTO auc);
	
	List<AuctionDTO> getAuctionList();
	
	AuctionDTO getAuction(String aucId);
	
	int updateCurPrice(BidDTO bid);
	
	int updateTime();
	
	int finishAuction();
	
	AuctionDTO getCartAucList(String aucId);
	
	int updateLastId(AuctionDTO auc);
	
	List<AuctionDTO> getMyList(String memId);
	
	List<BidDTO> getInvalidateBid(AuctionDTO auc);
	
	List<AuctionDTO> getSellList(String memId);
	
	List<AuctionDTO> findLast();
	
	int updateRefYn(String aucId);
}
