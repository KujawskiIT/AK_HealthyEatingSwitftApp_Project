//
//  Meal.swift
//  HealthyEating
//
//  Created by user271132 on 6/12/26.
//

import Foundation

struct Meal: Identifiable, Codable, Hashable {
    let id: String
    let name: String
    let category: String
    let thumbnailURL: String
    let instructions: String
    let ingredients: [String]
    let area: String

    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case category = "strCategory"
        case thumbnailURL = "strMealThumb"
        case instructions = "strInstructions"
        case area = "strArea"
        case strIngredient1, strIngredient2, strIngredient3,
             strIngredient4, strIngredient5, strIngredient6,
             strIngredient7, strIngredient8, strIngredient9,
             strIngredient10
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        category = try container.decodeIfPresent(String.self, forKey: .category) ?? ""
        thumbnailURL = try container.decodeIfPresent(String.self, forKey: .thumbnailURL) ?? ""
        instructions = try container.decodeIfPresent(String.self, forKey: .instructions) ?? ""
        area = try container.decodeIfPresent(String.self, forKey: .area) ?? ""

        var list: [String] = []
        let keys: [CodingKeys] = [
            .strIngredient1, .strIngredient2, .strIngredient3,
            .strIngredient4, .strIngredient5, .strIngredient6,
            .strIngredient7, .strIngredient8, .strIngredient9,
            .strIngredient10
        ]
        for key in keys {
            if let val = try container.decodeIfPresent(String.self, forKey: key),
               !val.trimmingCharacters(in: .whitespaces).isEmpty {
                list.append(val)
            }
        }
        ingredients = list
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(category, forKey: .category)
        try container.encode(thumbnailURL, forKey: .thumbnailURL)
        try container.encode(instructions, forKey: .instructions)
        try container.encode(area, forKey: .area)
    }
}

struct MealResponse: Decodable {
    let meals: [Meal]?
}

struct CategoryResponse: Decodable {
    let categories: [MealCategory]
}

struct MealCategory: Identifiable, Codable {
    let id: String
    let name: String
    let thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case name = "strCategory"
        case thumbnailURL = "strCategoryThumb"
    }
}
