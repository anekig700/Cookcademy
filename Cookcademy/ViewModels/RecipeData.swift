//
//  RecipeData.swift
//  Cookcademy
//
//  Created by Kotya on 25/02/2025.
//

import Foundation

class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
}
