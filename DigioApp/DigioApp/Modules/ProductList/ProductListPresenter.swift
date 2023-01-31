import UIKit

final class ProductListPresenter {
    weak var viewController: ProductListPresenterOutputProtocol?
    private let router: ProductListRouterProtocol
    private let interactor: ProductListInteractorInputProtocol
    private var model: ProductModel?
    
    init(router: ProductListRouterProtocol,
         interactor: ProductListInteractorInputProtocol) {
        self.router = router
        self.interactor = interactor
    }
}

extension ProductListPresenter: ProductListPresenterInputProtocol {
    
    func getProducts() {
        interactor.loadProducts()
    }

    func numberOfItemsInProductsSection() -> Int {
        guard let model = model else {
            return 0
        }
        return model.products.count
    }

    func numberOfItemsInSpotlightSection() -> Int {
        guard let model = model else {
            return 0
        }
        return model.spotlight.count
    }
    
    func dtoForSpotlight(index: Int) -> ProductsSpotlight {
        guard let model = model else {
            return .init(name: "", bannerURL: "", description: "")
        }
        return model.spotlight[index]
    }
    
    func dtoForProducts(index: Int) ->  ProductsDetail {
        guard let model = model else {
            return .init(name: "", imageURL: "", description: "")
        }
        return model.products[index]
    }
    
    func didSelectItemAt(index: Int) {
        guard let model = model else {
            return
        }
        router.navigateToDetail(product: model.products[index])
    }
}

extension ProductListPresenter: ProductListInteractorOutputProtocol {
    func didLoadError() {
        
    }
    
    func didLoadProducts(products: ProductModel) {
        self.model = products
        viewController?.updateBannerImageView(products.cash.bannerURL)
        viewController?.reloadData()
    }
}
