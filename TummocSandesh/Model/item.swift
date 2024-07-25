import Foundation

struct Category: Identifiable {
    let id: Int
    let name: String
    let items: [Item]
}

struct Item: Identifiable {
    let id: Int
    let name: String
    let icon: String
    let price: Double
}
