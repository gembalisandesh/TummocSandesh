//
//  URLImage.swift
//  TummocSandesh
//
//  Created by gembali sandesh kumar on 7/25/24.
//

import SwiftUI

struct URLImage: View {
    let url: String

    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
            case .failure:
                Image(systemName: "photo")
                    .imageScale(.large)
                    .foregroundColor(.gray)
            case .empty:
                Image(systemName: "photo")
                    .imageScale(.large)
                    .foregroundColor(.gray)
            @unknown default:
                EmptyView()
            }
        }
        .frame(width: 40, height: 40)
        .cornerRadius(8)
    }
}
