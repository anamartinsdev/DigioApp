import UIKit

final class ProductDetailCell: UITableViewCell {

    // MARK: - Views
    private lazy var productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .subheadline).bold()
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.textColor = UIColor(named: "thirdColor")
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
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        setupViewConfiguration()
        setUpAditionalConfiguration()
        backgroundColor = .white
        layer.shadowPath = UIBezierPath(
                    roundedRect: bounds,
                    cornerRadius: 10
                ).cgPath
    }
    
    func configure(description: String) {
        productDescriptionLabel.text = description
    }
}
    // MARK: - ViewCode
extension ProductDetailCell: ViewConfiguration {
    public func setupConstraints() {
        makeProductDescriptionConstraints()
    }

    func makeProductDescriptionConstraints() {
        productDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            productDescriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            productDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }

    func buildViewHierarchy() {
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
