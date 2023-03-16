//
//  ServiceLayer.swift
//  YouTubeClone
//
//  Created by Byron Guzman on 3/15/23.
//

import UIKit
import Foundation

@MainActor
class ServiceLayer {
    static func callService<T: Decodable>(_ requestModel: RequestModel, _ modelType: T.Type) async throws -> T {
        
        var serviceUrl = URLComponents(string: requestModel.getURL())
        serviceUrl?.queryItems = buildQueryItems(params: requestModel.queryItems ?? [:])
        serviceUrl?.queryItems?.append(URLQueryItem(name: "key", value: Constants.apikey))
        
        guard let componentURL = serviceUrl?.url else {
            throw NetworkError.invalidURL
        }
        var request = URLRequest(url: componentURL)
        request.httpMethod = requestModel.httpMethod.rawValue
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.httpResponseError
            }
            if httpResponse.statusCode > 299 {
                throw NetworkError.statusCodeError
            }
            let decoder = JSONDecoder()
            do {
                let decodeData = try decoder.decode(T.self, from: data)
                return decodeData
            } catch {
                throw NetworkError.couldNotDecodeData
            }
        } catch {
            throw NetworkError.generic
        }
    }
    
    static func buildQueryItems(params: [String: String]) -> [URLQueryItem] {
        let items = params.map { URLQueryItem(name: $0, value: $1) }
        return items
    }
}
