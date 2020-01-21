//
//  SendMessageTableViewCell.swift
//  Messenger_Gradient_Demo
//
//  Created by Kai-Ping Tseng on 2020/1/20.
//  Copyright © 2020 Francis. All rights reserved.
//

import UIKit

class SendMessageTableViewCell: UITableViewCell {
    
    // UI components
    let contentLabel = PaddingLabel()
    
    var holeView = UIView()
    
    
    // For fb message style
    var contentLabelPath = UIBezierPath()
    
    var holeViewPath = UIBezierPath()
    
    let maskLayer = CAShapeLayer()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentLabel.layer.cornerRadius = contentLabel.frame.height / 2
        
        holeView.frame = bounds
        maskLayer.frame = holeView.bounds
        contentLabelPath = UIBezierPath(roundedRect: contentLabel.frame, cornerRadius: contentLabel.bounds.height / 2)
        holeViewPath = UIBezierPath(rect: holeView.bounds)
        
        contentLabelPath.append(holeViewPath)
        
        maskLayer.path = contentLabelPath.cgPath
    }
    
    func setupViews() {
        
        backgroundColor = .clear
        
        contentLabel.clipsToBounds = true
        contentLabel.numberOfLines = 0
        contentLabel.font = UIFont.systemFont(ofSize: 15)
        contentLabel.autoresizingMask = []
        contentLabel.textAlignment = .right
        contentLabel.textColor = .white
        contentLabel.backgroundColor = .clear
        
        addSubview(contentLabel)
        
        addHoleSubview()
        
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        contentLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        contentLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
    }
    
    func updateContent(with content: String) {
        contentLabel.text = content
    }
    
    func addHoleSubview() {
        holeView.backgroundColor = .white
        holeView.autoresizingMask = []
        
        addSubview(holeView)
        
        setupMaskLayer()
    }
    
    func setupMaskLayer() {
        maskLayer.fillColor = UIColor.black.cgColor
        maskLayer.fillRule = .evenOdd
        
        holeView.layer.mask = maskLayer
    }
    
}
