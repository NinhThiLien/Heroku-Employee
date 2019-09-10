package com.hrsmanager.authentication;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.hrsmanager.dao.EmployeeDAO;
import com.hrsmanager.dao.RoleDAO;
import com.hrsmanager.model.EmployeeInfo;
import com.hrsmanager.model.Roles;

@Service
public class EmployeeService implements UserDetailsService {

	@Autowired
	private EmployeeDAO employeeDAO;
	@Autowired
	private RoleDAO roleDAO;

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		EmployeeInfo emp = employeeDAO.findEmployeeInfoByEmail(email);
		
		if (emp == null) {
			throw new UsernameNotFoundException("Email "+email+" was not found");
		}
		
		Roles role = roleDAO.findRolesByID(emp.getRoleId());
		String role_name = role.getRoleName();
		List<GrantedAuthority> grantList= new ArrayList<GrantedAuthority>();
	
		GrantedAuthority authority = new SimpleGrantedAuthority("ROLE_"+role_name);
		
		grantList.add(authority);
		
		UserDetails userDetails = (UserDetails) new User (emp.getEmail(), emp.getPassword(), grantList);
		return userDetails;
	}
	
	public EmployeeInfo findByID(Integer employee_id) {
		EmployeeInfo emp = employeeDAO.findEmployeeInfoByID(employee_id);
		if (emp == null) {
			throw new UsernameNotFoundException("Employee "+employee_id+" was not found");
		}
		return emp;
	}
	
	public EmployeeInfo findByEmail(String email) {
		EmployeeInfo emp = employeeDAO.findEmployeeInfoByEmail(email);
		if (emp == null) {
			throw new UsernameNotFoundException("Employee was not found");
		}
		return emp;
	}
	
	public EmployeeInfo updatePassword(Integer employee_id, String password) {
		int count = employeeDAO.updatePassword(employee_id, password);
		EmployeeInfo emp = null;
		if (count == 1) {
			emp = employeeDAO.findEmployeeInfoByID(employee_id);
		}
		return emp;
	}
	
	public EmployeeInfo updateEmployee(String employee_name, String gender, Date birthday, 
			String address, String phone, String email, Date started_day, 
			Integer status_id, Integer role_id, Timestamp updated_at, 
			Integer department_id, Integer position_id, String avatar, Integer employee_id) {
		int count = employeeDAO.updateEmployeeInfo(employee_name, gender, birthday, 
				address, phone, email, started_day, status_id, role_id, updated_at, 
				department_id, position_id, avatar, employee_id);
		if (count != 1) {
			throw new UsernameNotFoundException("Cannot update "+employee_id);
		}
		EmployeeInfo emp = employeeDAO.findEmployeeInfoByID(employee_id);
		return emp;
	}

	public EmployeeInfo findByEmailPass(String email, String password) {
		String password_check = employeeDAO.findPassword(email);
		EmployeeInfo emp = null;
		if(BCrypt.checkpw(password, password_check)==false){
			return emp;
		}else {
			emp = employeeDAO.findEmployeeInfoByEmail(email);
			return emp;
		}
	}
	
	public List<EmployeeInfo> listEmployee(){
		List<EmployeeInfo> list = employeeDAO.listEmployee();
		return list;
	}
	
	public List<EmployeeInfo> listPage(int pageId, int total, String key, String type){
		List<EmployeeInfo> listPage;
		if("employee_name".equals(key)) {
			listPage = employeeDAO.listPageByEmployeeName(pageId, total,key, type);
		}
		else {
			listPage = employeeDAO.listPageByDepartmentName(pageId, total,key, type);
		}
		return listPage;
	}
	
	public int newEmployeeInfo(EmployeeInfo emp,Integer department_id, Integer position_id, Integer role_id, Integer status_id, Date started_day ) {
		emp.setStarted_day(started_day);
		emp.setRoleId(role_id);
		emp.setStatusId(status_id);
		emp.setDepartmentId(department_id);
		emp.setPositionId(position_id);
		
		return employeeDAO.createEmployeeInfo(emp);
	}
	
	public boolean checkEmail(String email) {
		EmployeeInfo emp = employeeDAO.findEmployeeInfoByEmail(email);
		if (emp == null) {
			return false;	
		}
		return true;		
	}
	
	public boolean checkID(Integer employeeId) {
		EmployeeInfo emp = employeeDAO.findEmployeeInfoByID(employeeId);
		if (emp == null) {
			return false;
		}
		return true;
	}
	
	public String resetPassword(String email) {
		EmployeeInfo emp = employeeDAO.findEmployeeInfoByEmail(email);
		String randomPassword = null;
		randomPassword = RandomStringUtils.randomAlphanumeric(8);
		employeeDAO.updatePassword(emp.getEmployeeId(), BCrypt.hashpw(randomPassword, BCrypt.gensalt(12)));
		return randomPassword;
	}
}
