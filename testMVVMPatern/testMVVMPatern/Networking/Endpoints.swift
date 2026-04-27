import Foundation

enum Endpoints {
    static func getProducts() -> URLRequest {
        URLRequest(url: URL(string: "https://fakestoreapi.com/products")!)
    }
}
