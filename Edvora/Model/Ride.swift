//
//  Rides.swift
//  Edvora
//
//  Created by Decagon on 27/02/2022.
//

import Foundation

struct AllRides: Codable {
    var rides: [Ride]
}

struct Ride: Codable, Identifiable {
    var id: Int
    var origin_station_code: Int
    var station_path: [Int]
    var destination_station_code: Int
    var date: String
    var map_url: String
    var state: String
    var city: String
}
