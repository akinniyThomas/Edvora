//
//  DropDownRow.swift
//  Edvora
//
//  Created by Decagon on 28/02/2022.
//

import SwiftUI

struct DropDownRow: View {
    var option: DropDownOption
    var onOptionSelected: ((DropDownOption) -> Void)?
    
    var body: some View {
        Button(action: {
            if let onOptionSelected = onOptionSelected {
                onOptionSelected(self.option)
            }
        }) {
            HStack {
                Text(self.option.value)
                    .font(.system(size: 14))
                    .foregroundColor(Color.black)
                
                Spacer()
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 5)
    }
}
