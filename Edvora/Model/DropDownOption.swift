//
//  File.swift
//  Edvora
//
//  Created by Decagon on 28/02/2022.
//

import Foundation

struct DropDownOption: Hashable {
    let key: String
    let value: String
    
    public static func == (lhs: DropDownOption, rhs: DropDownOption) -> Bool {
        return lhs.key == rhs.key
    }
}
