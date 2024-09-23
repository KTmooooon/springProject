package com.spring.project.auction.web;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.project.attach.service.AttachService;
import com.spring.project.auction.dto.AuctionDTO;
import com.spring.project.auction.service.AuctionService;
import com.spring.project.bid.dto.BidDTO;
import com.spring.project.bid.service.BidService;
import com.spring.project.member.dto.MemberDTO;
import com.spring.project.member.service.MemberService;

@Controller
public class AuctionController {

	@Autowired
	AuctionService auctionService;
	
	@Autowired
	BidService bidService;
	
	@Autowired
	MemberService memberService;
	@Autowired
	AttachService attachService;

	
	@RequestMapping("/auctionView")
	public String auctionView(Model model) {
		
		auctionService.updateTime();
		auctionService.finishAuction();
		
		
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String formatTime = now.format(formatter);
		
		
		model.addAttribute("currentTime", formatTime);
		

		List<AuctionDTO> aucList = auctionService.getAuctionList();

		model.addAttribute("keyAucList", aucList);
		
		List<AuctionDTO> finAucList = auctionService.findLast();
		System.out.println(finAucList);
		
		for (AuctionDTO auct : finAucList) {
			System.out.println(auct);
			List<BidDTO> downBidList = bidService.findDownBid(auct);
			if(downBidList.size() > 0) {
				for (BidDTO dBid : downBidList) {
					memberService.updateDownBid(dBid);
				}
			}
			BidDTO upBid = bidService.findUpBid(auct);
			upBid.setMemId(auct.getMemId());
			memberService.updateDownBid(upBid);
			
			String v_auc_id = auct.getAucId();
			auctionService.updateRefYn(v_auc_id);
		}
		
		
		return "auction/auctionView";
	}
	
	

	@RequestMapping("/auctionWriteView")
	public String auctionWriteView(HttpSession session) {

		if (session.getAttribute("login") == null) {
			return "redirect:/loginView";
		}

		System.out.println(session.getAttribute("login"));

		return "auction/auctionWriteView";
	}

	
	@RequestMapping("/auctionWriteDo")
	public String auctionWriteDo(AuctionDTO auc, HttpSession session, @RequestParam("file") MultipartFile file, Model model) {
	    // ���� ID ����
	    Date date = new Date();
	    SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmssSSS");
	    String uniqueId = sdf.format(date);
	    for (int i = 0; i < 3; i++) {
	        uniqueId += (int) (Math.random() * 10);
	    }
	    
	    // �α����� ����� ���� ��������
	    MemberDTO login = (MemberDTO) session.getAttribute("login");
	    String memberId = login.getMemId();

	    // AuctionDTO�� �ʿ��� �� ����
	    auc.setMemId(memberId);
	    auc.setAucId(uniqueId);

	    // �̹��� ���� ó��
	    if (!file.isEmpty()) {
	        try {
	            String imagePath = saveImageFile(file); // �̹��� ���� �޼��� ȣ��
	            auc.setAucImg(imagePath); // �̹��� ��θ� DTO�� ����
	        } catch (IOException e) {
	            e.printStackTrace(); // ���� �α� ���
	            model.addAttribute("error", "�̹��� ���ε忡 �����߽��ϴ�.");
	            return "errorPage"; // ���� �������� �����̷�Ʈ
	        }
	    }

	    // ��� ��� ���� ȣ��
	    auctionService.registAuction(auc);

	    return "redirect:/auctionView"; // ���� �� ��� ���� �������� �����̷�Ʈ
	}
	

	// �̹��� ���� ���� �޼���
	private String saveImageFile(MultipartFile file) throws IOException {
	    String uploadDir = "C:\\upload"; // ���� ��η� ����
	    File directory = new File(uploadDir);
	    
	    // ���丮�� �������� ������ ����
	    if (!directory.exists()) {
	        directory.mkdirs(); // ���丮 ����
	    }

	    String originalFilename = file.getOriginalFilename();
	    String newFilename = originalFilename; // ���ο� ���ϸ� ����
	    File destinationFile = new File(directory, newFilename);

	    // ���� ����
	    file.transferTo(destinationFile);

	    // ����� �̹��� ���� ��� ��ȯ
	    return "/upload/" + newFilename; // ������ ������ �� �ִ� ��η� ����
	}
	
	
	@RequestMapping("/auctionDetailView")
	public String auctionDetailView(String aucId, Model model, HttpSession session) {
		
		
		System.out.println(aucId);
		
		AuctionDTO auction = auctionService.getAuction(aucId);
		
		List<BidDTO> invalidBidList = auctionService.getInvalidateBid(auction);
		
		
		String auctionMemId = auction.getMemId();
		session.setAttribute("auctionMemId", auctionMemId);
		model.addAttribute("keyAuction",auction);
		
		List<BidDTO> bidList = bidService.getBidList(aucId);
		model.addAttribute("keyBidList", bidList);
		
		
		
		
		session.setAttribute("aucId", aucId);
		
		return "auction/auctionDetailView";
	}
	
	
	@ResponseBody
	@RequestMapping("/bidDo")
	public BidDTO bidDo(BidDTO bid, HttpServletRequest request, HttpSession session) {
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd HH:mm");
		String sysDate = sdf.format(date);
		
		bid.setAucId((String) session.getAttribute("aucId"));
		MemberDTO mem = (MemberDTO) session.getAttribute("login");
		String memId = mem.getMemId();
		String memPw = mem.getMemPassword();
		bid.setMemId(memId);
		BidDTO preBid = bidService.getPreBid(bid);
		
		if(preBid != null) {
			bid.setPreBid(preBid.getBidPrice());
		}else{
			bid.setPreBid(0);
		};
		
		if(bid.getBidPrice() - bid.getPreBid() <= mem.getMoney()) {
			System.out.println(bid);
			
			MemberDTO member = new MemberDTO();
			member.setMemId(memId);
			member.setMemPassword(memPw);
			memberService.updateMoney(bid);
			MemberDTO login = memberService.loginMemeber(member);
			
			session.setAttribute("login", login);
			
			
			String aucId = (String) session.getAttribute("aucId");
			AuctionDTO auc = new AuctionDTO();
			auc.setMemId(memId);
			auc.setAucId(aucId);
			
			bid.setBidDate(sysDate);
			bidService.wirteBid(bid);
			bidService.updateBid(bid);
			auctionService.updateCurPrice(bid);
			
			auctionService.updateLastId(auc);
			
			
		}else {
			System.out.println(bid);
		}
		return bid;
		
	}
}
