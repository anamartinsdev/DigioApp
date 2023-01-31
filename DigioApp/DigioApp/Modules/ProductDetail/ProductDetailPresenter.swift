import UIKit

final class ProductDetailPresenter {
    weak var viewController: ProductDetailPresenterOutputProtocol?
    private let model: ProductsDetail
    
    init(model: ProductsDetail) {
        self.model = model
    }
    
}

extension ProductDetailPresenter: ProductDetailPresenterInputProtocol {
    func getData() {
        viewController?.reloadData()
    }

    func getImageURL() -> String {
        return model.imageURL
    }

    func getDescription() -> String {
        return model.description
    }
}
