//
//  UserService.swift
//  ETCNetworkKit
//
//  Created by Emre Tanrısever on 7.02.2025.
//

import Foundation

public protocol UserServiceRequestable {
    func getAllUsers(completion: @escaping(Result<[User], NetworkError>) -> Void)
}

public class UserService: UserServiceRequestable {
    
    private let networkRequestable: NetworkRequestable
    
    public init(networRequestable: NetworkRequestable = APIClient()) {
        self.networkRequestable = networRequestable
    }
    
    public func getAllUsers(completion: @escaping (Result<[User], NetworkError>) -> Void) {
        networkRequestable.send(urlRequest: UserEndPoint.getAllUsers.createURLRequest(), completion: completion)
    }
}
