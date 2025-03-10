//
//  ModifyMainInformationView.swift
//  Cookcademy
//
//  Created by Kotya on 03/03/2025.
//

import SwiftUI

struct ModifyMainInformationView: View {
    
    @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
    @AppStorage("listTextColor") private var listTextColor = AppColor.foreground
    
    @Binding var mainInformation: MainInformation
    
    var body: some View {
        Form {
            TextField("Recipe Name", text: $mainInformation.name)
                .listRowBackground(listBackgroundColor)
            TextField("Author", text: $mainInformation.author)
                .listRowBackground(listBackgroundColor)
            Section("Description") {
                TextEditor(text: $mainInformation.description)
                    .listRowBackground(listBackgroundColor)
            }
            Picker(selection: $mainInformation.category, content: {
                ForEach(MainInformation.Category.allCases, id: \.self) {
                    category in
                    Text(category.rawValue)
                }
            }, label: {
                HStack {
                    Text("Category")
                    Spacer()
                }
            })
            .listRowBackground(listBackgroundColor)
            .pickerStyle(MenuPickerStyle())
        }
        .foregroundStyle(listTextColor)
    }
}

#Preview {
    @Previewable @State var mainInformation = MainInformation(name: "Test", description: "Test", author: "Test", category: .breakfast)
    ModifyMainInformationView(mainInformation: $mainInformation)
}

#Preview {
    @Previewable @State var mainInformation = MainInformation(name: "", description: "", author: "", category: .lunch)
    ModifyMainInformationView(mainInformation: $mainInformation)
}
