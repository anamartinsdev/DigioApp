import XCTest
@testable import DigioApp

final class ProductDetailConfiguratorTests: XCTestCase {
    private var sut: ProductDetailConfigurator!

    override func setUp() {
        super.setUp()
    }

    func test_getData() {
        sut = ProductDetailConfigurator()
        guard let sut = sut else {
            XCTFail()
            return
        }

        let expectedResult = sut.createModule(model: .init(name: "", imageURL: "", description: ""))
        XCTAssertNotNil(expectedResult)
    }
}
