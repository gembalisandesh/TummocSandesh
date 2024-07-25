//
//  ItemRowFavView.swift
//  TummocSandesh
//
//  Created by gembali sandesh kumar on 7/25/24.
//

import SwiftUI

struct ItemRowFavView: View {
    let item: Item
    let isFavorite: Bool
    let addToFavorites: (Item) -> Void
    let addToCart: (Item) -> Void

    var body: some View {
        HStack {
            URLImage(url: item.icon)
                .frame(width: 40, height: 40)
                .cornerRadius(8)

            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("₹\(item.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
            }

            Spacer()

            Button(action: { addToFavorites(item) }) {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(isFavorite ? .red : .gray)
                    .padding(8)
                    .background(Color.white)
                    .clipShape(Circle())
            }
            .padding(.leading)

            Button(action: { addToCart(item) }) {
                Image(systemName: "cart")
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color.blue)
                    .clipShape(Circle())
            }
            .padding(.leading)
        }
        .padding()
    }
}

#Preview {
    ItemRowFavView(
        item: Item(id: 1, name: "Sample Item", icon: "https://example.com/icon.png", price: 19.99),
        isFavorite: true,
        addToFavorites: { _ in },
        addToCart: { _ in }
    )
}
