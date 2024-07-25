import SwiftUI

struct FavoritesView: View {
    @State var favorites: Set<Int>
    let items: [Item]
    let toggleFavorite: (Item) -> Void
    let addToCart: (Item) -> Void

    var body: some View {
        List {
            ForEach(favorites.sorted(), id: \.self) { itemId in
                if let item = items.first(where: { $0.id == itemId }) {
                    ItemRowFavView(
                        item: item,
                        isFavorite: true,
                        addToFavorites: { item in
                            toggleFavorite(item)
                            // Remove item from favorites if unfavorited
                            if !favorites.contains(item.id) {
                                favorites.remove(item.id)
                            }
                        },
                        addToCart: { item in
                            addToCart(item)
                            // Remove item from favorites if added to cart
                            favorites.remove(item.id)
                        }
                    )
                }
            }
        }
        .navigationTitle("Favorites")
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static let sampleFavorites: Set<Int> = [5501, 5602, 5703]
    static let sampleItems: [Item] = [
        Item(id: 5501, name: "Potato Chips", icon: "https://cdn-icons-png.flaticon.com/128/2553/2553691.png", price: 40.00),
        Item(id: 5602, name: "Keventers Thick Shake 60 ml", icon: "https://cdn-icons-png.flaticon.com/128/2405/2405479.png", price: 79.99),
        Item(id: 5703, name: "Shine Detergent Powder 1 kg", icon: "https://cdn-icons-png.flaticon.com/128/2553/2553642.png", price: 300.00),
    ]

    static var previews: some View {
        FavoritesView(
            favorites: sampleFavorites,
            items: sampleItems,
            toggleFavorite: { _ in },
            addToCart: { _ in }
        )
    }
}