//
//  CalendarDate.swift
//  Edvora
//
//  Created by Decagon on 28/02/2022.
//

import SwiftUI

struct ImageText: View {
    var date: String
    var isHashTag: Bool
    var id: String
    var body: some View {
        HStack {
            Image(uiImage: UIImage(named: isHashTag ? "hashtag" : "calendar") ?? UIImage())
                .resizable()
                .frame(width: 16, height: 16)
                
            Text(isHashTag ? id : date.formatDate())
        }
    }
}

struct ImageText_Previews: PreviewProvider {
    static var previews: some View {
        ImageText(date: "02/14/2022 2:42 PM", isHashTag: false, id: "002")
    }
}
