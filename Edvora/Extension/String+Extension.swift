//
//  String+Extension.swift
//  Edvora
//
//  Created by Decagon on 28/02/2022.
//

import SwiftUI

extension String {
    func loadImage(networkService: NetworkService) -> UIImage {
        var image: UIImage?
        networkService.loadImage(from: self) { data in
            image = UIImage(data: data)
        }
        guard let image = image else { return UIImage(systemName: "person") ?? UIImage() }
        return image
    }
    
    func formatDate() -> String {
        let datePart = self.split(separator: " ")[0]
        let date = datePart.split(separator: "/")
        guard let day = Int(date[1]) else { return "" }
        guard let month = Int(date[0]) else { return "" }
        var result = ""
        switch day % 10 {
        case 1:
            result = String(day) + "st"
        case 2:
            result = String(day) + "nd"
        case 3:
            result = String(day) + "rd"
        default:
            result = String(day) + "th"
        }
        let months = [1: "Jan", 2: "Feb", 3: "Mar", 4: "Apr", 5: "May", 6: "Jun", 7: "Jul", 8: "Aug", 9: "Sep", 10: "Oct", 11: "Nov", 12: "Dec"]
        guard let m = months[month] else { return "" }
        result += " " + m
        return result
    }
    
    func toRgb() -> Color {
        let colorArray = self.split(separator: " ")
        return Color(UIColor(red: CGFloat(Int(colorArray[0]) ?? 0 / 255), green: CGFloat(Int(colorArray[1]) ?? 0 / 255), blue: CGFloat(Int(colorArray[2]) ?? 0 / 255), alpha: 1))
    }
    
    func toDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from: self) {
            return date
        }
        return Date()
    }
}
