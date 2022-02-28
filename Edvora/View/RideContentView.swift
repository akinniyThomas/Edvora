//
//  RideContentView.swift
//  Edvora
//
//  Created by Decagon on 28/02/2022.
//

import SwiftUI

struct RideContentView: View {
    var ride: Ride
    
    var body: some View {
        VStack {
            RideRowContentView(leftTitle: "Ride ID", rightTitle: "Origin Station", leftContent: String(ride.id), rightContent: String(ride.origin_station_code))
            Divider()
                .frame(height: 2)
                .background(Color.gray)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            RideRowContentView(leftTitle: "Date", rightTitle: "Distance", leftContent: ride.date.formatDate(), rightContent: String(ride.origin_station_code))
            Divider()
                .frame(height: 2)
                .background(Color.gray)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            RideRowContentView(leftTitle: "State", rightTitle: "City", leftContent: ride.state, rightContent: ride.city)
            Divider()
                .frame(height: 2)
                .background(Color.gray)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            RideRowContentView(leftTitle: "Station Path", rightTitle: nil, leftContent: ride.station_path.map { String($0) }.joined(separator: ", "), rightContent: nil)
        }
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct RideContentView_Previews: PreviewProvider {
    static var previews: some View {
        RideContentView(ride: Ride(id: 113, origin_station_code: 9, station_path: [32, 44, 50, 69, 78, 81], destination_station_code: 99, date: "02/14/2022 2:42 PM", map_url: "https://picsum.photos/200", state: "Odisha", city: "Sambalpur"))
    }
}
