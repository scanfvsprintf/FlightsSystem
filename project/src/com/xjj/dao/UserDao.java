package com.xjj.dao;

import com.xjj.pojo.User;

public interface UserDao {
	User checkUser(String uname,String pwd);
}
