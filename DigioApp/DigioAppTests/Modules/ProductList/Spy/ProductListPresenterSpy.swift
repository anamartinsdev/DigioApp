@testable import DigioApp

final class ProductListPresenterInputProtocolSpy: ProductListPresenterInputProtocol {
    func getProducts() {
        calledMethods.append(.getProducts)
    }
    
    func numberOfItemsInSpotlightSection() -> Int {
        calledMethods.append(.numberOfItemsInSpotlightSection)
        return 1
    }
    
    func numberOfItemsInProductsSection() -> Int {
        calledMethods.append(.numberOfItemsInProductsSection)
        return 1
    }
    
    func dtoForSpotlight(index: Int) -> ProductsSpotlight {
        calledMethods.append(.dtoForSpotlight(index: index))
        return .init(name: "", bannerURL: "", description: "")
    }
    
    func dtoForProducts(index: Int) -> ProductsDetail {
        calledMethods.append(.dtoForProducts(index: index))
        return .init(name: "", imageURL: "", description: "")
    }
    
    func didSelectItemAt(index: Int) {
        calledMethods.append(.didSelectItemAt(index: index))
    }

    enum CalledMethods: Equatable {
        case getProducts
        case numberOfItemsInSpotlightSection
        case numberOfItemsInProductsSection
        case dtoForSpotlight(index: Int)
        case dtoForProducts(index: Int)
        case didSelectItemAt(index: Int)
    }

    private (set) var calledMethods: [CalledMethods] = []
}

final class ProductListPresenterOutputProtocolSpy: ProductListPresenterOutputProtocol {

    enum CalledMethods: Equatable {
        case reloadData
        case updateBannerImageView(_ imagePath: String)
    }

    private (set) var calledMethods: [CalledMethods] = []

    func updateBannerImageView(_ imagePath: String) {
        calledMethods.append(.updateBannerImageView(imagePath))
    }

    func reloadData() {
        calledMethods.append(.reloadData)
    }
}
