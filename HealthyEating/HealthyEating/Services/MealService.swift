//
//  MealService.swift
//  HealthyEating
//
//  Created by user271132 on 6/12/26.
//

import Foundation

class MealService {
    static let shared = MealService()
    private init() {}

    private let baseURL = "https://www.themealdb.com/api/json/v1/1"

    func fetchCategories() async throws -> [MealCategory] {
        let url = URL(string: "\(baseURL)/categories.php")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(CategoryResponse.self, from: data)
        return response.categories
    }

    func fetchMeals(category: String) async throws -> [Meal] {
        let encoded = category.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? category
        let url = URL(string: "\(baseURL)/filter.php?c=\(encoded)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(MealResponse.self, from: data)
        return response.meals ?? []
    }

    func fetchMealDetail(id: String) async throws -> Meal {
        let url = URL(string: "\(baseURL)/lookup.php?i=\(id)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(MealResponse.self, from: data)
        guard let meal = response.meals?.first else {
            throw URLError(.badServerResponse)
        }
        return meal
    }
}
