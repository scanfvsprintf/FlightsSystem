package com.xjj.service.impl;

import com.xjj.dao.UserDao;
import com.xjj.dao.impl.UserDaoImpl;
import com.xjj.pojo.User;
import com.xjj.service.UserService;

public class UserServiceImpl implements UserService {
	@Override
	public User checkUser(String uname, String pwd) {
		UserDao ud=new UserDaoImpl();
		User user=ud.CheckUser(uname, pwd);
		return user;
	}

	

}
