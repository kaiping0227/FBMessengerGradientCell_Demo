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
        tableView.register(SendMessageTableViewCell.self, forCellReuseIdentifier: "sendCell")
        tableView.register(ReceiveMessageTableViewCell.self, forCellReuseIdentifier: "receiveCell")
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
            Message(id: 1, type: .send, content: "good morning!"),
            Message(id: 2, type: .receive, content: "Hi"),
            Message(id: 3, type: .send, content: "good morning!"),
            Message(id: 4, type: .receive, content: "???"),
            Message(id: 5, type: .send, content: "good morning!"),
            Message(id: 6, type: .receive, content: "good morning!"),
            Message(id: 7, type: .receive, content: "good morning!"),
            Message(id: 8, type: .receive, content: "good morning!"),
            Message(id: 9, type: .send, content: "good morning!"),
            Message(id: 10, type: .receive, content: "good morning!"),
            Message(id: 11, type: .send, content: "???"),
            Message(id: 12, type: .send, content: "good morning!"),
            Message(id: 13, type: .receive, content: "good morning!"),
            Message(id: 14, type: .send, content: "wat??"),
            Message(id: 15, type: .send, content: "good morning!"),
            Message(id: 16, type: .receive, content: "?????"),
            Message(id: 17, type: .send, content: "?????"),
            Message(id: 18, type: .send, content: "..."),
            Message(id: 19, type: .receive, content: "bye"),
            Message(id: 20, type: .receive, content: "bye"),
            Message(id: 21, type: .receive, content: "bye"),
            Message(id: 22, type: .receive, content: "bye"),
            Message(id: 23, type: .receive, content: "bye"),
            Message(id: 24, type: .send, content: "good morning!"),
            Message(id: 25, type: .receive, content: "good morning!"),
            Message(id: 26, type: .receive, content: "good morning!"),
            Message(id: 27, type: .receive, content: "good morning!"),
            Message(id: 28, type: .send, content: "good morning!"),
            Message(id: 29, type: .receive, content: "good morning!"),
            Message(id: 30, type: .send, content: "???")
        ]
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message = messages[indexPath.row]
        
        switch message.type {
        case .receive:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "receiveCell", for: indexPath) as? ReceiveMessageTableViewCell else { return UITableViewCell() }
            cell.updateContent(with: message.content)
            return cell
            
        case .send:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "sendCell", for: indexPath) as? SendMessageTableViewCell else { return UITableViewCell() }
            cell.updateContent(with: message.content)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
}
