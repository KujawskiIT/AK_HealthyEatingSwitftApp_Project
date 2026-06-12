//
//  ContentView.swift	
//  HealthyEating
//
//  Created by user271132 on 6/12/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MealListView()
                .tabItem {
                    Label("Przepisy", systemImage: "fork.knife")
                }

            FavouritesView()
                .tabItem {
                    Label("Ulubione", systemImage: "heart.fill")
                }

            DiaryView()
                .tabItem {
                    Label("Dziennik", systemImage: "book.fill")
                }
        }
    }
}
