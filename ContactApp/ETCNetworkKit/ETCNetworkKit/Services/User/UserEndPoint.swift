//
//  UserEndPoint.swift
//  ETCNetworkKit
//
//  Created by Emre Tanrısever on 7.02.2025.
//

import Foundation

enum UserEndPoint {
    case getAllUsers
}

extension UserEndPoint: EndPointProtocol {
    var schema: String {
        "https"
    }
    
    var host: String {
        "jsonplaceholder.typicode.com"
    }
    
    var path: String {
        switch self {
        case .getAllUsers:
            "/users"
        }
    }
    
    var httpMethod: HttpMethod {
        switch self {
        case .getAllUsers:
                .get
        }
    }
    
    var header: [String : String]? {
        switch self {
        case .getAllUsers:
            nil
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .getAllUsers:
            nil
        }
    }
}
