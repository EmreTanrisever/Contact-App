//
//  Navigationable.swift
//  ETCCommonKit
//
//  Created by Emre Tanrısever on 7.02.2025.
//

import UIKit

public protocol Navigationable {
    func pushToController(to viewController: UIViewController)
}

extension Navigationable where Self: UIViewController {
    
    public func pushToController(to viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
