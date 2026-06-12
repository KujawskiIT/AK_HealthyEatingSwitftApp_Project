//
//  DiaryViewModel.swift
//  HealthyEating
//
//  Created by user271132 on 6/12/26.
//

import Foundation
import Combine
import SwiftUI

@MainActor
class DiaryViewModel: ObservableObject {
    @Published var entries: [DiaryEntry] = []

    private let key = "diary_entries"

    func load() {
        if let data = UserDefaults.standard.data(forKey: key),
           let saved = try? JSONDecoder().decode([DiaryEntry].self, from: data) {
            entries = saved
        }
    }

    func add(mealName: String, calories: Int) {
        let entry = DiaryEntry(mealName: mealName, calories: calories, date: Date())
        entries.append(entry)
        save()
    }

    func delete(at offsets: IndexSet) {
        entries.remove(atOffsets: offsets)
        save()
    }

    private func save() {
        if let data = try? JSONEncoder().encode(entries) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}
