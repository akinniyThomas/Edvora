//
//  DetailsView.swift
//  Edvora
//
//  Created by Decagon on 28/02/2022.
//

import SwiftUI

struct DetailsView: View {
    @Binding var isOpen: Bool
    @GestureState private var translation: CGFloat = 0
    
    var ride: Ride?
    var networkService: NetworkService
    let maxHeight: CGFloat
    let minHeight: CGFloat
    
    init(isOpen: Binding<Bool>, maxHeight: CGFloat, ride: Ride?, networkService: NetworkService) {
        self._isOpen = isOpen
        self.maxHeight = maxHeight
        self.minHeight = maxHeight * -0.25
        self.ride = ride
        self.networkService = networkService
    }
    
    private var offset: CGFloat {
        isOpen ? 0 : maxHeight - minHeight
    }
    
    private var indicator: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.secondary)
            .frame(width: 60, height: 6)
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                self.indicator.padding()
                if let ride = ride {
                    UrlImageView(imageUrl: ride.map_url, networkService: networkService)
                        .frame(height: 224)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    RideContentView(ride: ride)
                }
            }
            .frame(width: geometry.size.width, height: self.maxHeight, alignment: .top)
            .background(Color.white.opacity(0.9))
            .cornerRadius(10)
            .frame(height: geometry.size.height, alignment: .bottom)
            .offset(y: self.offset)
            .animation(.interactiveSpring(), value: isOpen)
            .animation(.interactiveSpring(), value: translation)
        }
    }
}
