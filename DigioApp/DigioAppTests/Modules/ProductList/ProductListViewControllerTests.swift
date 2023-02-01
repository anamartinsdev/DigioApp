import XCTest
@testable import DigioApp

final class ProductListViewControllerTests: XCTestCase {
    private var sut: ProductListViewController!
    private let presenterSpy = ProductListPresenterInputProtocolSpy()

    override func setUp() {
        super.setUp()
    }

    func test_viewDidLoad() {
        sut = ProductListViewController(presenter: presenterSpy)
        
        guard let sut = sut else {
            XCTFail("Sut could not be nil")
            return
        }
        sut.viewDidLoad()
        XCTAssertEqual(presenterSpy.calledMethods, [.getProducts, .getProducts])
    }
}
