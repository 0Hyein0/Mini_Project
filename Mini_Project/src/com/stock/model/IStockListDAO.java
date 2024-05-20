package com.stock.model;

import java.util.ArrayList;

public interface IStockListDAO
{
	public ArrayList<StockListDTO> stockList(String ac_code);
	public ArrayList<StockListDTO> inList(String ac_code);
	public ArrayList<StockListDTO> outList(String ac_code);
	public ArrayList<StockListDTO> waList(String ac_code);	// 계정별 보유 창고 조회
	public ArrayList<StockListDTO> prList(String ac_code);  // 계정별 보유 제품 조회
}
