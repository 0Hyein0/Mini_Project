package com.stock.model;

import java.util.ArrayList;

public interface IStockListDAO
{
	public ArrayList<StockListDTO> stockList(String ac_code);
	public ArrayList<StockListDTO> inList(String ac_code);
	public ArrayList<StockListDTO> outList(String ac_code);

}
