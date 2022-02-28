//
//  NetworkService.swift
//  Edvora
//
//  Created by Decagon on 27/02/2022.
//

import Foundation

final class NetworkService: ObservableObject {
    private var output = ""
    
    func loadData<T: Decodable>(from url: String, successCompletion: ((T) -> Void)?, errorCompletion: ((String) -> Void)? = nil, imageCompletion: ((Data) -> Void)? = nil) {
        guard let url = URL(string: url) else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                errorCompletion?(error.localizedDescription)
            }
            if let data = data {
                do {
                    if let imageCompletion = imageCompletion {
                        imageCompletion(data)
                    } else if let successCompletion = successCompletion {
                        let response = try JSONDecoder().decode(T.self, from: data)
                        successCompletion(response)
                    }
                } catch let error {
                    errorCompletion?(error.localizedDescription)
                }
            }
        }.resume()
    }
    
    
    func loadImage(from url: String, imageCompletion: ((Data) -> Void)?) {
        loadData(from: url, successCompletion: { [weak self] str in
            self?.output = str
        }, imageCompletion: imageCompletion)
    }
}
