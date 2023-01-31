@testable import DigioApp

final class ProductListInteractorOutputProtocolSpy: ProductListInteractorOutputProtocol {

    enum CalledMethods: Equatable {
        static func == (lhs: ProductListInteractorOutputProtocolSpy.CalledMethods, rhs: ProductListInteractorOutputProtocolSpy.CalledMethods) -> Bool {
            true
        }
        
        case didLoadError
        case didLoadProducts(products: ProductModel)
    }

    private (set) var calledMethods: [CalledMethods] = []

    func didLoadProducts(products: ProductModel) {
        calledMethods.append(.didLoadProducts(products: products))
    }

    func didLoadError() {
        calledMethods.append(.didLoadError)
    }

}

final class ProductListInteractorInputProtocolSpy: ProductListInteractorInputProtocol {

    enum CalledMethods: Equatable {
        case loadProducts
    }

    private (set) var calledMethods: [CalledMethods] = []

    func loadProducts() {
        calledMethods.append(.loadProducts)
    }
}
