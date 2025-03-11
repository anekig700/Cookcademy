//
//  MainTabView.swift
//  Cookcademy
//
//  Created by Kotya on 07/03/2025.
//

import SwiftUI

struct MainTabView: View {
    
    @StateObject private var recipeData = RecipeData()
    
    var body: some View {
        TabView {
            Tab("Recipes", systemImage: "list.dash") {
                RecipeCategoryGridView()
            }
            Tab("Favorites", systemImage: "heart.fill") {
                NavigationView {
                    RecipesListView(viewStyle: .favorites)
                }
            }
            Tab("Settings", systemImage: "gear") {
                SettingsView()
            }
        }
        .environmentObject(recipeData)
        .onAppear {
            recipeData.loadRecipes()
        }
    }
}

#Preview {
    MainTabView()
}
