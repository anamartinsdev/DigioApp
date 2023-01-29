import UIKit

class ProductViewController: UIViewController {
    // MARK: - Views
    private let productView = ProductView()

    // MARK: - Model
    private var productsDetail: ProductsDetail

    // MARK: - Initialization
    init(model: ProductsDetail) {
        self.productsDetail = model
        super.init(nibName: nil, bundle: nil)
        self.configureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func loadView() {
        view = productView
    }

    func configureView() {
        productView.productImageView.downloaded(from: productsDetail.imageURL)
        productView.productDescription.text = productsDetail.description
        self.navigationItem.title = productsDetail.name
        productView.productImageView.layer.borderColor = productView.productImageView.image?.averageColor?.cgColor
    }
}

