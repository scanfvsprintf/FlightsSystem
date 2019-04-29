package com.xjj.service.impl;

import com.xjj.dao.impl.CancelCollectFlightDaoImpl;
import com.xjj.dao.impl.CollectFlightDaoImpl;

public class CancelCollectFlightServiceImpl {
	public void collect(int uid,int tid) {
		new CancelCollectFlightDaoImpl().collect(uid, tid);
	}
}
