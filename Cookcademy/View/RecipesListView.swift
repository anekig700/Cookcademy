//
//  RecipesListView.swift
//  Cookcademy
//
//  Created by Kotya on 22/02/2025.
//

import SwiftUI

struct RecipesListView: View {
    
    @StateObject var recipeData = RecipeData()
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        List {
            ForEach(recipes) { recipe in
                NavigationLink(recipe.mainInformation.name, destination: RecipeDetailView(recipe: recipe))
            }
            .listRowBackground(listBackgroundColor)
            .foregroundStyle(listTextColor)
        }
        .navigationTitle(navigationTitle)
    }
}

extension RecipesListView {
    var recipes: [Recipe] {
        recipeData.recipes
    }
    
    var navigationTitle: String {
        "All Recipes"
    }
}

#Preview {
    NavigationView {
        RecipesListView()
    }
}
