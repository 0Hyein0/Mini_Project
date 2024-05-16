package com.stock.model;

import java.util.ArrayList;

public interface StockListDAO
{
	public ArrayList<StockListDTO> stockList(String acCode);
}
