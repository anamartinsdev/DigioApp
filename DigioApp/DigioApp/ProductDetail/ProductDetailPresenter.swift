import UIKit

final class ProductDetailPresenter {
    weak var viewController: ProductDetailPresenterOutputProtocol?
    var model: ProductsDetail?
    private let router: ProductDetailRouterProtocol
    private let interactor: ProductDetailInteractorInputProtocol
    
    init(router: ProductDetailRouterProtocol,
         interactor: ProductDetailInteractorInputProtocol) {
        self.router = router
        self.interactor = interactor
    }
    
}

extension ProductDetailPresenter: ProductDetailPresenterInputProtocol {
    func getData() {
        viewController?.reloadData()
    }

    func getImageURL() -> String {
        guard let model = model else {
            return ""
        }
        return model.imageURL
    }

    func getDescription() -> String {
        guard let model = model else {
            return ""
        }
    
        return model.description
    }
}

extension ProductDetailPresenter: ProductDetailInteractorOutputProtocol {
    
}
