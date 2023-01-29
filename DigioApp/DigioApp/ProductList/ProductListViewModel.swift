import Foundation
import Combine

final class ProductListViewModel {
    
    enum State {
        case loading, empty
        case error(CustomError)
    }
    
    //MARK: - Variables
    
    var listProduct: ProductModel = ProductModel()
    var currentState: State = State.empty

    private var provider: ServiceProvider<ProductService>?

    //MARK: - Initializer

    init(provider: ServiceProvider<ProductService> = ServiceProvider<ProductService>()) {
        self.provider = provider
    }

    func resetData() {
        currentState = State.empty
    }

    func loadProducts(limit: String) {
        provider?.load(service: .getProduct, completion: { [weak self] result in self?.currentState = .empty
            switch result {
            case .success(let response):
                self?.currentState = .loading
                self?.listProduct = response
            case .failure(let error):
                self?.currentState = .error(error)
            }
        })
    }
}
