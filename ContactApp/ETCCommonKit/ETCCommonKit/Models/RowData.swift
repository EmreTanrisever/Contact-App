//
//  RowData.swift
//  ETCCommonKit
//
//  Created by Emre Tanrısever on 7.02.2025.
//

import Foundation

public struct RowData {
    let identifier: String
    let data: [Any]
    let height: CGFloat
    let itemTapHandler: ((Any) -> BaseViewController)?
}
