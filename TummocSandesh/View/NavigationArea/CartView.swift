//
//  CartView.swift
//  TummocSandesh
//
//  Created by gembali sandesh kumar on 7/25/24.
//

import SwiftUI

struct CartView: View {
    let cart: [Int: Int]
    let toggleCart: (Int) -> Void
    let removeAllItems: () -> Void
    let removeItem: (Int) -> Void
    let items: [Item]

    var body: some View {
        VStack {
            List {
                ForEach(cart.keys.sorted(), id: \.self) { itemId in
                    if let item = items.first(where: { $0.id == itemId }) {
                        HStack {
                            if let imageUrl = URL(string: item.icon), let imageData = try? Data(contentsOf: imageUrl),
                               let uiImage = UIImage(data: imageData) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                            } else {
                                Image(systemName: "photo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                            }

                            VStack(alignment: .leading) {
                                Text(item.name)
                                Text("Price: ₹\(item.price, specifier: "%.2f")")

                                if let quantity = cart[itemId] {
                                    Text("Quantity: \(quantity)")
                                }
                            }

                            Spacer()

                            Button(action: { toggleCart(itemId) }) {
                                Image(systemName: "cart.fill")
                                    .foregroundColor(.blue)
                            }

                            Button(action: { removeItem(itemId) }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
               
                VStack(alignment: .leading, spacing: 10) {
                    Text("Subtotal: ₹\(calculateSubtotal(), specifier: "%.2f")")
                        .font(.headline)
                    Text("Discount (10%): -₹\(calculateDiscount(), specifier: "%.2f")")
                        .font(.headline)
                    Text("Total: ₹\(calculateTotalCartValue(), specifier: "%.2f")")
                        .font(.headline)
                }
                .padding()

                HStack {
                    Button(action: {
                        removeAllItems()
                    }) {
                        Text("Remove All")
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationTitle("Cart")

            Spacer()
           
            Button(action: {
                removeAllItems()
                
                print("Proceeding to checkout")
            }) {
                Text("Checkout")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
    }

    private func calculateSubtotal() -> Double {
        var subtotal = 0.0
        for (itemId, quantity) in cart {
            if let item = items.first(where: { $0.id == itemId }) {
                subtotal += item.price * Double(quantity)
            }
        }
        return subtotal
    }

    private func calculateDiscount() -> Double {
        let subtotal = calculateSubtotal()
        let discount = 0.10 * subtotal
        return discount
    }

    private func calculateTotalCartValue() -> Double {
        let subtotal = calculateSubtotal()
        let discount = calculateDiscount()
        return subtotal - discount
    }
}

#Preview {
    CartView(
        cart: [5501: 2, 5602: 1],
        toggleCart: { itemId in
            
        },
        removeAllItems: {
            
        },
        removeItem: { itemId in
            
        },
        items: [
            Item(id: 5501, name: "Potato Chips", icon: "https://cdn-icons-png.flaticon.com/128/2553/2553691.png", price: 40.00),
            Item(id: 5602, name: "Keventers Thick Shake 60 ml", icon: "https://cdn-icons-png.flaticon.com/128/2405/2405479.png", price: 79.99),
        ]
    )
    .navigationBarTitle("Shopping Cart")
}
