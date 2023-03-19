//
//  ContentView.swift
//  AreaTroutApp
//
//  Created by Takuya Ando on 2023/03/22.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State private var region = MKCoordinateRegion(center: .init(
        latitude: 35.658584,
        longitude: 139.745431
    ),
                                                   latitudinalMeters: 300,
                                                   longitudinalMeters: 300
    )
    
    var body: some View {
        Map(coordinateRegion: $region)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
