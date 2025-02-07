//
//  NetworkError.swift
//  ETCNetworkKit
//
//  Created by Emre Tanrısever on 7.02.2025.
//

import Foundation

public enum NetworkError: Error {
    case decodeError
    case noInternet
    case unknownResponseCode
    case noData
    case error(String?)
    case badRequest
}
