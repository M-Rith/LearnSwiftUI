import Foundation

@MainActor
class OrderViewModel: ObservableObject {

    let orderService: OrderService

    init(orderService: OrderService) {
        self.orderService = orderService
    }

    @Published var orders: [Order] = []

    func getOrdersList() async {
        do {
            let orders = try await orderService.getOrders()
            self.orders = orders
        } catch {
            print(error)
        }
    }

}
