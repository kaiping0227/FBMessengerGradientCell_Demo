//
//  PaddingLabel.swift
//  Messenger_Gradient_Demo
//
//  Created by Kai-Ping Tseng on 2020/1/20.
//  Copyright © 2020 Francis. All rights reserved.
//

import UIKit

class PaddingLabel: UILabel {
    
     let inset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)

    override func draw(_ rect: CGRect) {
        super.drawText(in: rect.inset(by: inset))
    }
    
    override var intrinsicContentSize: CGSize {
        var intrinsicContentSize = super.intrinsicContentSize
        intrinsicContentSize.width += inset.left + inset.right
        intrinsicContentSize.height += inset.top + inset.bottom
        return intrinsicContentSize
    }
    
}
