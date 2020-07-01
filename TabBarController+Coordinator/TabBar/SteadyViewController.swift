//
//  SteadyViewController.swift
//  TabBarController+Coordinator
//
//  Created by Vitalii Zaitcev on 6/18/20.
//  Copyright © 2020 Vitalii Zaitcev. All rights reserved.
//

import UIKit

class SteadyViewController: UIViewController {

    var didSendEventClosure: ((SteadyViewController.Event) -> Void)?

    private let steadyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Steady", for: .normal)
        button.backgroundColor = .systemYellow
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8.0

        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        view.addSubview(steadyButton)

        steadyButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            steadyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            steadyButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            steadyButton.widthAnchor.constraint(equalToConstant: 200),
            steadyButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        steadyButton.addTarget(self, action: #selector(didTapSteadyButton(_:)), for: .touchUpInside)
    }
    
    deinit {
        print("SteadyViewController deinit")
    }

    @objc private func didTapSteadyButton(_ sender: Any) {
        didSendEventClosure?(.steady)
    }
}

extension SteadyViewController {
    enum Event {
        case steady
    }
}
