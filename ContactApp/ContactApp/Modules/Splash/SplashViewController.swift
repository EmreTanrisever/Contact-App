//
//  SplashViewController.swift
//  ContactApp
//
//  Created by Emre Tanrısever on 2.02.2025.
//

import Foundation
import ETCCommonKitUI

protocol SplashViewProtocol: AnyObject {
    
}

final class SplashViewController: BaseViewController {
    
    private lazy var viewModel = SplashViewModel(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear()
    }
}
