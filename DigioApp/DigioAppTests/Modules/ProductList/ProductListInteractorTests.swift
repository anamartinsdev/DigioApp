import XCTest
@testable import DigioApp

final class ProductListInteractorTests: XCTestCase {
    private var sut: ProductListInteractor!
    private var model: ProductModel!
    let jsonFile = "ProductsResponse"
    let executor = MockExecutor()
    lazy var provider = ServiceProvider<ProductService>(executor: executor)
    private let interactorOutputSpy = ProductListInteractorOutputProtocolSpy()

    override func setUp() {
        super.setUp()
    }

    func test_getProductsFailure() throws {
        sut = ProductListInteractor(provider: provider)
        let sut = try XCTUnwrap(sut)
        sut.output = interactorOutputSpy
        executor.jsonFile = nil
        sut.loadProducts()

        let spotlight = ProductsSpotlight(name: "", bannerURL: "", description: "")
        let detail = ProductsDetail(name: "", imageURL: "", description: "")
        let cash = ProductsCash(title: "", bannerURL: "", description: "")
        model = .init(spotlight: [spotlight], products: [detail], cash: cash)

        XCTAssertEqual(interactorOutputSpy.calledMethods, [])
    }

    func test_getProductsSuccess() throws {
        executor.jsonFile = jsonFile
        sut = ProductListInteractor(provider: provider)

        let sut = try XCTUnwrap(sut)
        sut.output = interactorOutputSpy
        
        sut.loadProducts()

        let spotlight = ProductsSpotlight(name: "", bannerURL: "", description: "")
        let detail = ProductsDetail(name: "", imageURL: "", description: "")
        let cash = ProductsCash(title: "", bannerURL: "", description: "")
        model = .init(spotlight: [spotlight], products: [detail], cash: cash)

        XCTAssertEqual(interactorOutputSpy.calledMethods, [])
    }
}
