//
//  InfoHalfSheet.swift
//  AreaTroutApp
//
//  Created by Takuya Ando on 2023/03/27.
//

import SwiftUI

struct InfoHalfSheet: View {
    
    @Binding var showSheet: Bool
    
    var body: some View {
        Button("シート") {
            showSheet.toggle()
        }
        .presentationDetents([.medium])
    }
}

struct InfoHalfSheet_Previews: PreviewProvider {
    static var previews: some View {
        InfoHalfSheet(showSheet: .constant(false))
    }
}
