//
//  TopTableViewCell.swift
//  ContactApp
//
//  Created by Emre Tanrısever on 2.02.2025.
//

import UIKit
import ETCCommonKitUI
import ETCNetworkKit

final class TopTableViewCell: UITableViewCell {
    
    private let badgeNumberLabel: UIBadgeNumberLabel = {
        let label = UIBadgeNumberLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.backgroundColor = .blue
        label.textColor = .white
        label.layer.cornerRadius = 4
        label.layer.masksToBounds = true
        return label
    }()
    
    private let nameLabel: UILabel = {
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
        contentView.addSubview(badgeNumberLabel)
        contentView.addSubview(nameLabel)
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            badgeNumberLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            badgeNumberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
}

extension TopTableViewCell: BaseTableViewCellConfigurable {
    
    func configure(with data: Any) {
        
        if let user = data as? User {
            badgeNumberLabel.text = "\(user.id)"
            nameLabel.text = user.name
        }
    }
}
