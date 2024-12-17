//
//  BreedDetailCardView.swift
//  CatAPI
//
//  Created by Jorge Palomino on 13/06/2024.
//

import SwiftUI

struct BreedDetailCardView: View {
    @Binding var isShowingDetail:Bool
    
    let breed: Breed
    let cats: [Cat]
    var refreshBreedImagesCallback: (() -> Void)
    
    var body: some View {
        LazyVStack(alignment: .center, spacing: 10) {
            
            LazyVGrid(
                columns: [
                    GridItem(.adaptive(minimum: 130, maximum: 175))
                    ],
                spacing: 20,
                content: {
                    ForEach(cats) { cat in
                        NetworkRemoteImage(urlString: cat.url)
                            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 16, height: 16)))
                    }
                }
            )
            .padding(.horizontal, 20)
            
            Text(breed.name)
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top, 10)
            
            Text(breed.temperament)
                .multilineTextAlignment(.center)
                .font(.body)
                .lineLimit(2)
                .padding()
            
            Button(action: {
                refreshBreedImagesCallback()
            }) {
                Text("Find more 📸")
                    .frame(minWidth: 0, maxWidth: .infinity)
            }
            .buttonStyle(CustomButton())
            .padding(.horizontal, 20)
            
        }
        .frame(width: 320, height:560)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 40)
        .accessibilityIdentifier("breedDetail")
        .overlay(Button{
            isShowingDetail = false
        } label: {
            CloseButtonView()
        }, alignment: .topTrailing)
    }
}

#Preview {
    BreedDetailCardView(isShowingDetail: .constant(true), breed: BreedMockData.sampleBreed, cats: [CatMockData.sampleCat, CatMockData.otherSampleCat, CatMockData.anotherSampleCat, CatMockData.lastSampleCat], refreshBreedImagesCallback: {})
}
