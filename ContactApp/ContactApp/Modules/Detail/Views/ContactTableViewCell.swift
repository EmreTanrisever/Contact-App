//
//  ContactTableViewCell.swift
//  ContactApp
//
//  Created by Emre Tanrısever on 2.02.2025.
//

import UIKit
import ETCCommonKit
import ETCNetworkKit

final class ContactTableViewCell: UITableViewCell {
    
    private let websiteLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
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
        contentView.addSubview(websiteLabel)
        contentView.addSubview(phoneNumberLabel)
        contentView.addSubview(emailLabel)
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            websiteLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            websiteLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            phoneNumberLabel.topAnchor.constraint(equalTo: websiteLabel.topAnchor, constant: 24),
            phoneNumberLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: phoneNumberLabel.topAnchor, constant: 24),
            emailLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
}

extension ContactTableViewCell: BaseTableViewCellConfigurable {
    
    func configure(with data: Any) {
        
        if let user = data as? User {
            DispatchQueue.main.async { [weak self] in
                self?.websiteLabel.text = user.website
                self?.phoneNumberLabel.text = user.phone
                self?.emailLabel.text = user.email
            }
        }
    }
}
