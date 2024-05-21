package com.stock.model;

import java.util.ArrayList;

public interface IDataInsertDAO
{
	public StockListDTO inAdd(StockListDTO dto);
	public ArrayList<StockListDTO> waList(String pr_code, String ac_code);
	public int maxQuantity(String pr_code, String ac_code, String wa_code);
}
