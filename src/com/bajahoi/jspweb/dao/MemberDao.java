package com.bajahoi.jspweb.dao;

import java.util.List;

import com.bajahoi.jspweb.entity.Member;

public interface MemberDao {
	
	 List<Member> getList();
	 
	 Member get(String id);	
	 
	 int insert(Member member);
	 int update(Member member);
	 int delete(String id);
}
