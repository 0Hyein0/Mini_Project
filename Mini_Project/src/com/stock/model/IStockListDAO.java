package com.stock.model;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IStockListDAO
{
	public ArrayList<StockListDTO> stockList(String ac_code);
	public ArrayList<StockListDTO> inList(String ac_code);
	public ArrayList<StockListDTO> outList(String ac_code);
	
	public ArrayList<StockListDTO> waList(String ac_code);	// 계정별 보유 창고 조회
	public ArrayList<StockListDTO> prList(String ac_code);  // 계정별 보유 제품 조회
	
	public ArrayList<StockListDTO> searchStockList(@Param("ac_code")String ac_code, @Param("pr_code")String pr_code, @Param("wa_code")String wa_code, @Param("search_date")String search_date);	// 재고 검색
	public ArrayList<StockListDTO> searchInList(String ac_code, String pr_code, String wa_code, String start_date, String end_date);	// 입고 내역 검색
	public ArrayList<StockListDTO> searchOutList(String ac_code, String pr_code, String wa_code, String start_date, String end_date);	// 출고 내역 검색
	
}

