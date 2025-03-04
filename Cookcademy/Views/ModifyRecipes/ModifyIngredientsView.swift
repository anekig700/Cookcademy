//
//  ModifyIngredientsView.swift
//  Cookcademy
//
//  Created by Kotya on 04/03/2025.
//

import SwiftUI

struct ModifyIngredientsView: View {
    
    @Binding var ingredients: [Ingredient]
    @State private var newIngredient = Ingredient()
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        VStack {
            let addIngredientView = ModifyIngredientView(ingredient: $newIngredient) { ingredient in
                ingredients.append(ingredient)
                newIngredient = Ingredient()
            }.navigationTitle("Add ingredient")
            if ingredients.isEmpty {
                Spacer()
                NavigationLink("Add the first ingredient", destination: addIngredientView)
                Spacer()
            } else {
                List {
                    ForEach(ingredients.indices, id: \.self) { index in
                        let ingredient = ingredients[index]
                        Text(ingredient.description)
                    }.listRowBackground(listBackgroundColor)
                    NavigationLink("Add another ingredient", destination: addIngredientView)
                        .buttonStyle(PlainButtonStyle())
                        .listRowBackground(listBackgroundColor)
                }.foregroundStyle(listTextColor)
            }
        }
    }
}

#Preview {
    @Previewable @State var emptyIngredients = [Ingredient]()
    NavigationStack {
        ModifyIngredientsView(ingredients: $emptyIngredients)
    }
}
