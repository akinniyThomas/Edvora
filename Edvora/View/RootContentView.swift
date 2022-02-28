//
//  RootContentView.swift
//  Edvora
//
//  Created by Decagon on 28/02/2022.
//

import SwiftUI

struct RootContentView: View {
    
    var networkService = NetworkService()
    @ObservedObject var userLoader: UserLoader
    init() {
        userLoader = UserLoader(networkService: networkService)
    }
    var body: some View {
        VStack {
            HStack {
                Text("Edvora")
                    .font(.largeTitle)
                    .padding()
                Spacer()
                UrlImageView(imageUrl: userLoader.user?.url ?? "", networkService: networkService)
                    .frame(width: 42, height: 42)
                    .cornerRadius(21)
                    .padding()
            }
            EdvoraList(networkService: networkService, ref: userLoader.user?.station_code ?? 0)
        }
    }
}

struct RootContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootContentView()
    }
}
