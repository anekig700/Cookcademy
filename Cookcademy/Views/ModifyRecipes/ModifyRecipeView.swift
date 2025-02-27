//
//  ModifyRecipeView.swift
//  Cookcademy
//
//  Created by Kotya on 27/02/2025.
//

import SwiftUI

struct ModifyRecipeView: View {
    
    @Binding var recipe: Recipe
    
    var body: some View {
        Button("Fill in the recipe with test data.") {
            recipe.mainInformation = MainInformation(
                name: "test",
                description: "test",
                author: "test",
                category: .breakfast
            )
            recipe.ingredients = [Ingredient(
                name: "test",
                quantity: 1.0,
                unit: .none
            )]
            recipe.directions = [Direction(
                description: "test",
                isOptional: false
            )]
        }
    }
}

#Preview {
    @Previewable @State var recipe = Recipe()
    ModifyRecipeView(recipe: $recipe)
}
