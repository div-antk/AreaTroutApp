//
//  SpotIcon.swift
//  AreaTroutApp
//
//  Created by Takuya Ando on 2023/03/29.
//

import SwiftUI

struct SpotIcon: View {
    var body: some View {
        Text("🎣")
            .frame(width: 40, height: 40)
            .background(Color.yellow)
            .cornerRadius(30.0)
            .shadow(color: .gray, radius: 3, x: 3, y: 3)
    }
}

struct SpotIcon_Previews: PreviewProvider {
    static var previews: some View {
        SpotIcon()
    }
}
