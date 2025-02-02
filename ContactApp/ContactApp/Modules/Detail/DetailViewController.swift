//
//  DetailViewController.swift
//  ContactApp
//
//  Created by Emre Tanrısever on 2.02.2025.
//

import Foundation
import ETCCommonKitUI

final class DetailViewController: BaseViewController {
    private lazy var viewModel = DetailViewModel(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
    
    func handleData(data: Any) {
        viewModel.setData(data: data)
    }
}
