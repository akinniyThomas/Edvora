//
//  UrlImageView.swift
//  Edvora
//
//  Created by Decagon on 28/02/2022.
//

import SwiftUI

struct UrlImageView: View {
    @ObservedObject var imageToLoad: ImageLoader
    
    init(imageUrl: String, networkService: NetworkService) {
        imageToLoad = ImageLoader(urlString: imageUrl, networkService: networkService)
    }
    var body: some View {
        Image(uiImage: imageToLoad.image ?? UIImage())
            .resizable()
//            .scaledToFit()
//            .frame(height: 173)
//            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    }
}

struct UrlImageView_Previews: PreviewProvider {
    static var previews: some View {
        UrlImageView(imageUrl: "https://picsum.photos/200", networkService: NetworkService())
    }
}
