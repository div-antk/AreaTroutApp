//
//  SpotEntity.swift
//  AreaTroutApp
//
//  Created by Takuya Ando on 2023/03/22.
//

import Foundation
import CoreLocation

struct Spot: Identifiable {
    let id = UUID()
    let latitude: Double
    let longitude: Double
    var coodinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude
        )
    }
}
