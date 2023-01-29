import Foundation

struct ProductModel: Codable {
    var spotlight: [ProductsSpotlight]
    var products: [ProductsDetail]
    var cash: ProductsCash
}

extension ProductModel {
    init() {
        self.spotlight = []
        self.products = []
        self.cash = .init(title: "", bannerURL: "", description: "")
    }
}

struct ProductsSpotlight: Codable {
    var name: String
    var bannerURL: String
    var description: String
}

struct ProductsDetail: Codable {
    var name: String
    var imageURL: String
    var description: String
}

struct ProductsCash: Codable {
    var title: String
    var bannerURL: String
    var description: String
}
