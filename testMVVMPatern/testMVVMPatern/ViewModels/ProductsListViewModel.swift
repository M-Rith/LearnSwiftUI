import Foundation

@MainActor
final class ProductListViewModel: ObservableObject {

    @Published var products: [Product] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let repository = ProductRepository()

    func loadProducts() async {
        isLoading = true
        errorMessage = nil

        defer { isLoading = false }

        do {
            let results = try await repository.getProducts()
            self.products = results
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
