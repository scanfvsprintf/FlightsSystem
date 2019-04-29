package com.xjj.service.impl;

import com.xjj.dao.UserDao;
import com.xjj.dao.impl.FixPassWordDaoImpl;
import com.xjj.dao.impl.UserDaoImpl;
import com.xjj.pojo.User;
import com.xjj.service.UserService;

public class FixPassWordImpl{
	public void checkUser(User u) {
		UserDao ud=new UserDaoImpl();
		new FixPassWordDaoImpl().checkUser(u);
	}

	

}
