//
//  UserTableViewCell.swift
//  ContactApp
//
//  Created by Emre Tanrısever on 1.02.2025.
//

import UIKit
import ETCCommonKit
import ETCNetworkKit

final class UserTableViewCell: UITableViewCell {

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private let emailLabel: UIEmailLabel = {
        let label = UIEmailLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.backgroundColor = .red
        label.textColor = .white
        label.layer.cornerRadius = 4
        label.layer.masksToBounds = true
        return label
    }()
    
    private let badgeLabel: UIBadgeNumberLabel = {
        let label = UIBadgeNumberLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.backgroundColor = .blue
        label.textColor = .white
        label.layer.cornerRadius = 4
        label.layer.masksToBounds = true
        return label
    }()
    
    private let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "chevron.right")
        return imageView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented.")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    private func configure() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(emailLabel)
        contentView.addSubview(badgeLabel)
        contentView.addSubview(arrowImageView)
        
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            badgeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            badgeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: badgeLabel.trailingAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            emailLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            emailLabel.leadingAnchor.constraint(equalTo: badgeLabel.trailingAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            arrowImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
}

extension UserTableViewCell: BaseTableViewCellConfigurable {
 
    func configure(with data: Any) {
        if let user = data as? User {
            self.nameLabel.text = user.name
            self.emailLabel.text = user.email
            self.badgeLabel.text = "\(user.id)"
        }
    }
}
