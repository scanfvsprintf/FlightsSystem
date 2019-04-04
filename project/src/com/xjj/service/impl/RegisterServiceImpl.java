package com.xjj.service.impl;

import com.xjj.dao.UserDao;
import com.xjj.dao.impl.RegisterDaoImpl;
import com.xjj.dao.impl.UserDaoImpl;
import com.xjj.pojo.User;
import com.xjj.service.UserService;

public class RegisterServiceImpl implements UserService {
	@Override
	public User checkUser(String uname, String pwd) {
		UserDao ud=new RegisterDaoImpl();
		User user=ud.checkUser(uname, pwd);
		return user;
	}
}
