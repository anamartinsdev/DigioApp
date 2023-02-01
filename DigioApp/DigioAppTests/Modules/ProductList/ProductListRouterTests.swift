import XCTest
@testable import DigioApp

final class ProductListRouterTests: XCTestCase {
    private var sut = ProductListRouter()

    override func setUp() {
        super.setUp()
    }

    func test_navigateToDetail() {
        let configurator = ProductListConfigurator()
        sut.viewController = configurator.createModule()
        let navigationControllerSpy = NavigationControllerSpy(rootViewController: sut.viewController!)
        sut.navigateToDetail(product: .init(name: "", imageURL: "", description: ""))
        XCTAssertTrue(navigationControllerSpy.pushViewControllerCalled)
    }
}
