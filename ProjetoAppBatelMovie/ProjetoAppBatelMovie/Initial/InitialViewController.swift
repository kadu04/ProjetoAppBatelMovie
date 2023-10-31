//
//  InitialViewController.swift
//  ProjetoAppBatelMovie
//
//  Created by Ricardo Massaki on 30/10/23.
//

import UIKit
import FirebaseAuth

class InitialViewController: UIViewController {
    
    var screen: InitialView?
    
    override func loadView() {
        screen = InitialView()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        self.navigationItem.hidesBackButton = true

    }
}

extension InitialViewController: InitialScreenDelegate {
    func tappedStartButton() {
        let viewcontroller = LoginViewController()
        navigationController?.pushViewController(viewcontroller, animated: true)
    }
}
