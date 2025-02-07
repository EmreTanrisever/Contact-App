//
//  Address.swift
//  ETCNetworkKit
//
//  Created by Emre Tanrısever on 7.02.2025.
//

import Foundation

public struct Address: Codable {
    public let street: String
    public let suite: String
    public let city: String
    public let zipcode: String
    public let geo: Geo
}
