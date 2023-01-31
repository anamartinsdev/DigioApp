import XCTest
@testable import DigioApp

final class ProductDetailPresenterTests: XCTestCase {
    private var sut: ProductDetailPresenter!
    private var model: ProductsDetail!
    private let viewControllerSpy = ProductDetailPresenterOutputProtocolSpy()

    override func setUp() {
        super.setUp()
    }

    func test_getData() {
        sut = ProductDetailPresenter(model: .init(name: "", imageURL: "", description: ""))
        sut.viewController = viewControllerSpy
        guard let sut = sut else {
            XCTFail()
            return
        }

        sut.getData()
        XCTAssertEqual(viewControllerSpy.calledMethods, [.reloadData])
    }

    func test_getDescription() {
        sut = ProductDetailPresenter(model: .init(name: "", imageURL: "", description: "Description"))
        sut.viewController = viewControllerSpy
        guard let sut = sut else {
            XCTFail()
            return
        }

        let expectedResult = sut.getDescription()
        XCTAssertEqual(expectedResult, "Description")
    }

    func test_getImageURL() {
        sut = ProductDetailPresenter(model: .init(name: "", imageURL: "www.google.com", description: ""))
        sut.viewController = viewControllerSpy
        guard let sut = sut else {
            XCTFail()
            return
        }

        let expectedResult = sut.getImageURL()
        XCTAssertEqual(expectedResult, "www.google.com")
    }
}
