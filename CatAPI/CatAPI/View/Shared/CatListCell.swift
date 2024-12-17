//
//  CatListCell.swift
//  CatAPI
//
//  Created by Jorge Palomino on 13/06/2024.
//

import SwiftUI

struct CatListCell: View {
    
    var cat: Cat
    var breedSelectedCallback: ((_ breed: Breed) -> Void)
    
    var body: some View {
        VStack {
            NetworkRemoteImage(urlString: cat.url)
            
            if let breeds = cat.breeds, breeds.count > 0 {
                Text(breeds.first?.name ?? "")
                    .font(.title)
                    
                HStack(alignment: .center) {
                    ForEach(breeds) { breed in
                        Button(action: {
                            Task{
                                // Breed tapped
                                breedSelectedCallback(breed)
                            }
                        }) {
                            Text("More about \(breed.name)")
                                .frame(minWidth: 0, maxWidth: .infinity)
                        }
                        .accessibilityIdentifier("breedButton")
                        .buttonStyle(CustomButton())
                        
                    }
                }
                .padding(.init(top: 0, leading: 8, bottom: 8, trailing: 8))
            }
        }
        .background(.white)
    }
        
}

#Preview {
    CatListCell(cat: CatMockData.sampleCat, breedSelectedCallback: {breed in })
}
