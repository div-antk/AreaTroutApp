//
//  ContentView.swift
//  AreaTroutApp
//
//  Created by Takuya Ando on 2023/03/22.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    // メモ: 最初にインスタンス化するときはStateObjectにしたほうがよい
    @StateObject var viewModel = SpotViewModel()
    
    // TODO: 現在地ボタンを追加する
    
    @State private var region = MKCoordinateRegion(center: .init(
        latitude: 35.658584,
        longitude: 139.745431
    ),
                                                   latitudinalMeters: 300,
                                                   longitudinalMeters: 300
    )
    
    @State var showHalfModal = false
    @State var spotId = 0
    
    var addresses: [String] {
        viewModel.spots.map { $0.address }
    }
    
    // マップの描写
    var body: some View {
        ZStack {
            Map(
                coordinateRegion: $region,
                annotationItems: viewModel.spotsWithCoordinate,
                annotationContent: { spot in
                    MapAnnotation (coordinate: spot.coordinate?.coodinate ?? CLLocationCoordinate2D(latitude: 0, longitude: 0)) {
                        ZStack {
                            SpotIcon()
                                .onTapGesture {
                                    self.showHalfModal = true
                                    self.spotId = spot.id
                                }
                        }
                    }
                }
            )
            .onAppear {
                viewModel.fetchCoordinats(addresses: addresses)
            }
            .edgesIgnoringSafeArea(.all)
            .sheet(isPresented: $showHalfModal, content: {
                InfoHalfSheet(showSheet: .constant(true), spotId: $spotId)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
