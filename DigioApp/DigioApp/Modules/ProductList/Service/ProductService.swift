import Foundation

enum ProductService {
    case getProduct
}

extension ProductService: Service {

    var path: String {
        return "/sandbox/products"
    }

    var method: ServiceMethod {
        return .get
    }

    var parameters: [String: Any]? {
        return nil
    }
}
