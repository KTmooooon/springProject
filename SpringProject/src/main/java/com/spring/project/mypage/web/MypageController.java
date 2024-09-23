package com.spring.project.mypage.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.project.auction.dto.AuctionDTO;
import com.spring.project.auction.service.AuctionService;
import com.spring.project.bid.dto.BidDTO;
import com.spring.project.bid.service.BidService;
import com.spring.project.cart.service.CartService;
import com.spring.project.member.dto.MemberDTO;
import com.spring.project.member.service.MemberService;

@Controller
public class MypageController {

	@Autowired
	AuctionService auctionService;
	@Autowired
	CartService cartService;
	@Autowired
	MemberService memberService;
	@Autowired
	BidService bidService;
	
	@RequestMapping("/myPageView")
	public String myPageView(HttpSession session, Model model) {
		
		MemberDTO member = (MemberDTO)session.getAttribute("login");
		String memberId = member.getMemId();
		
		List<BidDTO> cartBidList = bidService.getCartBidList(memberId);
		model.addAttribute("keyCartBid", cartBidList);
		ArrayList<Integer> intList = new ArrayList<Integer>();
		ArrayList<String> aucIdList = new ArrayList<String>();
		ArrayList<AuctionDTO> auctionList = new ArrayList<AuctionDTO>();
		
		for(int i =0; i<cartBidList.size(); i++) {
			intList.add(i);
			aucIdList.add(cartBidList.get(i).getAucId());
		}
		for(int i =0; i<cartBidList.size(); i++) {
			auctionList.add(auctionService.getCartAucList(aucIdList.get(i)));
		}
		model.addAttribute("keyIntList", intList);
		model.addAttribute("keyAuctionList",auctionList);
		
		
		List<AuctionDTO> aucSellList = auctionService.getSellList(memberId);
		model.addAttribute("keySellList", aucSellList);
		
		return "/mypage/myPageView";
	}
}
