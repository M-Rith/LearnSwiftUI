final class ProductListViewModel: ObservableObject {

    @Published var products: [Product] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let repository = ProductRepository()

    func loadProducts() async {
        isLoading = true
        errorMessage = nil

        do {
            products = try await repository.getProducts()
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
