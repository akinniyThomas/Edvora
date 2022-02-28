//
//  EdvoraRide.swift
//  Edvora
//
//  Created by Decagon on 27/02/2022.
//

import SwiftUI

struct EdvoraRide: View {
    var ride: Ride
    var networkService: NetworkService
    var body: some View {
        ZStack {
            Color.white
            
            VStack {
                UrlImageView(imageUrl: ride.map_url, networkService: networkService)
                    .padding(EdgeInsets(top: 0, leading: -20, bottom: 0, trailing: -20))
                    .frame(height: 173)
                    .scaledToFill()
                    .cornerRadius(10)
                HStack {
                    ImageText(date: "", isHashTag: true, id: String(ride.id))
                        .padding()
                    Spacer()
                    ImageText(date: ride.date, isHashTag: false, id: "")
                        .padding()
                }
                .background("200 200 200".toRgb())
            }
        }
//        .cornerRadius(10)
    }
}

struct EdvoraRide_Previews: PreviewProvider {
    static var previews: some View {
        EdvoraRide(ride: Ride(id: 113, origin_station_code: 9, station_path: [32, 44, 50, 69, 78, 81], destination_station_code: 99, date: "02/14/2022 2:42 PM", map_url: "https://picsum.photos/200", state: "Odisha", city: "Sambalpur"), networkService: NetworkService())
    }
}
