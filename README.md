---
# HealthyEatingSwitftApp_Project

An iOS app for browsing healthy recipes and tracking daily food intake. Made for Univesity classes, so it is a prototype at best.
---

## What it does

- Browse recipes fetched from the TheMealDB REST API
- Filter recipes by category (breakfast, lunch, dinner, snacks and more)
- View full recipe details - ingredients, preparation instructions and origin
- Add and remove recipes from your personal favourites list
- Log meals in a food diary with calorie count and date
- Track total daily calorie intake in the diary summary

---

## Why

The goal of the app is to make healthy eating more accessible — one place for recipes, favourites and a personal diary, without the need to switch between multiple apps or websites.

---

## Tech stack

- Platform: iOS
- Language: Swift
- UI: SwiftUI
- Architecture: MVVM (Model-View-ViewModel)
- Data source: TheMealDB API (https://www.themealdb.com/api.php)
- Local storage: UserDefaults

---

## Project structure

- Model: Meal.swift, DiaryEntry.swift
- Services: MealService.swift, FavouritesService.swift
- ViewModel: MealListViewModel.swift, FavouritesViewModel.swift, DiaryViewModel.swift
- Views: MealListView.swift, MealDetailView.swift, FavouritesView.swift, DiaryView.swift

---

## How to run

1. Clone the repository
2. Open HealthyEating in Xcode
3. Select a simulator (iPhone 16 or newer recommended)
4. Press Run

No additional dependencies or configuration required.
