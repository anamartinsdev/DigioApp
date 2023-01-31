import UIKit

final class SpotlightCell: UICollectionViewCell {
    // MARK: - Model

    // MARK: - Views
    private let bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override func layoutSubviews() {
        setupViewConfiguration()
        setUpAditionalConfiguration()
    }

    func configure(model: ProductsSpotlight) {
        bannerImageView.downloaded(from: model.bannerURL)
    }
}
    // MARK: - ViewCode
extension SpotlightCell: ViewConfiguration {
    public func setupConstraints() {
        bannerImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            bannerImageView.topAnchor.constraint(equalTo: self.topAnchor),
            bannerImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bannerImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bannerImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    func buildViewHierarchy() {
        self.addSubview(bannerImageView)
    }

    func setUpAditionalConfiguration() {
        bannerImageView.layer.cornerRadius = 20
        bannerImageView.clipsToBounds = true

        layer.shadowRadius = 2.5
        layer.shadowOpacity = 0.20
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 2)

        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
}
    // MARK: - Reuse Identifier
extension SpotlightCell {
    class var reuseIdentifier: String {
        String(describing: self)
    }
}
