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
    @Published var categories: [MealCategory] = []
    @Published var selectedCategory: String = "Chicken"
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let service = MealService.shared

    func loadCategories() async {
        do {
            categories = try await service.fetchCategories()
        } catch {
            errorMessage = "Nie udało się pobrać kategorii"
        }
    }

    func loadMeals() async {
        isLoading = true
        errorMessage = nil
        do {
            meals = try await service.fetchMeals(category: selectedCategory)
        } catch {
            errorMessage = "Nie udało się pobrać przepisów"
        }
        isLoading = false
    }
}
