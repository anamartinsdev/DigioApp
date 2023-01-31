import UIKit

final class ProductDetailImageCell: UITableViewCell {

    // MARK: - Views
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "empty")
        return imageView
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
    
    func configure(imageURL: String) {
        productImageView.downloaded(from: imageURL)
    }
}
    // MARK: - ViewCode
extension ProductDetailImageCell: ViewConfiguration {
    public func setupConstraints() {
        makeProductImageViewConstraints()
    }

    func makeProductImageViewConstraints() {
        productImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            productImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            productImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            productImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.10)
        ])
    }

    func buildViewHierarchy() {
        contentView.addSubview(productImageView)
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
