//
//  ViewController.swift
//  Messenger_Gradient_Demo
//
//  Created by Kai-Ping Tseng on 2020/1/20.
//  Copyright © 2020 Francis. All rights reserved.
//

import UIKit

struct Message {
    
    enum messageType {
        case receive
        case send
    }
    
    let id: Int
    let type: messageType
    let content: String
    
}

class ViewController: UIViewController {
    
    private let tableView = UITableView()
    
    private var messages = [Message]()
    
    let gradient = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        mockCells()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        gradient.frame = view.bounds
    }

    private func setupViews() {
                
        gradient.startPoint = CGPoint(x: 0.5, y: 0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1)
        gradient.colors = [UIColor(red: 0.0, green: 1.0, blue: 0.752, alpha: 1.0).cgColor,
                           UIColor(red: 0.949, green: 0.03, blue: 0.913, alpha: 1.0).cgColor]
        view.layer.addSublayer(gradient)
        
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MessageTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func mockCells() {
        messages = [
            Message(id: 1, type: .send, content: "早安啊"),
            Message(id: 2, type: .receive, content: "早"),
            Message(id: 3, type: .send, content: "Hello"),
            Message(id: 4, type: .receive, content: "講幾次"),
            Message(id: 5, type: .send, content: "早安啊"),
            Message(id: 6, type: .receive, content: "早安啊"),
            Message(id: 7, type: .receive, content: "早安啊"),
            Message(id: 8, type: .receive, content: "早安啊"),
            Message(id: 9, type: .send, content: "早安啊"),
            Message(id: 10, type: .receive, content: "早安啊"),
            Message(id: 11, type: .send, content: "早安啊"),
            Message(id: 12, type: .send, content: "早安啊"),
            Message(id: 13, type: .receive, content: "早安啊"),
            Message(id: 14, type: .send, content: "早安啊"),
            Message(id: 15, type: .send, content: "早安啊"),
            Message(id: 16, type: .receive, content: "早安啊"),
            Message(id: 17, type: .send, content: "早安啊"),
            Message(id: 18, type: .send, content: "早安啊"),
            Message(id: 19, type: .receive, content: "早"),
            Message(id: 20, type: .receive, content: "早"),
            Message(id: 21, type: .receive, content: "早"),
            Message(id: 22, type: .receive, content: "早"),
            Message(id: 23, type: .receive, content: "早"),
            Message(id: 24, type: .receive, content: "早"),
            Message(id: 25, type: .receive, content: "早"),
        ]
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MessageTableViewCell else { return UITableViewCell() }
        
        let message = messages[indexPath.row]
        
        cell.updateContent(with: message.id, messageType: message.type, content: message.content)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
}
