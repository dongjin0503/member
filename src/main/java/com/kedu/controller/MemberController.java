package com.kedu.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	
	@Autowired
	private MemberDAO dao;

	@RequestMapping("/login")
	public String login(MemberDTO dto, HttpSession session) throws Exception {
		
		boolean loginId = dao.login(dto);
		
		if(loginId) {
			session.setAttribute("loginId", loginId);
			
		}
		return "redirect:/";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		
		return "/";
	}
	
	@RequestMapping("/delete")
	public String delete(HttpSession session, MemberDTO dto)throws Exception{
		
		session.invalidate();
		dao.delete(dto);
		
		return "redirect:/home";
	}
	
	
	
	@RequestMapping("/signup")
	public String signup() throws Exception{
		
		return "signup";
	}
	
	@RequestMapping("/mypage")
	public String mypage(MemberDTO dto,Model model)throws Exception{
		
		model.addAttribute("myId",dto.getId);
		return "mypage";
	}
}
