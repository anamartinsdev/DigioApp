import UIKit

extension UIImageView {
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else {
            return
        }
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let data = data, error == nil,
                let image = UIImage(data: data)
            else {
                return
            }

            DispatchQueue.main.async { [weak self] in
                self?.image = image
            }
        }.resume()
    }
}
