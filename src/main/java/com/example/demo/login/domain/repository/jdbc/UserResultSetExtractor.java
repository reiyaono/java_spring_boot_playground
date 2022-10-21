package com.example.demo.login.domain.repository.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.example.demo.login.domain.model.User;

public class UserResultSetExtractor implements ResultSetExtractor<List<User>> {
	
	@Override
	public List<User> extractData(ResultSet rs) throws SQLException,
		DataAccessException {
		System.out.println("-------------------");
		System.out.println("UserResultSetExtractor");
		System.out.println("-------------------");
		List<User> userList = new ArrayList<>();
		
		while (rs.next()) {
			User user = new User();
			
			user.setUserId(rs.getNString("user_id"));
			user.setPassword(rs.getNString("password"));
			user.setUserName(rs.getNString("user_name"));
			user.setBirthday(rs.getDate("birthday"));
			user.setAge(rs.getInt("age"));
			user.setMarriage(rs.getBoolean("marriage"));
			user.setRole(rs.getNString("role"));
			
			userList.add(user);
		}
		
		if (userList.size() == 0) {
			throw new EmptyResultDataAccessException(1);
		}
		
		return userList;
	}
}