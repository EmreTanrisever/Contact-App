//
//  SplashTableViewCell.swift
//  ContactApp
//
//  Created by Emre Tanrısever on 2.02.2025.
//

import UIKit
import ETCCommonKit

final class SplashTableViewCell: UITableViewCell {
    
    private let splashIconImageView: UIImageView = {
        let splashIcon = UIImageView()
        splashIcon.translatesAutoresizingMaskIntoConstraints = false
        splashIcon.image = UIImage(named: "SplashIcon")
        splashIcon.layer.cornerRadius = 8
        splashIcon.layer.masksToBounds = true
        return splashIcon
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented.")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    private func configure() {
        contentView.addSubview(splashIconImageView)
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            splashIconImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            splashIconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            splashIconImageView.widthAnchor.constraint(equalToConstant: 200),
            splashIconImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}

extension SplashTableViewCell: BaseTableViewCellConfigurable {
    
    func configure(with data: Any) {
        
    }
}
