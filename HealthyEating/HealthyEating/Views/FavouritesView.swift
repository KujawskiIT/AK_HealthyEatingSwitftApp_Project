//
//  FavouritesView.swift
//  HealthyEating
//
//  Created by user271132 on 6/12/26.
//

import SwiftUI

struct FavouritesView: View {
    @StateObject private var viewModel = FavouritesViewModel()

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.favourites.isEmpty {
                    VStack(spacing: 12) {
                        Image(systemName: "heart.slash")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                        Text("No favourite recipes yet")
                            .foregroundColor(.secondary)
                    }
                } else {
                    List {
                        ForEach(viewModel.favourites) { meal in
                            NavigationLink(destination: MealDetailView(mealId: meal.id)) {
                                HStack {
                                    AsyncImage(url: URL(string: meal.thumbnailURL)) { image in
                                        image.resizable().scaledToFill()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 60, height: 60)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))

                                    Text(meal.name)
                                        .font(.headline)
                                }
                            }
                        }
                        .onDelete { indices in
                            indices.forEach { i in
                                viewModel.toggleFavourite(viewModel.favourites[i])
                            }
                        }
                    }
                }
            }
            .navigationTitle("Favourites")
            .onAppear {
                viewModel.loadFavourites()
            }
        }
    }
}
