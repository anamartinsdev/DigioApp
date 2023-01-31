import XCTest
import SnapshotTesting
@testable import DigioApp

final class ProductDetailImageCellSnapshotTests: XCTestCase {
      
    func test_ConfigureCell() {
        let cell = ProductDetailImageCell(frame: .init(x: 0, y: 0, width: 128, height: 48))
        cell.configure(imageURL: "")
        let result = verifySnapshot(matching: cell,
                                    as: .image,
                                    named: "Default",
                                    testName: "ProductDetailImageCell")
        
        
        XCTAssertNil(result)
    }
}
