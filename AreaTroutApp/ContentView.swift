//
//  ContentView.swift
//  AreaTroutApp
//
//  Created by Takuya Ando on 2023/03/22.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    // TODO: 現在地ボタンを追加する
    
    @State private var region = MKCoordinateRegion(center: .init(
        latitude: 35.658584,
        longitude: 139.745431
    ),
                                                   latitudinalMeters: 300,
                                                   longitudinalMeters: 300
    )
    
    @State var showHalfModal = false
    
    let spotList = [
        Spot(latitude: 35.659099, longitude: 139.7453599),
        Spot(latitude: 35.658000, longitude: 139.7456316),
        Spot(latitude: 35.658674, longitude: 139.7462316),
        Spot(latitude: 35.658404, longitude: 139.744809)
    ]
    
    // マップの描写
    var body: some View {
        ZStack {
            Map(
                coordinateRegion: $region,
                annotationItems: spotList,
                annotationContent: { spot in
                    MapAnnotation (coordinate: spot.coodinate) {
                        Text("🐟")
                            .onTapGesture {
                                self.showHalfModal = true
                            }
                    }
//                    MapMarker(
//                        coordinate: spot.coodinate, tint: .red
//                    )
                }
            )
            .edgesIgnoringSafeArea(.all)
            .halfSheet(showSheet: $showHalfModal, content: { Text("テスト").frame(maxWidth: .infinity, maxHeight: .infinity)
            })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
