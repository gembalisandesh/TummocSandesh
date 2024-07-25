//
//  MainPageViewViewModel.swift
//  TummocSandesh
//
//  Created by gembali sandesh kumar on 7/25/24.
//

import SwiftUI
import Foundation

final class MainPageViewViewModel: ObservableObject {
    @Published private var favorites: Set<Int> = []
    @Published private var cart: [Int: Int] = [:]
    @Published var selectedCategory: Int?
    @Published var isCategorySheetPresented: Bool = false
    @Published var isCreatorDetailsSheetPresented: Bool = false

    func toggleFavorite(_ item: Item) {
        if favorites.contains(item.id) {
            favorites.remove(item.id)
        } else {
            favorites.insert(item.id)
        }
    }

    func incrementCart(_ itemId: Int) {
        if let currentQuantity = cart[itemId] {
            cart[itemId] = currentQuantity + 1
        } else {
            cart[itemId] = 1
        }
    }

    func calculateOffset(for index: Int) -> Int? {
        return index
    }

    func removeAllItemsFromCart() {
        cart.removeAll()
    }

    func removeItemFromCart(_ itemId: Int) {
        cart[itemId] = nil
    }
    
    func leadingButtons(isCreatorDetailsSheetPresented: Binding<Bool>) -> some View {
        HStack {
            Button(action: {
                isCreatorDetailsSheetPresented.wrappedValue.toggle()
            }) {
                Image(systemName: "line.horizontal.3")
                    .imageScale(.large)
                    .foregroundColor(.black)
            }
        }
    }

    func listSection(scrollView: ScrollViewProxy, categories: [Category], selectedCategory: Binding<Int?>) -> some View {
        List {
            ForEach(categories) { category in
                Section(header: Text(category.name).id(category.id)) {
                    self.categoryScrollView(category: category)
                }
            }
        }
        .onChange(of: selectedCategory.wrappedValue) {
            let newCategoryID = selectedCategory.wrappedValue

            withAnimation {
                guard let index = categories.firstIndex(where: { $0.id == newCategoryID }) else {
                    return
                }

                if let offset = self.calculateOffset(for: index) {
                    scrollView.scrollTo(offset)
                }
            }
        }
    }

    private func categoryScrollView(category: Category) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(category.items) { item in
                    NavigationLink(destination: ItemDetailView(item: item,
                                                               addToFavorites: { self.toggleFavorite(item) },
                                                               addToCart: { _ in self.incrementCart(item.id) },
                                                               isFavorite: self.favorites.contains(item.id))) {
                        ItemRowView(item: item,
                                    isFavorite: self.favorites.contains(item.id),
                                    addToFavorites: { self.toggleFavorite(item) },
                                    addToCart: { self.incrementCart(item.id) })
                    }
                    .frame(width: 140) // Adjust the width to match ItemRowView
                }
            }
            .padding(.horizontal, 10)
        }
    }

    func floatingButton(categories: [Category], selectedCategory: Binding<Int?>, isCategorySheetPresented: Binding<Bool>) -> some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                FloatingCategoriesButton(categories: categories, selectedCategory: selectedCategory, isCategorySheetPresented: isCategorySheetPresented)
                    .padding()
            }
        }
    }

    func addToCart(_ item: Item) {
        incrementCart(item.id)
    }

    func trailingButtons(categories: [Category]) -> some View {
        HStack {
            NavigationLink(destination: FavoritesView(
                favorites: self.favorites,
                items: categories.flatMap { $0.items },
                toggleFavorite: self.toggleFavorite,
                addToCart: { item in self.addToCart(item) }  // Add this closure
            )) {
                Image(systemName: "heart.fill")
                    .imageScale(.large)
                    .foregroundColor(.black)
            }
            NavigationLink(destination: CartView(
                cart: self.cart,
                toggleCart: self.incrementCart,
                removeAllItems: self.removeAllItemsFromCart,
                removeItem: self.removeItemFromCart,
                items: categories.flatMap { $0.items }
            )) {
                Image(systemName: "cart.fill")
                    .imageScale(.large)
                    .foregroundColor(.black)
            }
        }
    }

    func calculateTotalCartValue(cart: [Int: Int], items: [Item]) -> String {
        var totalValue = 0.0
        for (itemId, quantity) in cart {
            if let item = items.first(where: { $0.id == itemId }) {
                totalValue += item.price * Double(quantity)
            }
        }

        return String(format: "₹%.2f", totalValue)
    }
}
