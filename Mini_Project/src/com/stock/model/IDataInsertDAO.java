package com.stock.model;

import java.util.ArrayList;

public interface IDataInsertDAO
{
	public StockListDTO inAdd(StockListDTO dto);
	public ArrayList<StockListDTO> waList(String pr_code, String ac_code);
}
