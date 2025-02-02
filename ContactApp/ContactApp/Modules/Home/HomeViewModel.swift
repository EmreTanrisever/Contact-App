//
//  SplashViewModel.swift
//  ContactApp
//
//  Created by Emre Tanrısever on 1.02.2025.
//

import Foundation
import ETCCommonKit
import ETCNetworkKit

protocol HomeViewModelProtocol {
    func fetchUsers()
    func returnUsers() -> [User]
}

final class HomeViewModel: BaseViewModel {
    
    private weak var view: BaseViewProtocol?
    
    private var users: [User] = []
    private let userService = UserService()
    
    override init(view: any BaseViewProtocol) {
        super.init(view: view)
        self.view = view
    }
    
    override func viewDidLoad() {
        view?.setBackgoundColor(color: .white)
        view?.setTitle(title: "Contacts")
        fetchUsers()
    }
    
    override func viewWillAppear() {
        view?.navigationBarIsHidden(isHidden: false)
        view?.removeBackButton()
    }
}

extension HomeViewModel: HomeViewModelProtocol {

    func fetchUsers() {
        view?.startAnimating()
        userService.getAllUsers { [weak self] result in
            switch result {
            case let .success(users):
                guard let self = self else { return }
                self.users = users
                view?.addRow(cellType: UserTableViewCell.self, identifier: "UserTableViewCell", data: users, height: 60, itemTapHandler: { item in
                    let controller = DetailViewController()
                    controller.handleData(data: item)
                    return controller
                })
                view?.stopAnimating()
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func returnUsers() -> [User] {
        return users
    }
}
