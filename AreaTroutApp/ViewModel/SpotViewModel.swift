//
//  SpotViewModel.swift
//  AreaTroutApp
//
//  Created by Takuya Ando on 2023/04/03.
//

import Foundation

final class SpotViewModel: ObservableObject {
    
    @Published var spotId: String = ""
    
    var spots: [Spot] = Bundle.main.decode("spotsData.json")
    
    var fetchedSpots: [Spot] = []
    
    func fetchSpots(spotName: String) {
        spots.forEach { spot in
            if spot.name.contains(spotName) {
                fetchedSpots.append(spot)
            }
        }
    }
}
