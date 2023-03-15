//
//  CookingTypeView.swift
//  CookingRecordAlbum
//
//  Created by 星優大 on 2023/03/13.
//

import SwiftUI

struct CookingTypeView: View {
    
    var type:String
    
    var body: some View {
        ZStack{
            Capsule()
                .padding(.leading, 2.0)
                .frame(width: 60.0, height: 30.0)
                .foregroundColor(colors(type: type))
            Text(types(type: type))
                .foregroundColor(.white)
        }
    }
}
// 種別を判別する
func colors(type : String) -> Color{
    switch type {
        case "main_dish":
            return .orange
        case "side_dish":
            return .green
        case "soup":
            return .brown
        default:
            return .white
    }
}
// 種別を判別する
func types(type : String) -> String{
    switch type {
        case "main_dish":
            return "主食"
        case "side_dish":
            return "副菜"
        case "soup":
            return "汁物"
        default:
            return ""
    }
}

struct CookingTypeView_Previews: PreviewProvider {
    static var previews: some View {
        CookingTypeView(type: "main_dish")
    }
}
