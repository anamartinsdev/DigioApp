@testable import DigioApp

final class ProductListRouterSpy: ProductListRouterProtocol {

    enum CalledMethods: Equatable {
        static func == (lhs: ProductListRouterSpy.CalledMethods, rhs: ProductListRouterSpy.CalledMethods) -> Bool {
            true
        }
        
        case navigateToDetail(product: ProductsDetail)
    }

    private (set) var calledMethods: [CalledMethods] = []

    func navigateToDetail(product: ProductsDetail) {
        calledMethods.append(.navigateToDetail(product: product))
    }
}
