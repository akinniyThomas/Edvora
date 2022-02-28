//
//  Date+Extension.swift
//  Edvora
//
//  Created by Decagon on 28/02/2022.
//

import Foundation

extension Date {
    static func > (lhs: Date, rhs: Date) -> Bool {
        return lhs.timeIntervalSinceReferenceDate > rhs.timeIntervalSinceReferenceDate
    }
}
