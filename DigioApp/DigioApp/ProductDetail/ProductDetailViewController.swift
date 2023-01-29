import Foundation
import UIKit

final class ProductDetailViewController: UIViewController {
    private let presenter: ProductDetailPresenterInputProtocol
    
    init(presenter: ProductDetailPresenterInputProtocol){
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension ProductDetailViewController: ProductDetailPresenterOutputProtocol {
    
}
