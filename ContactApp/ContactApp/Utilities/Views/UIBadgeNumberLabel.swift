//
//  UIBagdeNumberLabel.swift
//  ContactApp
//
//  Created by Emre Tanrısever on 1.02.2025.
//

import UIKit

class UIBadgeNumberLabel: UILabel {
    var edgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    
    override func drawText(in rect: CGRect) {
        let insetRect = rect.inset(by: edgeInsets)
        super.drawText(in: insetRect)
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + edgeInsets.left + edgeInsets.right,
                      height: size.height + edgeInsets.top + edgeInsets.bottom)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let newSize = super.sizeThatFits(size)
        return CGSize(width: newSize.width + edgeInsets.left + edgeInsets.right,
                      height: newSize.height + edgeInsets.top + edgeInsets.bottom)
    }
}
