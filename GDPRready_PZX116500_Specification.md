---
# Project Specification — Healthy Eating Application
---

## 1. Project Description

A mobile application for the iOS platform supporting users in maintaining a healthy diet. Its main goal is to facilitate daily meal planning by providing access to a database of healthy recipes and the ability to monitor one's own diet. The application fetches recipe data from an external REST API (TheMealDB), presents it in a clear format along with ingredients and preparation instructions, and allows the user to manage a list of favourite dishes. An additional feature is a food diary, in which the user can log consumed meals and track daily calorie intake.

User data is stored locally on the device. The application interface is built using SwiftUI with the MVVM architectural pattern, ensuring separation of business logic from the view layer.

---

## 2. Functional Requirements

- FR1: The user can browse a list of healthy meal recipes fetched from an external REST API.
- FR2: The user can view the details of a selected recipe (ingredients, calorie content, preparation instructions).
- FR3: The user can add a recipe to the favourites list and remove it from that list.
- FR4: The user can log consumed meals in the food diary with a date and calorie count.
- FR5: The user can browse the history of their diary entries with a summary of daily calorie intake.
- FR6: The user can filter recipes by category (e.g. breakfast, lunch, dinner, snacks).

---

## 3. Non-Functional Requirements

- NFR1: The user interface is intuitive and compliant with Apple's Human Interface Guidelines (HIG).
- NFR2: The application applies separation of business logic from the view layer in accordance with the MVVM architectural pattern.
- NFR3: The source code is written in accordance with the naming conventions and code formatting typical for the Swift language.

---

## 4. Potential System Recipients

- Health-conscious individuals — users who consciously control their diet, look for new healthy meal recipes, and want to monitor daily calorie intake.
- Users with dietary goals — users aiming to lose weight, build muscle mass, or follow a diet prescribed by a specialist who need a tool to track their meal plan.
- Beginner cooks — users who want to start cooking healthily but do not know where to begin and need simple, clear recipes grouped by meal category.

---

## 5. Potential Benefits for End Users

- Easy access to a healthy recipe database - the user finds recipes with nutritional values in one place, eliminating the need to search multiple websites.
- Conscious diet control - the ability to log consumed meals and track daily calorie intake allows the user to monitor eating habits in real time.
- Time savings in meal planning - thanks to recipe categorisation and the favourites list, the user quickly finds trusted dishes without searching for inspiration from scratch every day.

---

## 6. Architecture and Technology

- Platform: iOS
- Programming language: Swift
- UI Framework: SwiftUI
- Architectural pattern: MVVM (Model-View-ViewModel)
- Recipe data source: external REST API — TheMealDB (https://www.themealdb.com/api.php)
- Local data storage: UserDefaults

---

## 7. Data Model

- Meal - id, name, thumbnailURL, area, instructions, ingredients
- DiaryEntry - id, mealName, calories, date

---

## 8. Main Application Views

- Recipes - list of recipe cards fetched from API, with category filtering via top menu
- Recipe Detail - image, ingredients, instructions, add/remove favourite button
- Favourites - list of recipes marked as favourite, with swipe-to-delete
- Diary — form to add an entry and history of entries with daily calorie total

---
## 9. Project Structure (MVVM)

- Model: Meal.swift, DiaryEntry.swift
- Services: MealService.swift, FavouritesService.swift
- ViewModel: MealListViewModel.swift, FavouritesViewModel.swift, DiaryViewModel.swift
- Views: MealListView.swift, MealDetailView.swift, FavouritesView.swift, DiaryView.swift
