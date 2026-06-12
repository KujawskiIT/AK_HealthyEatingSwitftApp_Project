//
//  MealListViewModel.swift
//  HealthyEating
//
//  Created by user271132 on 6/12/26.
//

import Foundation
import Combine

@MainActor
class MealListViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    @Published var categories: [String] = []
    @Published var selectedCategory: String = "Seafood"
    @Published var isLoading = false
    @Published var errorMessage: String?

    func fetchCategories() async {
        do {
            categories = try await MealService.shared.fetchCategories().map { $0.name }
            if let first = categories.first {
                selectedCategory = first
            }
            await fetchMeals()
        } catch {
            errorMessage = "Failed to load categories"
        }
    }

    func fetchMeals() async {
        isLoading = true
        do {
            meals = try await MealService.shared.fetchMeals(category: selectedCategory)
        } catch {
            errorMessage = "Failed to load meals"
        }
        isLoading = false
    }
}
