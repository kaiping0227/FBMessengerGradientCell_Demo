//
//  ReceiveMessageTableViewCell.swift
//  Messenger_Gradient_Demo
//
//  Created by Kai-Ping Tseng on 2020/1/21.
//  Copyright © 2020 Francis. All rights reserved.
//

import UIKit

class ReceiveMessageTableViewCell: UITableViewCell {
        
    let contentLabel = PaddingLabel()
        
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
    }
    
    func setupViews() {
        
        backgroundColor = .white
        
        contentLabel.clipsToBounds = true
        contentLabel.numberOfLines = 0
        contentLabel.font = UIFont.systemFont(ofSize: 15)
        contentLabel.textAlignment = .left
        contentLabel.textColor = .black
        contentLabel.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        
        addSubview(contentLabel)
                
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        contentLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        contentLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
    }
    
    func updateContent(with content: String) {
        contentLabel.text = content
    }
}
