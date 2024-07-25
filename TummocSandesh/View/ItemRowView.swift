//
//  temRowView.swift
//  TummocSandesh
//
//  Created by gembali sandesh kumar on 7/25/24.
//

import SwiftUI

struct ItemRowView: View {
    let item: Item
    let isFavorite: Bool
    let addToFavorites: () -> Void
    let addToCart: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .topLeading) {
                AsyncImage(url: URL(string: item.icon)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 80)
                } placeholder: {
                    ProgressView()
                        .frame(height: 80)
                }
                .background(Color.white)
                .cornerRadius(12)
                
                Button(action: addToFavorites) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(.red)
                        .padding(6)
                        .background(Color.white)
                        .clipShape(Circle())
                }
                .padding(6)
                .padding(.leading, 40)
                .padding(.top, 1)
            }
            
            Text(item.name)
                .font(.headline)
                .padding(.top, 4)
            
            Text("₹\(item.price, specifier: "%.0f") /kg")
                .font(.subheadline)
                .foregroundColor(.black)
                .padding(.top, 2)
            
            Button(action: addToCart) {
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color.orange)
                    .cornerRadius(6)
            }
            .padding(.bottom, 8)
        }
        .padding(10)
        .background(Color(UIColor.white))
        .cornerRadius(12)
        .shadow(radius: 3)
        .frame(width: 140, height: 220)
    }
}


#Preview {
    ItemRowView(
        item: Item(id: 1, name: "Sample Item", icon: "https://via.placeholder.com/100", price: 100.0),
        isFavorite: true,
        addToFavorites: {},
        addToCart: {}
    )
}
