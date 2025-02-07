//
//  BaseViewModel.swift
//  ETCCommonKit
//
//  Created by Emre Tanrısever on 7.02.2025.
//

import Foundation

public protocol BaseViewModelProtocol {
    func reloadTableView()
    func numberOfSections() -> Int
    func numberOfRowsInSection(section: Int) -> Int
    func cellForRowAt(indexPath: IndexPath) -> RowData
    func heightForRowAt(indexPath: IndexPath) -> CGFloat
    func didSelectRowAt(indexPath: IndexPath)
    func addNewRow(newRow: RowData)
}


open class BaseViewModel {
    
    private weak var view: BaseViewProtocol?
    private var rows: [RowData] = []
    
    public init(view: BaseViewProtocol) {
        self.view = view
    }
    
    open func viewDidLoad() {
        
    }
    
    open func viewWillAppear() {
        
    }
}

extension BaseViewModel: BaseViewModelProtocol {
    
    public func reloadTableView() {
        view?.refreshTableView()
    }
    
    public func numberOfSections() -> Int {
        return rows.count
    }
    
    public func numberOfRowsInSection(section: Int) -> Int {
        return rows.first?.data.count ?? 0
    }
    
    public func cellForRowAt(indexPath: IndexPath) -> RowData {
        return rows[indexPath.section]
    }
    
    public func heightForRowAt(indexPath: IndexPath) -> CGFloat {
        return rows[indexPath.section].height
    }
    
    public func didSelectRowAt(indexPath: IndexPath) {
        let rowData = rows[indexPath.section]
        let item = rowData.data[indexPath.row]
        
        if let toViewController = rowData.itemTapHandler?(item) {
            view?.pushToController(to: toViewController)
        }
    }
    
    public func addNewRow(newRow: RowData) {
        rows.append(newRow)
    }
}
