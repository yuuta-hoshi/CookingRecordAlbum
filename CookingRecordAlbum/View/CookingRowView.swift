//
//  CookingRowView.swift
//  CookingRecordAlbum
//
//  Created by 星優大 on 2023/03/13.
//

import SwiftUI

struct CookingRowView: View {
    // URL
    var url : String
    // コメント
    var comment : String
    // レシピの種類
    var type : String
    // 記録日時
    var recorded_at : String

    var body: some View {
        VStack(alignment: .leading){
            // ユーザー情報
            CookingUserInfoView(recorded_at: recorded_at)
                .padding(.bottom, 3.0)
            // レシピ種類
            CookingTypeView(type: type)
            // コメント
            Text(comment)
                .padding(.horizontal, 4.0)
            // 画像
            AsyncImage(url: URL(string: url)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom)
            } placeholder: {
                ProgressView()
            }
        }
    }
}

struct CookingRowView_Previews: PreviewProvider {
    static var previews: some View {
        CookingRowView(
            url: "https://cooking-records.ex.oishi-kenko.com/images/1.jpg",
            comment: "パンチのきいた辛味が印象的です。",
            type: "main_dish",
            recorded_at: "2018-04-21 14:04:22"
        )
    }
}
