protocol ProductListPresenterInputProtocol: AnyObject {
    func getProducts()
    func numberOfItemsInSpotlightSection() -> Int
    func numberOfItemsInProductsSection() -> Int
    func dtoForSpotlight(index: Int) -> ProductsSpotlight
    func dtoForProducts(index: Int) ->  ProductsDetail
    func didSelectItemAt(index: Int) 
}

protocol ProductListPresenterOutputProtocol: AnyObject {
    func reloadData()
}

protocol ProductListInteractorInputProtocol: AnyObject {
    func loadProducts()
}

protocol ProductListInteractorOutputProtocol: AnyObject {
    func didLoadProducts(products: ProductModel)
    func didLoadError()
}

protocol ProductListRouterProtocol: AnyObject {
    func navigateToDetail(product: ProductsDetail)
}



