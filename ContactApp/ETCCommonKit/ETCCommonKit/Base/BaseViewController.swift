//
//  BaseViewController.swift
//  ETCCommonKit
//
//  Created by Emre Tanrısever on 7.02.2025.
//

import UIKit

public protocol BaseViewProtocol: AnyObject, Navigationable {
    func setTitle(title: String)
    func setBackgoundColor(color: UIColor)
    func setupUI()
    func refreshTableView()
    func addRow<T: UITableViewCell>(cellType: T.Type, identifier: String, data: [Any], height: CGFloat, itemTapHandler: ((Any) -> BaseViewController)?)
    func startAnimating()
    func stopAnimating()
    func disableTableViewScroll()
    func navigationBarIsHidden(isHidden: Bool)
    func getScreenHeight() -> CGFloat
    func removeBackButton()
    func removeSeperatorLine()
}

open class BaseViewController: UIViewController {
    
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    
    private let baseTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var viewModel = BaseViewModel(view: self)
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.viewDidLoad()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            baseTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            baseTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            baseTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            baseTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension BaseViewController: BaseViewProtocol {
    
    public func setTitle(title: String) {
        self.title = title
    }
    
    public func setBackgoundColor(color: UIColor) {
        view.backgroundColor = color
    }
    
    public func setupUI() {
        baseTableView.dataSource = self
        baseTableView.delegate = self
        
        view.addSubview(activityIndicator)
        view.addSubview(baseTableView)
        
        view.bringSubviewToFront(activityIndicator)
        setConstraints()
    }
    
    public func refreshTableView() {
        DispatchQueue.main.async { [weak self] in
            self?.baseTableView.reloadData()
        }
    }
    
    public func addRow<T: UITableViewCell>(cellType: T.Type, identifier: String, data: [Any], height: CGFloat, itemTapHandler: ((Any) -> BaseViewController)? = nil) {
        DispatchQueue.main.async { [weak self] in
            self?.baseTableView.register(cellType, forCellReuseIdentifier: identifier)
            self?.viewModel.addNewRow(newRow: RowData(identifier: identifier, data: data, height: height, itemTapHandler: itemTapHandler))
            self?.refreshTableView()
        }
    }
    
    public func startAnimating() {
        DispatchQueue.main.async { [weak self] in
            self?.activityIndicator.isHidden = false
            self?.activityIndicator.startAnimating()
        }
    }
    
    public func stopAnimating() {
        DispatchQueue.main.async { [weak self] in
            self?.activityIndicator.stopAnimating()
        }
    }
    
    public func disableTableViewScroll() {
        baseTableView.isScrollEnabled = false
    }
    
    public func navigationBarIsHidden(isHidden: Bool) {
        navigationController?.setNavigationBarHidden(isHidden, animated: true)
    }
    
    public func getScreenHeight() -> CGFloat {
        view.frame.size.height
    }
    
    public func removeBackButton() {
        navigationItem.setHidesBackButton(true, animated: false)
    }
    
    public func removeSeperatorLine() {
        baseTableView.separatorStyle = .none
    }
}

extension BaseViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRowAt(indexPath: indexPath)
    }
}

extension BaseViewController: UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowData = viewModel.cellForRowAt(indexPath: indexPath)
        
        let cell = baseTableView.dequeueReusableCell(withIdentifier: rowData.identifier, for: indexPath)
        
        if let configurableCell = cell as? BaseTableViewCellConfigurable {
            configurableCell.configure(with: rowData.data[indexPath.row])
        }
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt(indexPath: indexPath)
    }
}
