package com.spring.project.bid.dto;

public class BidDTO {
	private String aucId;
	private String memId;
	private int bidPrice;
	private String bidDate;
	private String isValidate;
	private int preBid;
	
	public BidDTO() {
		super();
	}

	public BidDTO(String aucId, String memId, int bidPrice, String bidDate, String isValidate, int preBid) {
		super();
		this.aucId = aucId;
		this.memId = memId;
		this.bidPrice = bidPrice;
		this.bidDate = bidDate;
		this.isValidate = isValidate;
		this.preBid = preBid;
	}

	@Override
	public String toString() {
		return "BidDTO [aucId=" + aucId + ", memId=" + memId + ", bidPrice=" + bidPrice + ", bidDate=" + bidDate
				+ ", isValidate=" + isValidate + ", preBid=" + preBid + "]";
	}

	public String getAucId() {
		return aucId;
	}

	public void setAucId(String aucId) {
		this.aucId = aucId;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public int getBidPrice() {
		return bidPrice;
	}

	public void setBidPrice(int bidPrice) {
		this.bidPrice = bidPrice;
	}

	public String getBidDate() {
		return bidDate;
	}

	public void setBidDate(String bidDate) {
		this.bidDate = bidDate;
	}

	public String getIsValidate() {
		return isValidate;
	}

	public void setIsValidate(String isValidate) {
		this.isValidate = isValidate;
	}

	public int getPreBid() {
		return preBid;
	}

	public void setPreBid(int preBid) {
		this.preBid = preBid;
	}


	
	
	
}
