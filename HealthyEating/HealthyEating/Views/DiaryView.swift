//
//  DiaryView.swift
//  HealthyEating
//
//  Created by user271132 on 6/12/26.
//

import SwiftUI

struct DiaryView: View {
    @State private var entries: [DiaryEntry] = []
    @State private var showingAdd = false
    @State private var newMealName = ""
    @State private var newCalories = ""

    var body: some View {
        NavigationStack {
            List {
                ForEach(entries) { entry in
                    VStack(alignment: .leading) {
                        Text(entry.mealName).font(.headline)
                        Text("\(entry.calories) kcal")
                            .foregroundColor(.secondary)
                        Text(entry.date.formatted(date: .abbreviated, time: .shortened))
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                .onDelete { indices in
                    entries.remove(atOffsets: indices)
                    saveEntries()
                }
            }
            .navigationTitle("Dziennik")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAdd = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .alert("Dodaj posiłek", isPresented: $showingAdd) {
                TextField("Nazwa posiłku", text: $newMealName)
                TextField("Kalorie", text: $newCalories)
                    .keyboardType(.numberPad)
                Button("Dodaj") {
                    if let kcal = Int(newCalories), !newMealName.isEmpty {
                        let entry = DiaryEntry(mealName: newMealName, calories: kcal, date: Date())
                        entries.append(entry)
                        saveEntries()
                        newMealName = ""
                        newCalories = ""
                    }
                }
                Button("Anuluj", role: .cancel) {}
            }
            .onAppear { loadEntries() }
        }
    }

    private func saveEntries() {
        if let data = try? JSONEncoder().encode(entries) {
            UserDefaults.standard.set(data, forKey: "diary_entries")
        }
    }

    private func loadEntries() {
        if let data = UserDefaults.standard.data(forKey: "diary_entries"),
           let saved = try? JSONDecoder().decode([DiaryEntry].self, from: data) {
            entries = saved
        }
    }
}
