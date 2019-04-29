package com.xjj.service.impl;

import com.xjj.dao.impl.CollectFlightDaoImpl;

public class CollectFlightServiceImpl {
	public void collect(int uid,int tid) {
		new CollectFlightDaoImpl().collect(uid, tid);
	}
}
