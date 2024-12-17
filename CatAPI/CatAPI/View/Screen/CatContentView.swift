//
//  ContentView.swift
//  CatAPI
//
//  Created by Jorge Palomino on 13/06/2024.
//

import SwiftUI

struct CatContentView: View {
    
    @StateObject private var viewModel = CatViewModel()
    @State private var showError = false
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .center) {
                ScrollViewReader { proxy in
                    ScrollView {
                        EmptyView()
                            .id("TopConstant")
                        LazyVStack(alignment: .center, spacing: 20) {
                            ForEach(viewModel.cats) { cat in
                                CatListCell(cat: cat, breedSelectedCallback: { breed in
                                    Task{
                                        viewModel.selectedBreed = breed
                                        await viewModel.getCats(for: breed.id)
                                    }
                                }).clipShape(RoundedRectangle(cornerSize: CGSize(width: 16, height: 16)))
                                    .listRowSeparator(.hidden)
                                    .padding(.horizontal, 20)
                            }
                            
                            switch viewModel.state {
                            case .good:
                                Color.clear
                            case .isLoading:
                                LoadingView()
                            case .error(let message):
                                Text(" ")
                                    .onAppear {
                                        showError = true
                                    }
                                    .alert(isPresented: $showError,
                                           content: { self.notificationError(with: message) })
                            }
                            
                        }
                    }
                    .onChange(of: viewModel.cats) { _ in
                        proxy.scrollTo("TopConstant", anchor: .top)
                    }
                }
            }
            .background(Color(UIColor.secondarySystemBackground))
            .navigationBarTitle("Random Cats", displayMode: .large)
            .disabled(viewModel.isShowingDetail)
            .listStyle(.plain)
            .toolbar {
                Button("🔁", action: {
                    Task {
                        await getRandomCat()
                    }
                })
            }
            .safeAreaInset(edge: .bottom, spacing: 20) {
                footerView
            }
        }
        .task {
            await viewModel.getRandomCat()
        }
        .blur(radius: viewModel.isShowingDetail ? 20 : 0)
        
        
        if viewModel.isShowingDetail {
            BreedDetailCardView(isShowingDetail: $viewModel.isShowingDetail, breed: viewModel.selectedBreed, cats: viewModel.breedCats, refreshBreedImagesCallback: {
                Task{
                    await viewModel.getCats(for: viewModel.selectedBreed.id)
                 }
            })
            .offset(x:0, y:-150)
        }
    }
    
    var footerView: some View {
        Button(action: {
            Task {
                await getRandomCat()
            }
        }) {
            Text("Get random 🐱🔁")
                .frame(minWidth: 0, maxWidth: .infinity)
        }
        .buttonStyle(CustomButton())
        .accessibilityIdentifier("refreshButton")
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
        .background(Color(.systemBackground))
    }
    
    func notificationError(with error: String) -> Alert {
        Alert(
            title: Text("Error"),
            message: Text("\(error)"),
            dismissButton: .default(Text("OK")))
    }
    
    func getRandomCat() async {
        await viewModel.getRandomCat()
    }
}

#Preview {
    CatContentView()
}
