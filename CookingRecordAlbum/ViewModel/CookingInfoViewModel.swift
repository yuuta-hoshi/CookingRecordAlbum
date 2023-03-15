//
//  GetData.swift
//  CookingRecordAlbum
//
//  Created by 星優大 on 2023/03/09.
//

import Foundation

class CookingInfoViewModel: ObservableObject {
    
    @Published var records:[Record] = []
    // offsetを設定
    let offset = "0"
    // 最大検索数
    let limit = "100"

    init() {
        request()
    }
    // リクエストを送る
    func request(){
        // リクエスト用の文字列を生成
        let urlStr = "https://cooking-records.ex.oishi-kenko.com/cooking_records?offset=\(offset)&limit=\(limit)"
        // URLに変換する
        guard let url: URL = URL(string: urlStr) else { return }
        // リクエスト送信
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            let decoder: JSONDecoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(Results.self, from: data)
                print(decodedData)
                DispatchQueue.main.async {
                    self.records = decodedData.records
                }
            } catch {
                print(error)
                print("json convert failed in JSONDecoder. " + error.localizedDescription)
            }
        }.resume()
    }
}
