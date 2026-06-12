//
//  FavouritesViewModel.swift
//  HealthyEating
//
//  Created by user271132 on 6/12/26.
//

import Foundation
import Combine

@MainActor
class FavouritesViewModel: ObservableObject {
    @Published var favourites: [Meal] = []

    private let service = FavouritesService.shared

    func loadFavourites() {
        favourites = service.loadFavourites()
    }

    func isFavourite(_ meal: Meal) -> Bool {
        service.isFavourite(meal)
    }

    func toggleFavourite(_ meal: Meal) {
        service.toggleFavourite(meal)
        loadFavourites()
    }
}
