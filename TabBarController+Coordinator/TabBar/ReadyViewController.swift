//
//  ReadyViewController.swift
//  TabBarController+Coordinator
//
//  Created by Vitalii Zaitcev on 6/18/20.
//  Copyright © 2020 Vitalii Zaitcev. All rights reserved.
//

import UIKit

class ReadyViewController: UIViewController {

    var didSendEventClosure: ((ReadyViewController.Event) -> Void)?

    private let readyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Ready", for: .normal)
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8.0

        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white

        view.addSubview(readyButton)

        readyButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            readyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            readyButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            readyButton.widthAnchor.constraint(equalToConstant: 200),
            readyButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        readyButton.addTarget(self, action: #selector(didTapReadyButton(_:)), for: .touchUpInside)
    }
    
    deinit {
        print("ReadyViewController deinit")
    }
    
    @objc private func didTapReadyButton(_ sender: Any) {
        didSendEventClosure?(.ready)
    }
}

extension ReadyViewController {
    enum Event {
        case ready
    }
}
