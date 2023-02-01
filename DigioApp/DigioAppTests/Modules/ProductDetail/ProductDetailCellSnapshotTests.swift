import XCTest
import SnapshotTesting
@testable import DigioApp

final class ProductDetailCellSnapshotTests: XCTestCase {

    func test_ConfigureCell() {
        let cell = ProductDetailCell(frame: .init(x: 0, y: 0, width: 128, height: 48))
        cell.configure(description: "Testes")
        let result = verifySnapshot(matching: cell,
                                    as: .image,
                                    named: "Default",
                                    testName: "ProductDetailCell")

        XCTAssertNil(result)
    }
}
