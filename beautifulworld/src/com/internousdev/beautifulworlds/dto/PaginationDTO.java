package com.internousdev.beautifulworlds.dto;

import java.util.ArrayList;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class PaginationDTO {
	//全ページ数
	private int totalPageSize;
	// 現在のページ数
	private int currentPageNo;
	// 全レコード数
	private int totalRecordSize;
	// 開始レコード番号
	private int startRecordNo;
	// 終了レコード番号
	private int endRecordNo;
	// ページャーに表示するページ番号一覧
	private List<Integer> pageNumberList = new ArrayList<Integer>();
	// １ページ分のリストページ情報（商品情報）
	private List<ProductInfoDTO> currentProductInfoPage;
	// 次ページが存在するか
	private boolean hasNextPage;
	// 前ページが存在するか
	private boolean hasPreviousPage;
	private int nextPageNo;
	private int previousPageNo;

}
