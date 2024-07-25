
import SwiftUI


struct ItemDetailView: View {
    let item: Item
    let addToFavorites: () -> Void
    let addToCart: (Binding<Int>) -> Void
    let isFavorite: Bool

    @State private var quantity: Int = 1

    var body: some View {
        VStack {
            URLImage(url: item.icon)
                .frame(width: 100, height: 100)
                .cornerRadius(16)

            Text(item.name)
                .font(.title)
                .padding()

            Text("₹\(item.price, specifier: "%.2f")")
                .font(.headline)
                .foregroundColor(.secondary)
                .padding()

            HStack {
                Button(action: addToFavorites) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .imageScale(.large)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }

               
                        .padding()

                Button(action: {
                    addToCart(Binding.constant(quantity))
                }) {
                    Image(systemName: "cart")
                        .imageScale(.large)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
            }
            .padding()
        }
        .navigationTitle(item.name)
    }
}
#Preview {
    ItemDetailView(
        item: Item(id: 1, name: "Sample Item", icon: "https://example.com/icon.png", price: 19.99),
        addToFavorites: {},
        addToCart: { _ in },
        isFavorite: true
    )
}
