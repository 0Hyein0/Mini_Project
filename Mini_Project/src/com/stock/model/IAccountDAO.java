package com.stock.model;

import org.apache.ibatis.annotations.Param;

public interface IAccountDAO
{
	public String login(@Param("ac_code")String ac_code, @Param("ac_pw")String ac_pw);
	public String acName(String ac_code);
	
}
