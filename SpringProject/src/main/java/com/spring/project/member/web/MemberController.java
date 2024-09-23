package com.spring.project.member.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.project.auction.service.AuctionService;
import com.spring.project.bid.service.BidService;
import com.spring.project.member.dto.MemberDTO;
import com.spring.project.member.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	@Autowired
	AuctionService auctionService;
	@Autowired
	BidService bidService;

	
	
	
	@RequestMapping("/registView")
	public String registView() {
		return "member/registView";
	}
	
	// input �±� name�� �Է°��� request ��ü�� ��ܿ�
	@RequestMapping("/registDo")
	public String registDo(HttpServletRequest request) {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		int v_money = ((int)Math.round(Math.random() * 10)) * 100000;
		
		System.out.println("money=" + v_money);
		
		MemberDTO member = new MemberDTO(id,password,name,phone,email, v_money);
		
		memberService.registMember(member);
		
		return "member/loginView";
		// => / (�ʱ�ȭ��)
	}
	
	@RequestMapping("/loginView")
	public String loginView(HttpServletRequest req,Model model) {
		
		String fromUrl = req.getHeader("Referer");
		model.addAttribute("fromUrl", fromUrl);
		return "member/loginView";
	}
	
	@RequestMapping("/loginDo") 
	public String loginDo(MemberDTO member, HttpSession session, boolean rememberId, HttpServletResponse response, String fromUrl) { // �� �����ϰ� id,password ������ �� ����
		
		System.out.println(member.getMemId());
		
		MemberDTO login = memberService.loginMemeber(member);
		
		session.setAttribute("login", login);
		
		if(rememberId) {
			// ��Ű ����
			Cookie cookie = new Cookie("rememberId", member.getMemId());
			// ���䰴ü�� ��Ű ���
			response.addCookie(cookie);
		}else {
			// ��Ű ���� (������ Ű���� ������ ��Ű ����)
			Cookie cookie = new Cookie("rememberId", "");
			// ��Ű�� ��ȿ�Ⱓ�� 0���� �����
			cookie.setMaxAge(0);
			// ���䰴ü�� ��Ű�� ���� ���ڸ��� ����
			response.addCookie(cookie);
		}
		
		
		
		
		
		System.out.println(login);
		return "home";
	}
	
	@RequestMapping("/logoutDo")
	public String logoutDo(HttpSession session, String fromUrl) {
		
		session.invalidate();
		return "redirect:/";
	}
	
	
	@RequestMapping("/editDo")
	public String editDo(HttpSession session, HttpServletRequest request) {
		
		String v_p = request.getParameter("password");
		String v_n = request.getParameter("name");
		String v_ph = request.getParameter("phone");
		String v_e = request.getParameter("email");
		
		MemberDTO mem = (MemberDTO) session.getAttribute("login");
		String memId = mem.getMemId();
		int m_money = mem.getMoney();
		MemberDTO member = new MemberDTO(memId, v_p, v_n, v_ph, v_e, m_money );
		
		session.setAttribute("login", member);
		
		memberService.editMember(member);
		
		return "redirect:/";
	}
	
	
}
