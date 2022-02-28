//
//  CitiesLoader.swift
//  Edvora
//
//  Created by Decagon on 28/02/2022.
//

import Foundation

final class CitiesLoader: ObservableObject {
    @Published var cities = [DropDownOption]()
    
    private let ridesLoader: RidesLoader
    
    init(ridesLoader: RidesLoader) {
        self.ridesLoader = ridesLoader
    }
    
    func updateCities(with state: String) {
        let allRides = Array(ridesLoader.allRides)
//        let uniqueStates = Array(Set(allRides.map {$0.state}))
        var citiesInStates = [String: [DropDownOption]]()
        for ride in allRides {
            if citiesInStates[ride.state] == nil {
                citiesInStates[ride.state] = [DropDownOption(key: UUID().uuidString, value: ride.city)]
            } else {
                if(!citiesInStates[ride.state]!.contains { $0.value == ride.city }) {
                    citiesInStates[ride.state]!.append(DropDownOption(key: UUID().uuidString, value: ride.city))
                }
            }
        }
        cities = citiesInStates[state]!
        print(cities)
    }
    
    
}
