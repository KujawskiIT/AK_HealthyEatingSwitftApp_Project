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
                    Label("Recipes", systemImage: "fork.knife")
                }

            FavouritesView()
                .tabItem {
                    Label("Favourites", systemImage: "heart.fill")
                }

            DiaryView()
                .tabItem {
                    Label("Diary", systemImage: "book.fill")
                }
        }
    }
}
