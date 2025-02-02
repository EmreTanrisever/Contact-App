//
//  DetailViewModel.swift
//  ContactApp
//
//  Created by Emre Tanrısever on 2.02.2025.
//

import Foundation
import ETCCommonKit
import ETCNetworkKit

protocol DetailViewModelProtocol {
    func setData(data: Any)
}

final class DetailViewModel: BaseViewModel {
    
    private weak var view: BaseViewProtocol?
    private var userData: User?
    
    override init(view: any BaseViewProtocol) {
        super.init(view: view)
        self.view = view
    }
    
    override func viewDidLoad() {
        view?.setBackgoundColor(color: .white)
        view?.setTitle(title: "Contact Detail")
        view?.removeSeperatorLine()
        
        view?.addRow(cellType: TopTableViewCell.self, identifier: "TopTableViewCell", data: [userData ?? ""], height: 56, itemTapHandler: nil)
        view?.addRow(cellType: AddressTableViewCell.self, identifier: "AddressTableViewCell", data: [userData ?? ""], height: 56, itemTapHandler: nil)
        view?.addRow(cellType: ContactTableViewCell.self, identifier: "ContactTableViewCell", data: [userData ?? ""], height: 88, itemTapHandler: nil)
        view?.addRow(cellType: CompanyTableViewCell.self, identifier: "CompanyTableViewCell", data: [userData ?? ""], height: 88, itemTapHandler: nil)
        view?.addRow(cellType: MapTableViewCell.self, identifier: "MapTableViewCell", data: [userData ?? ""], height: 176, itemTapHandler: nil)
        view?.refreshTableView()
    }
    
    override func viewWillAppear() {
        
    }
}

extension DetailViewModel: DetailViewModelProtocol {
    
    func setData(data: Any) {
        if let data = data as? User {
            self.userData = data
        }
    }
}
