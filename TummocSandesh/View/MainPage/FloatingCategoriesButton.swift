//
//  FloatingCategoriesButton.swift
//  TummocSandesh
//
//  Created by gembali sandesh kumar on 7/25/24.
//

import SwiftUI

struct FloatingCategoriesButton: View {
    let categories: [Category]
    @Binding var selectedCategory: Int?
    @Binding var isCategorySheetPresented: Bool

    var body: some View {
        VStack {
            if isCategorySheetPresented {
                VStack {
                    ForEach(categories) { category in
                        Button(action: {
                            selectedCategory = category.id
                            isCategorySheetPresented.toggle()
                        }) {
                            Text(category.name)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                        }
                    }
                    Button(action: {
                        isCategorySheetPresented.toggle()
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding(12)
                            .background(Color.red)
                            .clipShape(Circle())
                    }
                }
                .frame(width: 200)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 10)
            } else {
                Button(action: {
                    isCategorySheetPresented.toggle()
                }) {
                    Image(systemName: "square.grid.2x2.fill")
                        .foregroundColor(.white)
                        .padding(12)
                        .background(Color.blue)
                        .clipShape(Circle())
                }
            }
        }
        .padding()
    }
}

#Preview {
    FloatingCategoriesButton(
        categories: [
            Category(id: 1, name: "Category 1", items: []),
            Category(id: 2, name: "Category 2", items: []),
        ],
        selectedCategory: .constant(nil),
        isCategorySheetPresented: .constant(false)
    )
}
