//
//  CategoryPickerView.swift
//  CategoryPickerView
//
//  Created by chandresh patel on 11/09/24.
//

import SwiftUI

struct CategoryPickerView: View {
    @Binding var selectedCategory: String
    var categories: [String]
    var onCategoryChange: (String) -> Void

    var body: some View {
        Picker("Category", selection: $selectedCategory) {
            ForEach(categories, id: \.self) {
                Text($0.capitalized)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
        .onChange(of: selectedCategory, perform: { newCategory in
            onCategoryChange(newCategory)
        })
    }
}
