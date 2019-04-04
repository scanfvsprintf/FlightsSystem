package com.xjj.dao;

import com.xjj.pojo.User;

public interface UserDao {
	User CheckUser(String uname,String pwd);
}
