import UIKit

protocol ProductDetailConfiguratorProtocol: AnyObject {
    func createModule(model: ProductsDetail) -> UIViewController
}

final class ProductDetailConfigurator: ProductDetailConfiguratorProtocol {
    func createModule(model: ProductsDetail) -> UIViewController {
        let presenter = ProductDetailPresenter(model: model)
        let viewController = ProductDetailViewController(presenter: presenter)
        presenter.viewController = viewController
        
        return viewController
    }
}
