import UIKit

final class ProductDetailViewController: UIViewController {
    
    // MARK: - Views

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProductDetailCell.self,
                           forCellReuseIdentifier: "\(ProductDetailCell.self)")
        tableView.register(ProductDetailImageCell.self,
                           forCellReuseIdentifier: "\(ProductDetailImageCell.self)")
        return tableView
    }()
    
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
        view.backgroundColor = .white
        setupViewConfiguration()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationItem.backButtonTitle = ""
        presenter.getData()
    }
    
}

extension ProductDetailViewController: ProductDetailPresenterOutputProtocol {
    func reloadData() {
        tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate && UITableViewDataSource
extension ProductDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 140
        } else {
            return 400
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.layoutIfNeeded()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProductDetailImageCell.self)", for: indexPath) as? ProductDetailImageCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            cell.configure(imageURL: presenter.getImageURL())
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProductDetailCell.self)", for: indexPath) as? ProductDetailCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            cell.configure(description: presenter.getDescription())
            
            return cell
        }
    }
}

// MARK: - ViewCode
extension ProductDetailViewController: ViewConfiguration {
    public func setupConstraints() {
        makeTableViewConstraints()
    }

    func buildViewHierarchy() {
        view.addSubview(tableView)
    }

    func makeTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.9),
            tableView.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.9)
        ])
    }
}
