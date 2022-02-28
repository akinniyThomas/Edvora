//
//  EdvoraList.swift
//  Edvora
//
//  Created by Decagon on 27/02/2022.
//

import SwiftUI

struct EdvoraList: View {
    @ObservedObject var ridesLoader: RidesLoader
    @State private var bottomSheetShown = false
    @State private var selectedSection: SelectedSection
    @State private var selectedRide: Ride?
    @State private var popped: Bool?
    @State private var filterShow = false
    
    
    var networkService: NetworkService
    var ref: Int
    
    init(networkService: NetworkService, ref: Int) {
        self.networkService = networkService
        self.ref = ref
        ridesLoader = RidesLoader(networkService: networkService, ref: ref)
        selectedSection = .nearest
    }
    
    var body: some View {
        GeometryReader { geometry in
        ZStack {
            Color.white
            VStack(alignment: .leading, spacing: 15) {
                HStack {
                    Button("Nearest") {
                        ridesLoader.nearestRides(to: ref)
                        selectedSection = .nearest
                    }
                    .font(selectedSection == .nearest ? .system(size: 14).bold() : .system(size: 14))
                    .foregroundColor(selectedSection == .nearest ? .black : .gray)

                    Button("Upcoming (\(ridesLoader.upcomingRidesCount ?? 0))") {
                        ridesLoader.upcomingRides()
                        selectedSection = .upcoming
                    }
                    .font(selectedSection == .upcoming ? .system(size: 14).bold() : .system(size: 14))
                    .foregroundColor(selectedSection == .upcoming ? .black : .gray)

                    Button("Past (\(ridesLoader.pastRidesCount ?? 0))") {
                        ridesLoader.pastRides()
                        selectedSection = .past
                    }
                    .font(selectedSection == .past ? .system(size: 14).bold() : .system(size: 14))
                    .foregroundColor(selectedSection == .past ? .black : .gray)
                    
                    Spacer()
                    
                    Button("Filters") {
                        if selectedSection == .filter {
                            selectedSection = .none
                        } else {
                            selectedSection = .filter
                        }
                    }
                }.padding()
                
                List(ridesLoader.rides) { ride in
                    EdvoraRide(ride: ride, networkService: networkService)
                        .zIndex(1)
                        .onTapGesture {
                            if popped ?? false == false {
                                selectedRide = ride
                                popped = true
                                bottomSheetShown = true
                            } else {
                                popped = false
                                bottomSheetShown = false
                            }
                        }
                    }
                }
            }
            DetailsView(isOpen: self.$bottomSheetShown, maxHeight: geometry.size.height * 0.7, ride: selectedRide, networkService: networkService)
            
            if selectedSection == .filter {
                FilterView(ridesLoader: ridesLoader)
                    .frame(width: 228, height: 148, alignment: .topTrailing)
                    .position(x: geometry.size.width - 130, y: 100)
                    .zIndex(4)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct EdvoraList_Previews: PreviewProvider {
    static var previews: some View {
        EdvoraList(networkService: NetworkService(), ref: 20)
    }
}
