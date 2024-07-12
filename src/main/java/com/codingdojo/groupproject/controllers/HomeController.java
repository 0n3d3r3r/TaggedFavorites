package com.codingdojo.groupproject.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.groupproject.models.LoginUser;
import com.codingdojo.groupproject.models.Media;
import com.codingdojo.groupproject.models.RegisterUser;
import com.codingdojo.groupproject.models.User;
import com.codingdojo.groupproject.services.MediaService;
import com.codingdojo.groupproject.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class HomeController {
	@Autowired
	private MediaService mediaService;
	@Autowired
	private UserService userService;
	@Autowired
	private HttpSession session;
	
	
	
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("newLogin", new LoginUser());
		model.addAttribute("newRegister", new RegisterUser());
		return "index.jsp";
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newRegister") RegisterUser newRegister, BindingResult result, Model model) {
		User user = userService.register(newRegister, result);
		
		if(result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "index.jsp";
		}		
		session.setAttribute("currentuser", user.getId());
		return "redirect:/taggedfavorites/home";
	}
	
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model) {
		User user = userService.login(newLogin, result);
		if(result.hasErrors()) {
			model.addAttribute("newRegister", new RegisterUser());
			return "index.jsp";
		}
		session.setAttribute("currentuser", user.getId());
		return "redirect:/taggedfavorites/home";
	}
	
	@GetMapping("/taggedfavorites/home")
	public String home(Model model) {
		if(session.getAttribute("currentuser") == null) {
			model.addAttribute("warning", "You are not logged in, please log in.");
			return "redirect:/";
		} else {
			User user = userService.findUserById((long)session.getAttribute("currentuser"));
			model.addAttribute("user", user);
			return "home.jsp";
		}
	}
	
	@GetMapping("/taggedfavorites/{mediaId}/remove")
	public String removeFavorite(@PathVariable("mediaId") Long mediaId, Model model) {
		if(session.getAttribute("currentuser")== null) {
			return "redirect:/";
		}else {
			User user = userService.findUserById((long) session.getAttribute("currentuser"));
			Media media = mediaService.findMedia(mediaId);
			userService.removeFavoriteMedia(user, media);
			return "redirect:/taggedfavorites/home";
		}
	}
	
	@GetMapping("/taggedfavorites/games/create")
	public String createGame(Model model) {
		if(session.getAttribute("currentuser") == null) {
			model.addAttribute("warning", "You are not logged in, please log in.");
			return "redirect:/";
		} else {
			User user = userService.findUserById((long)session.getAttribute("currentuser"));
			model.addAttribute("user", user);
			model.addAttribute("newMedia", new Media());
			return "createPage.jsp";
		}
	}
	
	@PostMapping("/taggedfavorites/games/create")
	public String newGame(@Valid @ModelAttribute("newMedia") Media media, BindingResult result, Model model) {
		if(result.hasErrors()) {
			return "createPage.jsp";
		} else {
			mediaService.createMedia(media);
			return "redirect:/taggedfavorites/home";
		}
	}
	
	
	
	@GetMapping("/logout")
	public String logout(Model model) {
		session.invalidate();
		return "redirect:/";
	}
	
}
