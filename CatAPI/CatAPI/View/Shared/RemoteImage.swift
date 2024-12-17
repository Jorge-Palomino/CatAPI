//
//  RemoteImage.swift
//  CatAPI
//
//  Created by Jorge Palomino on 13/06/2024.
//

import Combine
import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    @Published var isLoading = false
        
    func load(fromURLString urlString: String) {
        
        isLoading = true
        
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiImage in
            guard let uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
                self.isLoading = false
            }
        }
    }
}


struct RemoteImage: View {
    var image: Image?
   
    var body: some View {
        image?.resizable() ?? Image("placeholder").resizable()
    }
}

struct NetworkRemoteImage: View {
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        Group {
            if let image = imageLoader.image {
                Rectangle()
                    .aspectRatio(1, contentMode: .fit)
                    .overlay(
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    )
            }else if imageLoader.isLoading {
                Rectangle()
                    .foregroundColor(.black.opacity(0))
                    .aspectRatio(1, contentMode: .fit)
                    .overlay(
                        ProgressView()
                    )
            }else {
                Image("placeholder").resizable()
            }
        }
        .onAppear {
            imageLoader.load(fromURLString: urlString)
        }
    }
}
