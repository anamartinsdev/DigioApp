import UIKit

final class ProductListViewController: UIViewController {
    
    // MARK: - Views
    
    let userTitle: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title2).bold()
        label.textColor = UIColor(named: "thirdColor")
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    let spotlightCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width * 0.91, height: UIScreen.main.bounds.height * 0.25)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(SpotlightCell.self, forCellWithReuseIdentifier: SpotlightCell.reuseIdentifier)
        collection.backgroundColor = .white
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    let cashTitle: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "primaryColor")
        let attributedString = NSMutableAttributedString(string: "digio Cash",
                                                         attributes: [.font: UIFont.boldSystemFont(ofSize: 16)])
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor,
                                      value: UIColor(named: "primaryColor")!,
                                      range: NSRange(location: 0, length: 5))
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor,
                                      value: UIColor(named: "secundaryColor")!,
                                      range: NSRange(location: 5, length: 5))
        label.attributedText = attributedString
        return label
    }()
    
    let bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let productTitle: UILabel = {
        let label = UILabel()
        label.text = "Produtos"
        label.textColor = UIColor(named: "primaryColor")
        label.font = .preferredFont(forTextStyle: .title2).bold()
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    let productsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 20
        layout.itemSize = CGSize(width: UIScreen.main.bounds.height * 0.20, height: UIScreen.main.bounds.height * 0.20)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.reuseIdentifier)
        collection.backgroundColor = .white
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    private let presenter: ProductListPresenterInputProtocol
    
    init(presenter: ProductListPresenterInputProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        setupViewConfiguration()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter.getProducts()
        spotlightCollectionView.delegate = self
        spotlightCollectionView.dataSource = self
        
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
    }
}

extension ProductListViewController: ProductListPresenterOutputProtocol {
    func reloadData() {
        userTitle.text = "Olá \(NSUserName())"
        
        
        spotlightCollectionView.reloadData()
        productsCollectionView.reloadData()
    }
    
    func updateBannerImageView(_ imagePath: String) {
        bannerImageView.downloaded(from: imagePath)
    }
}

// MARK: - ViewCode
extension ProductListViewController: ViewConfiguration {
    
    func setupConstraints() {
        makeUserTitleConstraints()
        makeSpotlightCollectionConstraints()
        makeCashTitleConstraints()
        makeBannerImageConstraints()
        makeProductTitleConstraints()
        makeProductCollectionConstraints()
    }

    func buildViewHierarchy() {
        view.addSubview(userTitle)
        view.addSubview(spotlightCollectionView)
        view.addSubview(cashTitle)
        view.addSubview(bannerImageView)
        view.addSubview(productTitle)
        view.addSubview(productsCollectionView)
    }

    func makeUserTitleConstraints() {
        userTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userTitle.topAnchor.constraint(equalTo: view.topAnchor,
                                           constant: .init(42).relatedToScreenHeight),
            userTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                               constant: .init(20).relatedToScrenn),
            userTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                constant: .init(20).relatedToScrenn),
            userTitle.heightAnchor.constraint(equalToConstant: 24)
        ])
    }

    func makeSpotlightCollectionConstraints() {
        spotlightCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            spotlightCollectionView.topAnchor.constraint(equalTo: userTitle.bottomAnchor,
                                                         constant: .init(32).relatedToScreenHeight),
            spotlightCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                             constant: .init(20).relatedToScrenn),
            spotlightCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                              constant: .init(20).relatedToScrenn),
            spotlightCollectionView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.30)
        ])
    }

    func makeCashTitleConstraints() {
        cashTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cashTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                               constant: .init(20).relatedToScrenn),
            cashTitle.topAnchor.constraint(equalTo: spotlightCollectionView.bottomAnchor,
                                           constant: .init(30).relatedToScreenHeight),
            cashTitle.heightAnchor.constraint(equalToConstant: .init(32).relatedToScreenHeight)
        ])
    }

    func makeBannerImageConstraints() {
        bannerImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bannerImageView.topAnchor.constraint(equalTo: cashTitle.bottomAnchor,
                                                 constant: .init(32).relatedToScreenHeight),
            bannerImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                     constant: .init(20).relatedToScrenn),
            bannerImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.91),
            bannerImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.15)
        ])
        
        bannerImageView.layer.cornerRadius = 10
        bannerImageView.clipsToBounds = true
        
    }

    func makeProductTitleConstraints() {
        productTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            productTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                  constant: .init(20).relatedToScrenn),
            productTitle.topAnchor.constraint(equalTo: bannerImageView.bottomAnchor,
                                              constant: .init(30).relatedToScreenHeight),
            productTitle.heightAnchor.constraint(equalTo: cashTitle.heightAnchor)
        ])
    }

    func makeProductCollectionConstraints() {
        productsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            productsCollectionView.topAnchor.constraint(equalTo: productTitle.bottomAnchor,
                                                        constant: .init(20).relatedToScreenHeight),
            productsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                            constant: .init(20).relatedToScrenn),
            productsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                             constant: .init(20).relatedToScrenn),
            productsCollectionView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.22)
        ])
    }
}

extension ProductListViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == spotlightCollectionView {
            return presenter.numberOfItemsInSpotlightSection()
        } else if collectionView == productsCollectionView {
            return presenter.numberOfItemsInProductsSection()
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == spotlightCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SpotlightCell.reuseIdentifier, for: indexPath) as? SpotlightCell else {
                return UICollectionViewCell()
            }
            let dto = presenter.dtoForSpotlight(index: indexPath.row)
            cell.configure(model: dto)
            
            return cell
        } else if collectionView == productsCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.reuseIdentifier, for: indexPath) as? ProductCell else {
                return UICollectionViewCell()
            }
            let dto = presenter.dtoForProducts(index: indexPath.row)
            cell.configure(model: dto)
            
            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == productsCollectionView {
            presenter.didSelectItemAt(index: indexPath.row)
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
}

