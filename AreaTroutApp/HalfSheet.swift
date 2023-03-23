//
//  HalfSheet.swift
//  AreaTroutApp
//
//  Created by Takuya Ando on 2023/03/27.
//

import SwiftUI

struct HalfSheet<Content: View>: View {
    let content: Content
    @Binding var showSheet: Bool
    
    var body: some View {
        VStack {
            content
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal)
        .offset(y: showSheet ? 0 : UIScreen.main.bounds.height)
        .edgesIgnoringSafeArea(.bottom)
    }
}

extension View {
    func halfSheet<Content: View>(showSheet: Binding<Bool>, @ViewBuilder content: () -> Content) -> some View {
        return ZStack {
            self
            HalfSheet(content: content(), showSheet: showSheet)
        }
    }
}

