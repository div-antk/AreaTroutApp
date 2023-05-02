//
//  InfoHalfSheet.swift
//  AreaTroutApp
//
//  Created by Takuya Ando on 2023/03/27.
//

import SwiftUI

struct InfoHalfSheet: View {
    
    // TODO: 釣り場の名称、所在地、営業時間、アクセス方法、料金を表示
    
    @StateObject var viewModel = SpotViewModel()
    
    @Binding var showSheet: Bool
    @Binding var spotId: Int
        
    var body: some View {
        VStack {
            Text(viewModel.spot?.name ?? "")
            Text(viewModel.spot?.address ?? "")
            Text(viewModel.spot?.open ?? "")
            Text(viewModel.spot?.access ?? "")
            Text(viewModel.spot?.price ?? "")
            
        }
        .presentationDetents([.medium])
        .onAppear {
            viewModel.fetchSpotFromId(spotID: spotId)
        }
    }
}

struct InfoHalfSheet_Previews: PreviewProvider {
    static var previews: some View {
        InfoHalfSheet(showSheet: .constant(false), spotId: .constant(0))
    }
}
