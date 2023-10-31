//
//  ForgotPasswordViewController.swift
//  ProjetoAppBatelMovie
//
//  Created by Ricardo Massaki on 31/10/23.
//

import UIKit
import FirebaseAuth

class ForgotPasswordViewController: UIViewController {
    
    var screenView = ForgotPasswordScreenView()
    var auth: Auth?
    var alert: Alert?
    
    override func loadView() {
        screenView = ForgotPasswordScreenView()
        view = screenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        screenView.delegate(delegate: self)
        self.auth = Auth.auth()
        self.navigationItem.hidesBackButton = true
        alert = Alert(controller: self)

    }
}

extension ForgotPasswordViewController: ForgotPasswordScreenDelegate {
    func tappedBackButton() {
        let viewcontroller = LoginViewController()
        self.navigationController?.popViewController(animated: true)
    }
    
    func tappedSendButton() {
        let email = screenView.emailTextField
        
        self.auth?.sendPasswordReset(withEmail: email.text ?? "", completion: { error in
            if let error {
                self.alert?.configAlert(title: AlertTexts.errorTitle.rawValue, message: AlertTexts.errorEmail.rawValue, secondButton: false)
            } else {
                self.alert?.configAlert(title: AlertTexts.succeeded.rawValue, message: AlertTexts.titleSucceeded.rawValue, secondButton: false)
            }
        })
    }
}
