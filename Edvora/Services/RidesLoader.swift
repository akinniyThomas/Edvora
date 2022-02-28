//
//  RidesLoader.swift
//  Edvora
//
//  Created by Decagon on 28/02/2022.
//

import Foundation
import SwiftUI

final class RidesLoader: ObservableObject {
    @Published var rides = [Ride]()
    var nearestRides: [Ride]?
    var upcomingRidesCount: Int?
    var pastRidesCount: Int?
    var stateDropDownOptions: [DropDownOption]?
    var citiesInStates: [String: [DropDownOption]] = [:]
    var uniqueStates: [String] = []
    
    var allRides = [Ride]()
    
    private let ridesUrl = "https://assessment.api.vweb.app/rides"
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService, ref: Int) {
        self.networkService = networkService
        loadRides(ref: ref)
    }
    
    func loadRides(ref: Int) {
        networkService.loadData(from: ridesUrl) { [weak self] rides in
            self?.setRides(rides: rides, ref: ref)
        }
        
    }
    
    func setRides(rides: [Ride], ref: Int) {
        allRides = rides
        upcomingRidesCount = allRides.filter { ride in
            return ride.date.toDate() > Date()
        }.count
        pastRidesCount = allRides.filter { ride in
            return ride.date.toDate() < Date()
        }.count
        uniqueStates = Array(Set(allRides.map {$0.state}))
        stateDropDownOptions = uniqueStates.map { state in
            DropDownOption(key: UUID().uuidString, value: state)
        }
        
        nearestRides(to: ref)
    }
    
    func nearestRides(to ref: Int) {
        if nearestRides == nil {
            var distanceRide = [Int: Int]()
            var dictionaryRides = [Int: Ride]()
            for ride in allRides {
                var closest = Int.max
                for loc in ride.station_path {
                    if closest > abs(loc - ref) {
                        closest = abs(loc - ref)
                    }
                }
                distanceRide[ride.id] = closest
                dictionaryRides[ride.id] = ride
            }
            let sortedRides = distanceRide.sorted { ride1, ride2 in
                return ride1.value < ride2.value
            }
            
            nearestRides = [Ride]()
            for sortedRide in sortedRides {
                nearestRides?.append(dictionaryRides[sortedRide.key]!)
            }
        }
        rides = nearestRides ?? [Ride]()
    }
    
    func upcomingRides() {
        rides = allRides.filter { ride in
            return ride.date.toDate() > Date()
        }
        upcomingRidesCount = rides.count
    }
    
    func pastRides() {
        rides = allRides.filter { ride in
            return ride.date.toDate() < Date()
        }
        pastRidesCount = rides.count
    }
    
    func sortRidesBy(state: String, citiesLoader: CitiesLoader) {
        citiesLoader.updateCities(with: state)
        rides = allRides.filter { ride in
            return ride.state == state
        }
    }
    
    func sortRidesBy(city: String) {
        rides = allRides.filter { ride in
            return ride.city == city
        }
    }
}
