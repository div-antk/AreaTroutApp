//
//  CoordinateEntity.swift
//  AreaTroutApp
//
//  Created by Takuya Ando on 2023/04/04.
//

import Foundation
import CoreLocation

struct Coordinate: Identifiable {
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
