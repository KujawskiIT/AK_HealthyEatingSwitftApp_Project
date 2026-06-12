//
//  DiaryEntry.swift
//  HealthyEating
//
//  Created by user271132 on 6/12/26.
//

import Foundation

struct DiaryEntry: Identifiable, Codable, Hashable {
    var id = UUID()
    let mealName: String
    let calories: Int
    let date: Date
}
