import SwiftUI

struct ProductList: View {

    @StateObject private var viewModel = ProductListViewModel()

    var body: some View {
        List(viewModel.products) { product in
            Text(product.title)
        }
        .listStyle(.plain)
        .onAppear {
            Task {
                await viewModel.loadProducts()
            }
        }
        .refreshable {
            await viewModel.loadProducts()
        }
    }
}
