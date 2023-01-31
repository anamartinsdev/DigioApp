import XCTest
@testable import DigioApp

final class ProductDetailViewControllerTests: XCTestCase {
    private var sut: ProductDetailViewController!
    private let presenterSpy = ProductDetailPresenterInputProtocolSpy()

    override func setUp() {
        super.setUp()
    }

    func test_viewDidLoad() {
        sut = ProductDetailViewController(presenter: presenterSpy)
        
        guard let sut = sut else {
            XCTFail()
            return
        }
        sut.viewDidLoad()
        XCTAssertEqual(presenterSpy.calledMethods, [])
    }

    func test_viewWillAppear() {
        sut = ProductDetailViewController(presenter: presenterSpy)
        
        guard let sut = sut else {
            XCTFail()
            return
        }

        sut.viewWillAppear(false)
        XCTAssertEqual(presenterSpy.calledMethods, [.getData])
    }
}
