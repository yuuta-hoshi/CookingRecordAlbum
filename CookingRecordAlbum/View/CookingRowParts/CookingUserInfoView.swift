//
//  CookingUserInfoView.swift
//  CookingRecordAlbum
//
//  Created by 星優大 on 2023/03/14.
//

import SwiftUI

struct CookingUserInfoView: View {
    
    // 記録日時
    var recorded_at : String
    
    var body: some View {
        HStack{
            Image(systemName: "person.circle")
                .font(.system(size: 60))
            VStack{
                HStack{
                    VStack{
                        Text("UserName")
                            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(DateFormat(recorded_at: recorded_at))
                            .font(.callout)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
    }
}

// Date型に変換しフォーマットを変更する
func DateFormat(recorded_at: String) -> String{
    let df = DateFormatter()
    df.locale = Locale(identifier: "ja_JP")
    // 文字列をDate型に変換
    df.dateFormat = "yyyy-MM-dd HH:mm:ss"
    var date = df.date(from: recorded_at)!
    // フォーマット変更
    df.dateFormat = "yyyy/MM/dd HH:mm"
    return df.string(from: date)
}

struct CookingUserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CookingUserInfoView(recorded_at: "2018-04-21 14:04:22")
    }
}
