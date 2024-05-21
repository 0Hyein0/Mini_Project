package com.stock.model;

import java.util.ArrayList;

public interface IDataInsertDAO
{
	public void inAdd(StockListDTO dto);
	public ArrayList<StockListDTO> waList(String pr_code, String ac_code);
	public int maxQuantity(String pr_code, String ac_code, String wa_code);
	public void outAdd(StockListDTO dto);
	public void productAdd(String pr_code, String pr_name, String pr_description, String ac_code);
}
