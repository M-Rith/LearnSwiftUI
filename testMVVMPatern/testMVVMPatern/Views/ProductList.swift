struct ProductList: View {

    @StateObject private var viewModel = ProductListViewModel()

    var body: some View {
        List(viewModel.products) { product in
            Text(product.name)
        }
        .onAppear {
            task {
                await viewModel.loadProducts()
            }
        }
    }
}
