//
//  RideRowContentView.swift
//  Edvora
//
//  Created by Decagon on 28/02/2022.
//

import SwiftUI

struct RideRowContentView: View {
    var leftTitle: String
    var rightTitle: String?
    var leftContent: String
    var rightContent: String?
    
    var body: some View {
        HStack {
            VStack {
                Text(leftTitle)
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
                Text(leftContent)
                    .font(.system(size: 16))
                    .foregroundColor(.black)
            }.padding()
            Spacer()
            if let rightTitle = rightTitle, let rightContent = rightContent {
                VStack {
                    Text(rightTitle)
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                    Text(rightContent)
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                }.padding()
            }
        }
    }
}

struct RideRowContentView_Previews: PreviewProvider {
    static var previews: some View {
        RideRowContentView(leftTitle: "Ride id", rightTitle: "Origin Station", leftContent: "001", rightContent: "20")
    }
}
