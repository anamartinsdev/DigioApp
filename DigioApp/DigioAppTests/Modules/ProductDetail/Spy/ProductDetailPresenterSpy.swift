@testable import DigioApp

final class ProductDetailPresenterInputProtocolSpy: ProductDetailPresenterInputProtocol {

    enum CalledMethods: Equatable {
        case getData
        case getImageURL
        case getDescription
    }

    private (set) var calledMethods: [CalledMethods] = []

    func getData() {
        calledMethods.append(.getData)
    }
    
    func getImageURL() -> String {
        calledMethods.append(.getImageURL)
        return ""
    }
    
    func getDescription() -> String {
        calledMethods.append(.getDescription)
        return ""
    }
}

final class ProductDetailPresenterOutputProtocolSpy: ProductDetailPresenterOutputProtocol {

    enum CalledMethods: Equatable {
        case reloadData
    }

    private (set) var calledMethods: [CalledMethods] = []

    func reloadData() {
        calledMethods.append(.reloadData)
    }
}
