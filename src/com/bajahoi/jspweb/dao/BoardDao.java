package com.bajahoi.jspweb.dao;

import java.util.List;

import com.bajahoi.jspweb.entity.Board;
import com.bajahoi.jspweb.entity.BoardView;

public interface BoardDao {
	
	public int insert(Board board);
	public int notattinsert(Board board);
	public int delete(String id);
	public int update_hit(Board board); //��ȸ��1����
	public int update_recomm(Board board);	//��õ��1����
	public int update(Board board);	//����
	
	public List<Board> getList(int page,String categortId);
	public List<Board> bestgetList(int page,String categortId);
	public Board get(String id);
	
	int getCount(String categortId);

}
