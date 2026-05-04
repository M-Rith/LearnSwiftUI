import Foundation
import SwiftUI

struct orderListView: View {

    @StateObject var viewModel: OrderViewModel

    var body: some View {

        VStack {
            List(viewModel.orders, id: \.id) { order in
                Text(order.name)

            }
            .task {
                await viewModel.getOrdersList()
            }
        }

    }
}
