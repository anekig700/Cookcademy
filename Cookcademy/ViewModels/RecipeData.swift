//
//  RecipeData.swift
//  Cookcademy
//
//  Created by Kotya on 25/02/2025.
//

import Foundation

class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
    
    func recipes(for category: MainInformation.Category) -> [Recipe] {
        var filteredRecipes = [Recipe]()
        for recipe in recipes {
            if recipe.mainInformation.category == category {
                filteredRecipes.append(recipe)
            }
        }
        return filteredRecipes
    }
    
    func add(_ recipe: Recipe) {
        if recipe.isValid {
            recipes.append(recipe)
        }
    }
}
