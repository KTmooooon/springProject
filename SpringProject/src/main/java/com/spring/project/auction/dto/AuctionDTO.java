package com.spring.project.auction.dto;

import java.util.Date;

public class AuctionDTO {
	 private String aucId;
	 private String aucName;
	 private String aucContent;
	 private String memId;
	 private int startPrice;
	 private int curPrice;
	 private String aucDate;
	 private int aucDuration;
	 private String finYn;
	 private String leftTime;
	 private String lastBidId;
	 private String aucImg;
	 private String refundYn;
	 
	public AuctionDTO() {
		super();
	}

	public AuctionDTO(String aucId, String aucName, String aucContent, String memId, int startPrice, int curPrice,
			String aucDate, int aucDuration, String finYn, String leftTime, String lastBidId, String aucImg,
			String refundYn) {
		super();
		this.aucId = aucId;
		this.aucName = aucName;
		this.aucContent = aucContent;
		this.memId = memId;
		this.startPrice = startPrice;
		this.curPrice = curPrice;
		this.aucDate = aucDate;
		this.aucDuration = aucDuration;
		this.finYn = finYn;
		this.leftTime = leftTime;
		this.lastBidId = lastBidId;
		this.aucImg = aucImg;
		this.refundYn = refundYn;
	}

	@Override
	public String toString() {
		return "AuctionDTO [aucId=" + aucId + ", aucName=" + aucName + ", aucContent=" + aucContent + ", memId=" + memId
				+ ", startPrice=" + startPrice + ", curPrice=" + curPrice + ", aucDate=" + aucDate + ", aucDuration="
				+ aucDuration + ", finYn=" + finYn + ", leftTime=" + leftTime + ", lastBidId=" + lastBidId + ", aucImg="
				+ aucImg + ", refundYn=" + refundYn + "]";
	}

	public String getAucId() {
		return aucId;
	}

	public void setAucId(String aucId) {
		this.aucId = aucId;
	}

	public String getAucName() {
		return aucName;
	}

	public void setAucName(String aucName) {
		this.aucName = aucName;
	}

	public String getAucContent() {
		return aucContent;
	}

	public void setAucContent(String aucContent) {
		this.aucContent = aucContent;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public int getStartPrice() {
		return startPrice;
	}

	public void setStartPrice(int startPrice) {
		this.startPrice = startPrice;
	}

	public int getCurPrice() {
		return curPrice;
	}

	public void setCurPrice(int curPrice) {
		this.curPrice = curPrice;
	}

	public String getAucDate() {
		return aucDate;
	}

	public void setAucDate(String aucDate) {
		this.aucDate = aucDate;
	}

	public int getAucDuration() {
		return aucDuration;
	}

	public void setAucDuration(int aucDuration) {
		this.aucDuration = aucDuration;
	}

	public String getFinYn() {
		return finYn;
	}

	public void setFinYn(String finYn) {
		this.finYn = finYn;
	}

	public String getLeftTime() {
		return leftTime;
	}

	public void setLeftTime(String leftTime) {
		this.leftTime = leftTime;
	}

	public String getLastBidId() {
		return lastBidId;
	}

	public void setLastBidId(String lastBidId) {
		this.lastBidId = lastBidId;
	}

	public String getAucImg() {
		return aucImg;
	}

	public void setAucImg(String aucImg) {
		this.aucImg = aucImg;
	}

	public String getRefundYn() {
		return refundYn;
	}

	public void setRefundYn(String refundYn) {
		this.refundYn = refundYn;
	}

	
	
	

	

	
	
	
	 
}
