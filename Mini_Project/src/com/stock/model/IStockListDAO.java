package com.stock.model;

import java.util.ArrayList;

public interface IStockListDAO
{
	public ArrayList<StockListDTO> stockList();
	public ArrayList<StockListDTO> inList();

}
