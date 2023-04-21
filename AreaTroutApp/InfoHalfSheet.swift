//
//  InfoHalfSheet.swift
//  AreaTroutApp
//
//  Created by Takuya Ando on 2023/03/27.
//

import SwiftUI

struct InfoHalfSheet: View {
    
    // 釣り場の名称、所在地、営業時間、アクセス方法、料金
    
    @Binding var showSheet: Bool
    @Binding var spotId: Int
    
    var body: some View {
        VStack {
            Text((String(spotId)))
            Text("所在地")
            Text("営業時間")
            Text("アクセス方法")
            Text("料金")
            
        }
        .presentationDetents([.medium])
    }
}

struct InfoHalfSheet_Previews: PreviewProvider {
    static var previews: some View {
        InfoHalfSheet(showSheet: .constant(false), spotId: .constant(0))
    }
}
