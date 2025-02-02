//
//  CompanyTableViewCell.swift
//  ContactApp
//
//  Created by Emre Tanrısever on 2.02.2025.
//

import UIKit
import ETCCommonKitUI
import ETCNetworkKit

final class CompanyTableViewCell: UITableViewCell {
    
    private let companyNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let catchPhraseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bsLabel: UILabel = {
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
        contentView.addSubview(companyNameLabel)
        contentView.addSubview(catchPhraseLabel)
        contentView.addSubview(bsLabel)
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            companyNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            companyNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            catchPhraseLabel.topAnchor.constraint(equalTo: companyNameLabel.topAnchor, constant: 24),
            catchPhraseLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            bsLabel.topAnchor.constraint(equalTo: catchPhraseLabel.topAnchor, constant: 24),
            bsLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
}

extension CompanyTableViewCell: BaseTableViewCellConfigurable {
    
    func configure(with data: Any) {
        
        if let user = data as? User {
            DispatchQueue.main.async { [weak self] in
                self?.companyNameLabel.text = user.company.name
                self?.catchPhraseLabel.text = user.company.catchPhrase
                self?.bsLabel.text = user.company.bs
            }
        }
    }
}
