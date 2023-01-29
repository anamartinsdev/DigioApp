import Foundation
import Combine

struct ServiceProvider<T: Service> {
    
    private var executor: ServiceExecutor
    var listner: ((ServiceState) -> Void)?
    
    init (executor: ServiceExecutor = Executor()) {
        self.executor = executor
    }
    
    func load(service: T,
              decodeType: ProductModel.Type = ProductModel.self,
              deliverQueue: DispatchQueue = DispatchQueue.main,
              completion: ((Result<ProductModel, CustomError>) -> Void)?) {
        
        executor.execute(service) { response in
            switch response {
            case .success(let data):
                if let resp = try? JSONDecoder().decode(ProductModel.self, from: data) {
                    deliverQueue.async {
                        completion?(.success(resp))
                    }
                }
            case .failure(let error): deliverQueue.async {
                completion?(.failure(CustomError(error: error)))
            }
            }
        }
    }
}
