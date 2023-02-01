import UIKit

final class ProductListRouter {
    weak var viewController: UIViewController?
}

extension ProductListRouter: ProductListRouterProtocol {
    func navigateToDetail(product: ProductsDetail) {
        let configurator = ProductDetailConfigurator()
        let productViewController = configurator.createModule(model: product)
        viewController?.navigationController?.pushViewController(productViewController, animated: true)
    }
}
