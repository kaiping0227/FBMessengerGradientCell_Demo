//
//  MessageTableViewCell.swift
//  Messenger_Gradient_Demo
//
//  Created by Kai-Ping Tseng on 2020/1/20.
//  Copyright © 2020 Francis. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    
    let type: Message.messageType = .receive
    
    let contentLabel = PaddingLabel()
    
    var id: Int = 0
    
    var holeView = UIView()
    
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
        
        addSubview(contentLabel)
        
        addHoleSubview()
        
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        contentLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        
    }
    
    func updateContent(with id: Int, messageType: Message.messageType, content: String) {
        
        self.id = id
        
        contentLabel.text = content
        
        let leftConstraint = contentLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20)
        let rightConstraint = contentLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20)
                
//        switch messageType {
//        case .receive:
//            contentLabel.textAlignment = .left
//            contentLabel.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
//            leftConstraint.isActive = true
//            rightConstraint.isActive = false
//            contentLabel.textColor = .black
//
//        case .send:
            contentLabel.textAlignment = .right
            rightConstraint.isActive = true
            leftConstraint.isActive = false
            contentLabel.textColor = .white
            contentLabel.backgroundColor = .clear
//        }
        
//        contentLabel.sizeToFit()
    }
    
    func addHoleSubview() {
        holeView = UIView(frame: bounds)
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
