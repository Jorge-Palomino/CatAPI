//
//  CloseButtonView.swift
//  CatAPI
//
//  Created by Jorge Palomino on 13/06/2024.
//

import SwiftUI

struct CloseButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.6)
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundColor(.black)
        }
    }
}
