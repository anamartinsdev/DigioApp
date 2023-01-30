import UIKit

protocol ProductDetailConfiguratorProtocol: AnyObject {
    func createModule(model: ProductsDetail) -> UIViewController
}

final class ProductDetailConfigurator: ProductDetailConfiguratorProtocol {
    func createModule(model: ProductsDetail) -> UIViewController {
        let router = ProductDetailRouter()
        let interactor = ProductDetailInteractor()
        let presenter = ProductDetailPresenter(router: router, interactor: interactor)
        interactor.output = presenter
        let viewController = ProductDetailViewController(presenter: presenter)
        presenter.viewController = viewController
        presenter.model = model
        router.viewController = viewController
        
        return viewController
    }
}
