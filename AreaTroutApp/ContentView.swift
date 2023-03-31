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
   
    @State private var annotations: [Annotation] = [
        Annotation(
            name: "うどん"
        )
    ]
    
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
                        ZStack {
                           SpotIcon()
                                .onTapGesture {
                                    self.showHalfModal = true
                                }
                        }
                
                    }
                }
            )
            .edgesIgnoringSafeArea(.all)
            .sheet(isPresented: $showHalfModal, content: {
                InfoHalfSheet(showSheet: .constant(true))
            })

        }
//        self.getLocation(address: <#T##String#>, completion: <#T##([CLLocationDegrees]) -> Void#>)
    }
    
    private func getLocation(address: String, completion: @escaping ([CLLocationDegrees]) -> Void) {
        CLGeocoder().geocodeAddressString(address) { placemarks, error in
            guard let latitude = placemarks?.first?.location?.coordinate.latitude else { return }
            guard let longitude = placemarks?.first?.location?.coordinate.longitude else { return }
            print("latitude: \(latitude)")
            print("longitude: \(longitude)")
            
            // 緯度経度の情報をクロージャで渡す
            completion([latitude, longitude])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
