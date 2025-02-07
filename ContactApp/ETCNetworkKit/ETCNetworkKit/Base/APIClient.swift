//
//  APIClient.swift
//  ETCNetworkKit
//
//  Created by Emre Tanrısever on 7.02.2025.
//

import Foundation

public protocol NetworkRequestable {
    func send<T: Decodable>(urlRequest: URLRequest, completion: @escaping(Result<T, NetworkError>) -> Void)
}

public class APIClient: NetworkRequestable {
    
    private let urlSession: URLSession
    
    public init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    public func send<T>(urlRequest: URLRequest, completion: @escaping (Result<T, NetworkError>) -> Void) where T : Decodable {
        urlSession.dataTask(with: urlRequest) { data, response, error in
            if error != nil {
                completion(.failure(.error(error?.localizedDescription)))
            }
            
            if let responseStatus = response as? HTTPURLResponse {
                switch responseStatus.statusCode {
                case 200...299:
                    guard let data = data else {
                        completion(.failure(.noData))
                        return
                    }
                    
                    guard let decodedData = self.decodeData(type: T.self, data: data) else {
                        completion(.failure(.decodeError))
                        return
                    }
                    
                    completion(.success(decodedData))
                case 400:
                    completion(.failure(.badRequest))
                default:
                    completion(.failure(.unknownResponseCode))
                }
            }
        }.resume()
    }
    
    private func decodeData<T: Decodable>(type: T.Type, data: Data) -> T? {
        do {
            return try JSONDecoder().decode(type.self, from: data)
        } catch {
            return nil
        }
    }
}
