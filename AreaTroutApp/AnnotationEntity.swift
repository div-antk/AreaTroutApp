//
//  AnnotationEntity.swift
//  AreaTroutApp
//
//  Created by Takuya Ando on 2023/03/27.
//

import Foundation

struct Annotation: Identifiable {
    let id = UUID()
    let name: String
//    let coordinate: CLLocationCoordinate2D
    var selected: Bool = false
}
