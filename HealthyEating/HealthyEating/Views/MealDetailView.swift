//
//  MealDetailView.swift
//  HealthyEating
//
//  Created by user271132 on 6/12/26.
//

import SwiftUI
import Combine

struct MealDetailView: View {
    let mealId: String
    @StateObject private var favouritesVM = FavouritesViewModel()
    @State private var meal: Meal?
    @State private var isLoading = true
    @State private var errorMessage: String?

    var body: some View {
        Group {
            if isLoading {
                ProgressView("Ładowanie...")
            } else if let error = errorMessage {
                Text(error).foregroundColor(.red)
            } else if let meal = meal {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        AsyncImage(url: URL(string: meal.thumbnailURL)) { image in
                            image.resizable().scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(maxWidth: .infinity)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding(.horizontal)

                        Text(meal.name)
                            .font(.largeTitle).bold()
                            .padding(.horizontal)

                        if !meal.area.isEmpty {
                            Text("🌍 \(meal.area)")
                                .foregroundColor(.secondary)
                                .padding(.horizontal)
                        }

                        Text("Składniki")
                            .font(.title2).bold()
                            .padding(.horizontal)

                        ForEach(meal.ingredients, id: \.self) { ingredient in
                            Text("• \(ingredient)")
                                .padding(.horizontal)
                        }

                        Text("Instrukcje")
                            .font(.title2).bold()
                            .padding(.horizontal)

                        Text(meal.instructions)
                            .padding(.horizontal)
                    }
                    .padding(.bottom)
                }
                .navigationTitle(meal.name)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            favouritesVM.toggleFavourite(meal)
                        } label: {
                            Image(systemName: favouritesVM.isFavourite(meal) ? "heart.fill" : "heart")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
        }
        .task {
            do {
                meal = try await MealService.shared.fetchMealDetail(id: mealId)
                favouritesVM.loadFavourites()
            } catch {
                errorMessage = "Nie udało się pobrać szczegółów"
            }
            isLoading = false
        }
    }
}
