//
//  DropDown.swift
//  Edvora
//
//  Created by Decagon on 28/02/2022.
//

import SwiftUI

struct DropDown: View {
    var options: [DropDownOption]
    var onOptionSelected: ((DropDownOption) -> Void)?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(self.options, id: \.self) { option in
                    DropDownRow(option: option, onOptionSelected: self.onOptionSelected)
                }
            }
        }
        .frame(height: 500)
        .padding(.vertical, 5)
        .background(Color.white)
        .cornerRadius(5)
        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
    }
}

//struct DropDown_Previews: PreviewProvider {
//    static var previews: some View {
//        DropDown()
//    }
//}
