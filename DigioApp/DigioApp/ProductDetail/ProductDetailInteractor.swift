import Foundation

final class ProductDetailInteractor {
    weak var output: ProductDetailInteractorOutputProtocol?
    
    private var provider: ServiceProvider<ProductService>?
    
    init(provider: ServiceProvider<ProductService> = ServiceProvider<ProductService>()) {
        self.provider = provider
    }
    
}

extension ProductDetailInteractor: ProductDetailInteractorInputProtocol {
    
}
