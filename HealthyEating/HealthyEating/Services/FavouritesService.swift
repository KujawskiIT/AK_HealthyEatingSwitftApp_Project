//
//  FavouritesService.swift
//  HealthyEating
//
//  Created by user271132 on 6/12/26.
//

import Foundation

class FavouritesService {
    static let shared = FavouritesService()
    private init() {}

    private let key = "favourite_meals"

    func loadFavourites() -> [Meal] {
        guard let data = UserDefaults.standard.data(forKey: key),
              let meals = try? JSONDecoder().decode([Meal].self, from: data) else {
            return []
        }
        return meals
    }

    func saveFavourites(_ meals: [Meal]) {
        if let data = try? JSONEncoder().encode(meals) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }

    func isFavourite(_ meal: Meal) -> Bool {
        loadFavourites().contains(where: { $0.id == meal.id })
    }

    func toggleFavourite(_ meal: Meal) {
        var favourites = loadFavourites()
        if let index = favourites.firstIndex(where: { $0.id == meal.id }) {
            favourites.remove(at: index)
        } else {
            favourites.append(meal)
        }
        saveFavourites(favourites)
    }
}
