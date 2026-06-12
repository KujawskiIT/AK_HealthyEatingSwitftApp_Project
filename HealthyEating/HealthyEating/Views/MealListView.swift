//
//  MealListView.swift
//  HealthyEating
//
//  Created by user271132 on 6/12/26.
//

import SwiftUI

struct MealListView: View {
    @StateObject private var viewModel = MealListViewModel()

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let error = viewModel.errorMessage {
                    Text(error).foregroundColor(.red)
                } else {
                    List(viewModel.meals) { meal in
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
                }
            }
            .navigationTitle(viewModel.selectedCategory)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu("Category") {
                        ForEach(viewModel.categories, id: \.id) { cat in
                            Button(cat.name) {
                                viewModel.selectedCategory = cat.name
                                Task { await viewModel.loadMeals() }
                            }
                        }
                    }
                }
            }
            .task {
                await viewModel.loadCategories()
                await viewModel.loadMeals()
            }
        }
    }
}
