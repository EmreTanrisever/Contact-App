//
//  AddressTableViewCell.swift
//  ContactApp
//
//  Created by Emre Tanrısever on 2.02.2025.
//

import Foundation

import UIKit
import ETCCommonKit
import ETCNetworkKit

final class AddressTableViewCell: UITableViewCell {
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented.")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    private func configure() {
        isUserInteractionEnabled = false
        contentView.addSubview(addressLabel)
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            addressLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            addressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            addressLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
    
}

extension AddressTableViewCell: BaseTableViewCellConfigurable {
    
    func configure(with data: Any) {
        
        if let user = data as? User {
            DispatchQueue.main.async { [weak self] in
                self?.addressLabel.text = "\(user.address.street) street, \(user.address.suite) suite, \(user.address.city) - \(user.address.zipcode)"
            }
        }
    }
}
