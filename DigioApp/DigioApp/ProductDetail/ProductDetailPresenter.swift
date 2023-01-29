import Foundation

final class ProductDetailPresenter {
    weak var viewController: ProductDetailPresenterOutputProtocol?
    private let router: ProductDetailRouterProtocol
    private let interactor: ProductDetailInteractorInputProtocol
    
    init(router: ProductDetailRouterProtocol,
         interactor: ProductDetailInteractorInputProtocol) {
        self.router = router
        self.interactor = interactor
    }
    
}

extension ProductDetailPresenter: ProductDetailPresenterInputProtocol {
    
}

extension ProductDetailPresenter: ProductDetailInteractorOutputProtocol {
    
}
