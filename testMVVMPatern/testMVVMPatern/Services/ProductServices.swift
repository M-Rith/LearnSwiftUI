import Foundation

final class OrderService {

    private let api = APIClient()

    func getOrders() async throws -> [Product] {
        let request = Endpoints.getProducts()
        return try await api.request(request)
    }
}
