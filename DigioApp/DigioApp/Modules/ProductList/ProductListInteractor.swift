import Foundation

final class ProductListInteractor {
    
    weak var output: ProductListInteractorOutputProtocol?
    
    private var provider: ServiceProvider<ProductService>?
    
    init(provider: ServiceProvider<ProductService> = ServiceProvider<ProductService>()) {
        self.provider = provider
    }
    
}

extension ProductListInteractor: ProductListInteractorInputProtocol {
    
    func loadProducts() {
        provider?.load(service: .getProduct, completion: { [weak self] result in
            switch result {
            case .success(let response):
                print(response)
                DispatchQueue.main.async { [weak self] in
                    self?.output?.didLoadProducts(products: response)
                }
            case .failure:
                DispatchQueue.main.async { [weak self] in
                    self?.output?.didLoadError()
                }
            }
        })
    }
}
