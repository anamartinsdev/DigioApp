//import XCTest
//@testable import DigioApp
//
//final class ProductListInteractorTests: XCTestCase {
//    private var sut: ProductListInteractor!
//    private var model: ProductModel!
//    private let interactorOutputSpy = ProductListInteractorOutputProtocolSpy()
//
//    override func setUp() {
//        super.setUp()
//    }
//
//    func test_getProducts() throws {
//        sut = ProductListInteractor(provider: ServiceProvider<ProductService>())
//        let sut = try XCTUnwrap(sut)
//        sut.output = interactorOutputSpy
//        let spotlight = ProductsSpotlight(name: "", bannerURL: "", description: "")
//        let detail = ProductsDetail(name: "", imageURL: "", description: "")
//        let cash = ProductsCash(title: "", bannerURL: "", description: "")
//        model = .init(spotlight: [spotlight], products: [detail], cash: cash)
////        let exp = expectation(description: "")
//        sut.loadProducts()
//
//        XCTAssertEqual(interactorOutputSpy.calledMethods, [.didLoadProducts(products: model)])
//    }
//}
//
//class ServiceProviderMock: ServiceProvider<T: Service> {
//    override func load() {
//
//    }
//}
