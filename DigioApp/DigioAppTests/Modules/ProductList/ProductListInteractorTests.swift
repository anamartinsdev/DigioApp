import XCTest
@testable import DigioApp

final class ProductListInteractorTests: XCTestCase {
    private var sut: ProductListInteractor!
    private var model: ProductModel!
    private let interactorSpy = ProductListInteractorOutputProtocolSpy()

    override func setUp() {
        super.setUp()
    }

    func test_getProducts() {
        sut = ProductListInteractor(provider: ServiceProvider<ProductService>())
        guard let sut = sut else {
            XCTFail("Sut could not be nil")
            return
        }
    
        let spotlight = ProductsSpotlight(name: "", bannerURL: "", description: "")
        let detail = ProductsDetail(name: "", imageURL: "", description: "")
        let cash = ProductsCash(title: "", bannerURL: "", description: "")
        model = .init(spotlight: [spotlight], products: [detail], cash: cash)

        sut.loadProducts()

        XCTAssertEqual(interactorSpy.calledMethods, [.didLoadProducts(products: model)])
    }
}
