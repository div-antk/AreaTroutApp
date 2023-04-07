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
    var spots: [Spot] = Bundle.main.decode("spotsData.json")
    
    // 住所のみを抽出したリスト
    var addressList: [String] = []
    
    // 座標情報
    var coordinates: [CLLocationCoordinate2D] = []
    
    let geocoder = CLGeocoder()
    
    // 住所のみを抽出したリストを作成
    func makeAdressList(from spots: [[String: Any]]) -> [String] {
        addressList = spots.compactMap { $0["address"] as? String }
        print(addressList)
        return addressList
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
                        let coordinate = location.coordinate
                        self.coordinates.append(coordinate)
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
