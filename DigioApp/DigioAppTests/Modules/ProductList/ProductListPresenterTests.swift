import XCTest
@testable import DigioApp

final class ProductListPresenterTests: XCTestCase {
    private var sut: ProductListPresenter!
    private var model: ProductsDetail!
    private let viewControllerSpy = ProductListPresenterOutputProtocolSpy()
    private let routerSpy = ProductListRouterSpy()
    private let interactorSpy = ProductListInteractorInputProtocolSpy()

    override func setUp() {
        super.setUp()
    }

    func test_getProducts() {
        sut = ProductListPresenter(router: routerSpy, interactor: interactorSpy)
        sut.viewController = viewControllerSpy
        guard let sut = sut else {
            XCTFail()
            return
        }

        sut.getProducts()
        XCTAssertEqual(interactorSpy.calledMethods, [.loadProducts])
    }

    func test_didLoadProducts() {
        sut = ProductListPresenter(router: routerSpy, interactor: interactorSpy)
        sut.viewController = viewControllerSpy
        guard let sut = sut else {
            XCTFail()
            return
        }

        sut.didLoadProducts(products: .init())
        XCTAssertEqual(viewControllerSpy.calledMethods, [.updateBannerImageView(""), .reloadData])
    }

    func test_didSelectItemAt() {
        sut = ProductListPresenter(router: routerSpy, interactor: interactorSpy)
        sut.viewController = viewControllerSpy
        guard let sut = sut else {
            XCTFail()
            return
        }
        sut.didLoadProducts(products: makeResponse())
        sut.didSelectItemAt(index: 0)
        XCTAssertEqual(routerSpy.calledMethods, [.navigateToDetail(product: .init(name: "", imageURL: "", description: ""))])
    }

    private func makeResponse() -> ProductModel {
        let spotlight: [ProductsSpotlight] = [.init(name: "", bannerURL: "", description: "")]
        let products: [ProductsDetail] = [.init(name: "", imageURL: "", description: "")]
        let cash: ProductsCash = .init(title: "", bannerURL: "", description: "")
        
        return ProductModel(spotlight: spotlight, products: products, cash: cash)
    }
}
