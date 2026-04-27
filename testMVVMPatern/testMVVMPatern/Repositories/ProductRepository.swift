import Foundation

final class ProductRepository {

    private let service = OrderService()

    func getProducts() async throws -> [Product] {
        return try await service.getOrders()
    }
}
