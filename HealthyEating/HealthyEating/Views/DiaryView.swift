//
//  DiaryView.swift
//  HealthyEating
//
//  Created by user271132 on 6/12/26.
//

import SwiftUI

struct DiaryView: View {
    @StateObject private var viewModel = DiaryViewModel()
    @State private var showingAdd = false
    @State private var newMealName = ""
    @State private var newCalories = ""

    var totalCalories: Int {
        viewModel.entries.reduce(0) { $0 + $1.calories }
    }

    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack {
                        Text("Total today")
                            .font(.headline)
                        Spacer()
                        Text("\(totalCalories) kcal")
                            .font(.headline)
                            .foregroundColor(.orange)
                    }
                }

                Section("History") {
                    ForEach(viewModel.entries) { entry in
                        VStack(alignment: .leading) {
                            Text(entry.mealName).font(.headline)
                            Text("\(entry.calories) kcal")
                                .foregroundColor(.secondary)
                            Text(entry.date.formatted(date: .abbreviated, time: .shortened))
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    .onDelete { viewModel.delete(at: $0) }
                }
            }
            .navigationTitle("Diary")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button { showingAdd = true } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .alert("Add meal", isPresented: $showingAdd) {
                TextField("Meal name", text: $newMealName)
                TextField("Calories", text: $newCalories)
                    .keyboardType(.numberPad)
                Button("Add") {
                    if let kcal = Int(newCalories), !newMealName.isEmpty {
                        viewModel.add(mealName: newMealName, calories: kcal)
                        newMealName = ""
                        newCalories = ""
                    }
                }
                Button("Cancel", role: .cancel) {}
            }
            .onAppear { viewModel.load() }
        }
    }
}	
