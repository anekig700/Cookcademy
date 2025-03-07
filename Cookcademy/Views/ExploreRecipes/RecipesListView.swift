//
//  RecipesListView.swift
//  Cookcademy
//
//  Created by Kotya on 22/02/2025.
//

import SwiftUI

struct RecipesListView: View {
    
    @EnvironmentObject private var recipeData: RecipeData
    let category: MainInformation.Category
    
    @State private var isPresenting = false
    @State private var newRecipe = Recipe()
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(recipes) { recipe in
                    NavigationLink(recipe.mainInformation.name, destination: RecipeDetailView(recipe: binding(for: recipe)))
                }
                .listRowBackground(listBackgroundColor)
                .foregroundStyle(listTextColor)
            }
            .navigationTitle(navigationTitle)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isPresenting = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
            .sheet(isPresented: $isPresenting, content: {
                NavigationStack {
                    ModifyRecipeView(recipe: $newRecipe)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction, content: {
                                Button("Dismiss", action: {
                                    isPresenting = false
                                })
                            })
                            ToolbarItem(placement: .confirmationAction, content: {
                                if newRecipe.isValid {
                                    Button("Add", action: {
                                        recipeData.add(newRecipe)
                                        isPresenting = false
                                    })
                                }
                            })
                        }
                        .navigationTitle("Add a New Recipe")
                }
            })
        }
    }
}

extension RecipesListView {
    
    private var recipes: [Recipe] {
        recipeData.recipes(for: category)
      }
    
    private var navigationTitle: String {
        "\(category.rawValue) Recipes"
    }
    
    func binding(for recipe: Recipe) -> Binding<Recipe> {
        guard let index = recipeData.index(of: recipe) else {
            fatalError("Recipe not found")
        }
        return $recipeData.recipes[index]
    }
}

#Preview {
    NavigationView {
        RecipesListView(category: .breakfast)
            .environmentObject(RecipeData())
    }
}
