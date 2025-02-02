//
//  SplashViewModel.swift
//  ContactApp
//
//  Created by Emre Tanrısever on 2.02.2025.
//

import Foundation
import ETCCommonKitUI

protocol SplashViewModelProtocol {
    
}

final class SplashViewModel: BaseViewModel {
    
    private weak var view: BaseViewProtocol?
    
    override init(view: any BaseViewProtocol) {
        super.init(view: view)
        self.view = view
    }

    override func viewDidLoad() {
        view?.setBackgoundColor(color: .white)
        view?.disableTableViewScroll()
        view?.addRow(
            cellType: SplashTableViewCell.self,
            identifier: "SplashTableViewCell",
            data: ["SplashIcon"],
            height: view?.getScreenHeight() ?? 0,
            itemTapHandler: nil
        )
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.view?.pushToController(to: HomeViewController())
        }
    }
    
    override func viewWillAppear() {
        view?.navigationBarIsHidden(isHidden: true)
    }
}
