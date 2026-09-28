package com.kedu.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.MemberDTO;

@Repository
public class MemberDAO {

	@Autowired
	private JdbcTemplate jdbc;

	public int signup(MemberDTO dto) {
		String sql = "insert into member values(? , ? , ? , ? , ? , ? , ? , ?)";
		return jdbc.update(sql, dto.getId(), dto.getPw(), dto.getName(), dto.getPhone(), dto.getEmail(),
				dto.getZipcode(), dto.getAddress1(), dto.getAddress2());
	}

	
	public MemberDTO mypage(String id) {
		String sql = "select * from member where id = ?" ;
		return jdbc.queryForObject(sql, new BeanPropertyRowMapper<>(MemberDTO.class), id);
	}
	
	public boolean login (MemberDTO dto) {
		String sql = "select count(*) from member where id = ? and pw = ? " ;
		
		int result = jdbc.queryForObject(sql, Integer.class , dto.getId() , dto.getPw()) ;
		
		return result > 0;
	}
	
	public void delete(MemberDTO dto) throws Exception {
		String sql = "delete from members where id = ?";
		jdbc.update(sql , dto.getId());
		}
}
