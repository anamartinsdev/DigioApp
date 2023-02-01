import UIKit

protocol ProductListConfiguratorProtocol: AnyObject {
    func createModule() -> UIViewController
}

final class ProductListConfigurator: ProductListConfiguratorProtocol {
    func createModule() -> UIViewController {
        let router = ProductListRouter()
        let interactor = ProductListInteractor()
        let presenter = ProductListPresenter(router: router, interactor: interactor)
        interactor.output = presenter
        let viewController = ProductListViewController(presenter: presenter)
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
