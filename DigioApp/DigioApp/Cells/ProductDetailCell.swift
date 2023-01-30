import UIKit

final class ProductDetailCell: UITableViewCell {

    // MARK: - Views
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "noImage")
        return imageView
    }()

    private lazy var productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title2).bold()
        label.numberOfLines = 0
        label.backgroundColor = .green
        label.textAlignment = .left
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        setupViewConfiguration()
        setUpAditionalConfiguration()
        backgroundColor = .white
        layer.shadowPath = UIBezierPath(
                    roundedRect: bounds,
                    cornerRadius: 10
                ).cgPath
    }
    
    func configure(imageURL: String, description: String) {
        productImageView.downloaded(from: imageURL)
        productDescriptionLabel.text = description
    }
}
    // MARK: - ViewCode
extension ProductDetailCell: ViewConfiguration {
    public func setupConstraints() {
        makeProductImageViewConstraints()
        makeProductDescriptionConstraints()
    }

    func makeProductImageViewConstraints() {
        productImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            productImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            productImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            productImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.10)
        ])
    }

    func makeProductDescriptionConstraints() {
        productDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            productDescriptionLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor),
            productDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                               constant: .init(20)),
            productDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                constant: .init(20)),
            productDescriptionLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

    func buildViewHierarchy() {
        contentView.addSubview(productImageView)
        contentView.addSubview(productDescriptionLabel)
    }

    func setUpAditionalConfiguration() {
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true

        layer.cornerRadius = 10
        layer.masksToBounds = false

        layer.shadowRadius = 2.5
        layer.shadowOpacity = 0.20
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 2)

        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
}

