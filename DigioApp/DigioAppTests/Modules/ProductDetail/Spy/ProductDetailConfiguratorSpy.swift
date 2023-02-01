@testable import DigioApp
import Foundation
import UIKit

final class ProductDetailConfiguratorSpy: ProductDetailConfiguratorProtocol {

    enum CalledMethods: Equatable {
        static func == (lhs: ProductDetailConfiguratorSpy.CalledMethods, rhs: ProductDetailConfiguratorSpy.CalledMethods) -> Bool {
            true
        }
        
        case createModule(model: ProductsDetail)
    }

    private (set) var calledMethods: [CalledMethods] = []

    func createModule(model: ProductsDetail) -> UIViewController {
        calledMethods.append(.createModule(model: model))
        return UIViewController()
    }
}
