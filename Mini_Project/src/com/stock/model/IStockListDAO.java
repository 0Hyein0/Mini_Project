package com.stock.model;

import java.util.ArrayList;

public interface IStockListDAO
{
	public ArrayList<StockListDTO> stockList(String ac_code);
	public ArrayList<StockListDTO> inList(String ac_code);
	public ArrayList<StockListDTO> outList(String ac_code);
	
	public ArrayList<StockListDTO> waList(String ac_code);	// 계정별 보유 창고 조회
	public ArrayList<StockListDTO> prList(String ac_code);  // 계정별 보유 제품 조회
	
	public ArrayList<StockListDTO> searchInList(String ac_code, String pr_code, String wa_code, String start_date, String end_date);	// 입고 내역 검색
	public ArrayList<StockListDTO> searchOutList(String ac_code, String pr_code, String wa_code, String start_date, String end_date);	// 출고 내역 검색
	
}

