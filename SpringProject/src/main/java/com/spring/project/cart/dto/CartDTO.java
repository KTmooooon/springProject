package com.spring.project.cart.dto;

public class CartDTO {
	private String memId;	
    private String aucId;
    private int bidPrice;
    private int startPrice;
    private int curPrice;
    private String isValidate;
    private String bidDate;
    private String leftTime;
    
	public CartDTO() {
		super();
	}
	public CartDTO(String memId, String aucId, int bidPrice, int startPrice, int curPrice, String isValidate,
			String bidDate, String leftTime) {
		super();
		this.memId = memId;
		this.aucId = aucId;
		this.bidPrice = bidPrice;
		this.startPrice = startPrice;
		this.curPrice = curPrice;
		this.isValidate = isValidate;
		this.bidDate = bidDate;
		this.leftTime = leftTime;
	}
	@Override
	public String toString() {
		return "CartDTO [memId=" + memId + ", aucId=" + aucId + ", bidPrice=" + bidPrice + ", startPrice=" + startPrice
				+ ", curPrice=" + curPrice + ", isValidate=" + isValidate + ", bidDate=" + bidDate + ", leftTime="
				+ leftTime + "]";
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getAucId() {
		return aucId;
	}
	public void setAucId(String aucId) {
		this.aucId = aucId;
	}
	public int getBidPrice() {
		return bidPrice;
	}
	public void setBidPrice(int bidPrice) {
		this.bidPrice = bidPrice;
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
	public String getIsValidate() {
		return isValidate;
	}
	public void setIsValidate(String isValidate) {
		this.isValidate = isValidate;
	}
	public String getBidDate() {
		return bidDate;
	}
	public void setBidDate(String bidDate) {
		this.bidDate = bidDate;
	}
	public String getLeftTime() {
		return leftTime;
	}
	public void setLeftTime(String leftTime) {
		this.leftTime = leftTime;
	}
    
    
}
