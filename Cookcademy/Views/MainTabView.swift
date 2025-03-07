//
//  MainTabView.swift
//  Cookcademy
//
//  Created by Kotya on 07/03/2025.
//

import SwiftUI

struct MainTabView: View {
    
    @StateObject var recipeData = RecipeData()
    
    var body: some View {
        TabView {
            Tab("Recipes", systemImage: "list.dash") {
                RecipeCategoryGridView()
            }
            Tab("Favorites", systemImage: "heart.fill") {
                NavigationStack {
                    RecipesListView(viewStyle: .favorites)
                }
            }
        }
        .environmentObject(recipeData)
    }
}

#Preview {
    MainTabView()
}
