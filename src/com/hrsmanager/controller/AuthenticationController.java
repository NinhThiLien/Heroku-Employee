package com.hrsmanager.controller;

import java.sql.SQLException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hrsmanager.authentication.EmployeeService;
import com.hrsmanager.dao.RoleDAO;
import com.hrsmanager.model.EmployeeInfo;

@Controller
public class AuthenticationController {

	@Autowired
	EmployeeService employeeService;
	
	@Autowired
	private RoleDAO roleDAO;
	
	@RequestMapping(value = {"/","/login"}, method = RequestMethod.GET)
	public String show_login(Model model) {
		return "login";
	}
	
	@RequestMapping(value = {"/login_check"}, method = RequestMethod.POST)
	public String check_login(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value ="email") String email, @RequestParam(value ="password") String password) throws SQLException {
		
		String errorString = null;
		boolean hasError = false;
		EmployeeInfo emp = null;
		HttpSession session = request.getSession();
		
		if(email.isEmpty() || password.isEmpty()) {
			hasError = true;
			errorString = "Email and Password can not null or empty";
		} else {
			if (employeeService.checkEmail(email)) {
				emp = employeeService.findByEmailPass(email,password);
				if (emp == null) {
					hasError = true;
					errorString = "Email or password invalid";
				}
			} else {
				hasError = true;
				errorString = "Couldn't find an account with that email";
			}
		}
		
		if(hasError) {
			session.setAttribute("errorString", errorString);
			session.setAttribute("email", email);
			session.setAttribute("password", password);
			return "redirect:/login";
		}
		else {
			session.setAttribute("emp_login", emp);
			Cookie emp_login = null;
			Cookie check_role = null;
			String role = roleDAO.findRolesByID(emp.getRoleId()).getRoleName();
			session.setAttribute("role", role);
			String id = emp.getEmployeeId().toString();
			if(request.getParameter("remember") != null) {
				emp_login = new Cookie("emp_login",id);
				response.addCookie(emp_login);
				check_role = new Cookie("check_role",role);
				response.addCookie(check_role);
			}
			return "redirect:/employee/" + id;
		}
	}
	
	/*--------------Logout-------------*/
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(Model model,HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.invalidate();
		Cookie cookie = null;
		Cookie[]cookies = request.getCookies();
		for(int i = 0; i<cookies.length; i++) {
			cookie = cookies[i];
			if (cookie.getName().equals("emp_login")) {
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			if (cookie.getName().equals("check_role")) {
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
		}
		return "redirect:/login";
	}
	
}
