protocol ProductDetailPresenterInputProtocol: AnyObject {
    func getData()
    func getImageURL() -> String
    func getDescription() -> String
}

protocol ProductDetailPresenterOutputProtocol: AnyObject {
    func reloadData()
}

protocol ProductDetailInteractorInputProtocol: AnyObject {
    
}

protocol ProductDetailInteractorOutputProtocol: AnyObject {
    
}

protocol ProductDetailRouterProtocol: AnyObject {
    
}


