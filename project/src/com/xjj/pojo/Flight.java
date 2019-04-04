package com.xjj.pojo;

import java.sql.Timestamp;

public class Flight {
	public int tid;
	public String start;
	public String end;
	public Timestamp takeoff;
	public Timestamp land;
	public Flight(int tid, String start, String end, Timestamp takeoff, Timestamp land) {
		super();
		this.tid = tid;
		this.start = start;
		this.end = end;
		this.takeoff = takeoff;
		this.land = land;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public Timestamp getTakeoff() {
		return takeoff;
	}
	public void setTakeoff(Timestamp takeoff) {
		this.takeoff = takeoff;
	}
	public Timestamp getLand() {
		return land;
	}
	public void setLand(Timestamp land) {
		this.land = land;
	}
	
}
