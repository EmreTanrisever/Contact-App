//
//  SplashViewController.swift
//  ContactApp
//
//  Created by Emre Tanrısever on 30.01.2025.
//

import UIKit
import ETCCommonKitUI

final class HomeViewController: BaseViewController {
    
    private lazy var viewModel = HomeViewModel(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear()
    }
}
