//
//  ImageLoader.swift
//  Edvora
//
//  Created by Decagon on 28/02/2022.
//

import Foundation
import UIKit

final class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    
    var networkService: NetworkService
    var urlString: String
    
    init(urlString: String, networkService: NetworkService) {
        self.urlString = urlString
        self.networkService = networkService
        loadImage()
    }
    
    func loadImage() {
        loadImageFromUrl()
    }
    
    func loadImageFromUrl() {
        networkService.loadImage(from: urlString, imageCompletion:  { data in
            DispatchQueue.main.async {
                guard let image = UIImage(data: data) else { return }
                self.image = image
            }
        })
    }
}
