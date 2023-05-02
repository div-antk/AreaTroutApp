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
    
    @Published var spotId: Int = 0
    
    // 釣り場情報
    @Published var spots: [Spot] = Bundle.main.decode("spots_data.json")
    
    @Published var spotsWithCoordinate: [Spot] = []
    @Published var spot: Spot?
    
    @Published var isLoading = false
    
//    init() {
//        createAddressList(from: spots)
//        fetchCoordinates(addresses: addressList) {
//            spotsWithCoordinate in
//            self.spotsWithCoordinate = spotsWithCoordinate
//        }
//    }
    
    // 座標に変換した住所のリスト
    @Published var coordinates: [Coordinate] = []
    
    let geocoder = CLGeocoder()
    
    func fetchSpots() {
        isLoading = true
        let addressList = spots.map { $0.address }
        print("(´・ω・｀)", addressList)

        fetchCoordinates(addresses: addressList) { spots in
            self.spots = spots
            self.isLoading = false
        }
    }
    
    
//    func fetchCoordinates(addresses: [String]) {
//
//        let group = DispatchGroup()
//
//        // 釣り場の情報から座標を取得
//        for address in addresses {
//
//            group.enter()
//
//            // geocodeAddressStringは非同期処理であるため、すべての処理が完了するまで待機する必要がある
//            geocoder.geocodeAddressString(address) {
//                placemarks, error in
//                if let error = error {
//                    print("座標取得エラー: \(error.localizedDescription)")
//                } else if let placemark = placemarks?.first, let location = placemark.location {
//                    let coordinate = Coordinate(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//                    if let index = self.spots.firstIndex(where: { $0.address == address }) {
//                        var spot = self.spots[index]
//                        spot.coordinate = coordinate
//                        self.spotsWithCoordinate.append(spot)
//                        print("(´・ω・｀)", self.spotsWithCoordinate)
//                    }
//                }
//                group.leave()
//            }
//        }
//        group.notify(queue: .main) {
//            print(self.spotsWithCoordinate)
//        }
//    }
    
    func fetchCoordinates(addresses: [String], completion: @escaping ([Spot]) -> Void) {
        
        var spotsWithCoordinate = [Spot]()
        let dispatchGroup = DispatchGroup()
        
        for address in addresses {
            dispatchGroup.enter()
            geocoder.geocodeAddressString(address) { placemarks, error in
                
                if let error = error {
                    print("座標取得エラー: \(error.localizedDescription)")
                    
                } else if let placemark = placemarks?.first, let location = placemark.location {
                    let coordinate = Coordinate(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)

                    if let spot = self.spots.first(where: { $0.address == address }) {
                        var newSpot = spot
                        newSpot.coordinate = coordinate
                        spotsWithCoordinate.append(newSpot)
                    }
                }
                dispatchGroup.leave()
            }
        }
        dispatchGroup.notify(queue: .main) {
            completion(spotsWithCoordinate)
        }
    }

    
    // IDから釣り場情報を取得
    func fetchSpotFromId(spotID: Int) {
        self.spot = spots.first(where: {$0.id == spotID})
    }
    
    // 以下は検索実装用
    var fetchedSpots: [Spot] = []
    
    func fetchSpotsFromName(spotName: String) {
        spots.forEach { spot in
            if spot.name.contains(spotName) {
                fetchedSpots.append(spot)
            }
        }
    }
}
