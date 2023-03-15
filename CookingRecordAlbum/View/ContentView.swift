//
//  ContentView.swift
//  CookingRecordAlbum
//
//  Created by 星優大 on 2023/03/09.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = CookingInfoViewModel()
    
    var body: some View {
        // リスト表示
        List{
            ForEach(viewModel.records, id: \.url) {item in
                CookingRowView(
                    url: item.url,
                    comment: item.comment,
                    type: item.type,
                    recorded_at: item.recorded_at
                )
                .padding(.horizontal, 2.0)
                .listRowInsets(EdgeInsets())
            }
        }
        .listStyle(GroupedListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
