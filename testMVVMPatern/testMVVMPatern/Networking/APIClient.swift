import Foundation

struct APIClient {

    func request<T: Decodable>(_ endpoint: URLRequest) async throws -> T {

        let (data, response) = try await URLSession.shared.data(for: endpoint)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            throw APIError.invalidStatusCode(httpResponse.statusCode)
        }

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw APIError.decodingError
        }
    }
}
