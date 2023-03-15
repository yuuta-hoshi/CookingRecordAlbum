//
//  CookingInfoModel.swift
//  CookingRecordAlbum
//
//  Created by 星優大 on 2023/03/09.
//

import Foundation

struct Results: Codable{
    let pagination: pagination
    let records: [Record]
    enum CodingKeys: String, CodingKey {
        case pagination
        case records = "cooking_records"
    }
}
// ページ詳細
struct pagination: Codable {
    let total: Int  // 総レコード数
    let offset: Int // オフセット
    let limit: Int  // リクエスト時指定の取得数
}
// 料理情報
struct Record: Codable {
    let url: String         // 写真URL
    let comment: String     // コメント
    let type: String        // レシピの種類
    let recorded_at: String // 記録日時
    enum CodingKeys: String, CodingKey {
        case url = "image_url"
        case comment
        case type = "recipe_type"
        case recorded_at = "recorded_at"
    }
}

