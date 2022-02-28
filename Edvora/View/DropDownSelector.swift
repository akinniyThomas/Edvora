//
//  DropDownSelector.swift
//  Edvora
//
//  Created by Decagon on 28/02/2022.
//

import SwiftUI

struct DropDownSelector: View {
    @State private var shouldShowDropDown = false
    @State private var selectedOption: DropDownOption? = nil
    var placeholder: String
    var options: [DropDownOption]
    var onOptionSelected: ((DropDownOption) -> Void)?
    private let buttonHeight: CGFloat = 45
    
    var body: some View {
        VStack {
        Button(action: {
            self.shouldShowDropDown.toggle()
        }) {
            HStack {
                Text(selectedOption == nil ? placeholder : selectedOption!.value)
                    .font(.system(size: 14))
                    .foregroundColor(selectedOption == nil ? Color.gray : Color.black)
                
                Spacer()
                
                Image(systemName: self.shouldShowDropDown ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                    .resizable()
                    .frame(width: 9, height: 5)
                    .font(.system(size: 9, weight: .medium))
                    .foregroundColor(Color.black)
            }
        }
        .padding(.horizontal)
        .cornerRadius(5)
        .frame(width: 200, height: buttonHeight)
        .overlay(RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.gray, lineWidth: 1))
        .background(RoundedRectangle(cornerRadius: 5).fill(Color.white))
            
            
            VStack {
                if self.shouldShowDropDown {
                    DropDown(options: self.options, onOptionSelected: { option in
                        shouldShowDropDown = false
                        selectedOption = option
                        self.onOptionSelected?(option)
                    })
                }
            }
        }
    }
}
