//
//  SpotEntity.swift
//  AreaTroutApp
//
//  Created by Takuya Ando on 2023/03/22.
//

import Foundation
import CoreLocation

struct Spot: Codable, Identifiable {
    let id: Int
    let name: String
    let tel: String
    let business_period: String
    let address: String
    let open: String
    let close: String
    let open2: String
    let close2: String
    let holiday: String
    let type: String
    let fishing_method: String
    let fish: String
    let facility: String
    let price: String
    let web_site: String
    let access: String
    let regulation: String
    let mics: String
    let coordinate: Coordinate
}

struct Coordinate: Codable {
//    let id = UUID()
    let latitude: Double
    let longitude: Double
    var coodinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude
        )
    }
}
