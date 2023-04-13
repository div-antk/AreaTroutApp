//
//  SpotViewModel.swift
//  AreaTroutApp
//
//  Created by Takuya Ando on 2023/04/03.
//

import Foundation
import SwiftUI
import CoreLocation

final class SpotViewModel: ObservableObject {
    
    @Published var spotId: String = ""
    
    // 釣り場情報
    @Published var spots: [Spot] = Bundle.main.decode("spotsData.json")
    
    init() {
        createAddressList(from: spots)
        fetchCoordinats(addresses: addressList)
    }
    
    // 住所のみを抽出したリスト
    private var addressList: [String] = []
    
    // 座標に変換した住所のリスト
    @Published var coordinates: [Coordinate] = []
    
    let geocoder = CLGeocoder()
    
    // 住所だけのリストを作成
    func createAddressList(from spots: [Spot]) {
        addressList = spots.compactMap{ $0.address }
        print(addressList)
    }
    
    func fetchCoordinats(addresses: [String]) {
        // 釣り場の情報から座標を取得
        for address in addresses {
            geocoder.geocodeAddressString(address) {
                placemarks, error in
                if let error = error {
                    print("座標取得エラー; \(error.localizedDescription)")
                    return
                }
                if let placemark = placemarks?.first {
                    if let location = placemark.location {
                        let coordinate = Coordinate(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
                        self.coordinates.append(coordinate)
                        // TODO: addressからEntityのIDを取得してアペンド
                        print(coordinate)
                    }
                }
            }
        }
    }
    
    
    // 以下は検索実装用
    var fetchedSpots: [Spot] = []
    
    func fetchSpots(spotName: String) {
        spots.forEach { spot in
            if spot.name.contains(spotName) {
                fetchedSpots.append(spot)
            }
        }
    }
}
