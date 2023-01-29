import UIKit

class ProductView: UIView {
    // MARK: - Views
    let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    let productDescription: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .preferredFont(forTextStyle: .title3).bold()
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    // MARK: - Initialization
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setupViewConfiguration()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    // MARK: - ViewCode
extension ProductView: ViewConfiguration {
    public func setupConstraints() {
        makeProductImageConstraints()
        makeProductDescriptionConstraints()
    }

    func buildViewHierarchy() {
        self.addSubview(productImageView)
        self.addSubview(productDescription)
    }

    func makeProductImageConstraints() {
        productImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: .init(80).relatedToScreenHeight),
            productImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.26),
            productImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.26)
        ])

        productImageView.layer.borderWidth = 2
        productImageView.layer.borderColor = UIColor.blue.cgColor
        productImageView.layer.cornerRadius = 10
        productImageView.clipsToBounds = true

    }

    func makeProductDescriptionConstraints() {
        productDescription.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            productDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                    constant: .init(20).relatedToScrenn),
            productDescription.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                         constant: .init(-20).relatedToScrenn),
            productDescription.topAnchor.constraint(equalTo: productImageView.bottomAnchor,
                                                constant: .init(30).relatedToScreenHeight)
        ])
    }
}
