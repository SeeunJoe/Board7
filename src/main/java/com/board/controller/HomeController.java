package com.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.board.menus.domain.MenuVo;
import com.board.menus.mapper.MenuMapper;
import com.board.user.domain.UserVo;
import com.board.user.mapper.UserMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	
	@Autowired
	private UserMapper userMapper;
	
	private MenuMapper menuMapper;

	// http://localhost:9090
	@RequestMapping("/")
	public  String   home() {
		return "home";
	}
	
	//loginForm
	@GetMapping("/loginForm")
	public ModelAndView loginForm() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("users/login");
		return mv;
	}
	
	//login(userid,passwd)
/*	@RequestMapping("/Users/Login")
	public ModelAndView login(HttpServletRequest request) {
		
		String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");
		
		UserVo userVo = userMapper.login( userid,passwd );
		
		HttpSession session = request.getSession();
		session.setAttribute("login", session);
		session.setMaxInactiveInterval(30*60);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/");
		
		return mv;
	}*/
	@PostMapping("/login")
	public ModelAndView login(HttpServletRequest request,UserVo uservo) {
	//	public ModelAndView login(@Param String userid,
	//                            @Param Strng passwd,
	//                          	HttpServletRequest)
		
		//client가 입력한 parameter받아온다.
		String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");
		
	//	UserVo userVo = userMapper.login(userid, passwd);
	
		
		//받아온 parameter를 userVo에 저장한다.
		UserVo userVo = userMapper.login( userid,passwd );
		MenuVo menuVo = menuMapper.getMenu("MENU01");
		
		String loc; //String loc = null;
		
		//로그인 설정
		if(userVo != null) {//아이디와 암호 일치시 수행
			HttpSession session = request.getSession();
			session.setAttribute("login", userVo);
			session.setAttribute("menu",menuVo);
			session.setMaxInactiveInterval(30*60); //30분동안 로그인 유지
			
			loc="redirect:/";
			
			if(userVo != null) {
				HttpSession session1 = request.getSession();
				session.setAttribute("login", userVo);
			}
			
		} else {//로그인 실패
			loc="redirect:/loginForm";
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName(loc);

		return mv;
	}
	
	//logout
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/loginForm";
	}
	
}
