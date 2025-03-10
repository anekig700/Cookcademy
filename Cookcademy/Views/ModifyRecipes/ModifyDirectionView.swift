//
//  ModifyDirectionView.swift
//  Cookcademy
//
//  Created by Kotya on 05/03/2025.
//

import SwiftUI

struct ModifyDirectionView: ModifyComponentView {
    
    @Binding var direction: Direction
    let createAction: ((Direction) -> Void)
    
    init(component: Binding<Direction>, createAction:  @escaping (Direction) -> Void) {
        self._direction = component
        self.createAction = createAction
    }
    
    @Environment(\.dismiss) private var mode
    
    @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
    @AppStorage("listTextColor") private var listTextColor = AppColor.foreground
    
    var body: some View {
        VStack {
            Form {
                TextField("Direction Description", text: $direction.description)
                    .listRowBackground(listBackgroundColor)
                Toggle("Optional", isOn: $direction.isOptional).listRowBackground(listBackgroundColor)
                HStack {
                    Spacer()
                    Button("Save") {
                        createAction(direction)
                        _mode.wrappedValue.callAsFunction()
                    }
                    Spacer()
                }.listRowBackground(listBackgroundColor)
            }.foregroundStyle(listTextColor)
        }
    }
}

#Preview {
    @Previewable @State var direction = Direction()
    ModifyDirectionView(component: $direction) { _ in
    
    }
}
