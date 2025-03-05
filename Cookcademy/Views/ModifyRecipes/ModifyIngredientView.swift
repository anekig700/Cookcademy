//
//  ModifyIngredientView.swift
//  Cookcademy
//
//  Created by Kotya on 04/03/2025.
//

import SwiftUI

struct ModifyIngredientView: ModifyComponentView {
    
    @Binding var ingredient: Ingredient
    let createAction: ((Ingredient) -> Void)
    
    init(component: Binding<Ingredient>, createAction: @escaping (Ingredient) -> Void) {
        self._ingredient = component
        self.createAction = createAction
    }
    
    @Environment(\.dismiss) private var mode
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        VStack {
            Form {
                TextField("Ingredient Name", text: $ingredient.name)
                    .listRowBackground(listBackgroundColor)
                Stepper(value: $ingredient.quantity, in: 0...100, step: 0.5) {
                    HStack {
                        Text("Quantity")
                        TextField("Quantity", value: $ingredient.quantity, formatter: NumberFormatter.decimal)
                            .keyboardType(.numbersAndPunctuation)
                    }
                }.listRowBackground(listBackgroundColor)
                Picker(selection: $ingredient.unit, content: {
                    ForEach(Ingredient.Unit.allCases, id: \.self) {
                        unit in
                        Text(unit.rawValue)
                    }
                }, label: {
                        Text("Unit")
                }).listRowBackground(listBackgroundColor)
                .pickerStyle(MenuPickerStyle())
                HStack {
                    Spacer()
                    Button("Save") {
                        createAction(ingredient)
                        _mode.wrappedValue.callAsFunction()
                    }
                    Spacer()
                }.listRowBackground(listBackgroundColor)
            }.foregroundStyle(listTextColor)
        }
    }
}

extension NumberFormatter {
    static var decimal: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }
}

#Preview {
    @Previewable @State var ingredient = Ingredient()
    ModifyIngredientView(component: $ingredient) { ingredient in
        print(ingredient)
    }
}
