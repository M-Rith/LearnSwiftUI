import Foundation

enum Size: String, Codable {
    case small = "Small"
    case medium = "Medium"
    case large = "Large"
}

struct Order: Codable, Identifiable, Hashable {
    let id: Int?
    let name: String
    let coffeeName: String
    let total: Double
    let size: Size
}
