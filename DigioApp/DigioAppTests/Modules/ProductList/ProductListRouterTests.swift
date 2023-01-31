import XCTest
@testable import DigioApp

final class ProductListRouterTests: XCTestCase {
    private var sut = ProductListRouter()

    override func setUp() {
        super.setUp()
    }

    func test_navigateToDetail() {
        let configurator = ProductListConfigurator()
        let sceneController = configurator.createModule()
        sut.viewController = sceneController
        sut.navigateToDetail(product: .init(name: "", imageURL: "", description: ""))
        XCTAssertEqual(sceneController.navigationController?.viewControllers.count, 2)
    }
}
