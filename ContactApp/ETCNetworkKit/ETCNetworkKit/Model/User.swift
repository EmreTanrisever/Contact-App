//
//  User.swift
//  ETCNetworkKit
//
//  Created by Emre Tanrısever on 7.02.2025.
//

import Foundation

public struct User: Codable {
    public let id: Int
    public let name: String
    public let username: String
    public let email: String
    public let address: Address
    public let phone: String
    public let website: String
    public let company: Company
}
