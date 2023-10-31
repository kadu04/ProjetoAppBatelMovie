//
//  RegisterViewController.swift
//  ProjetoAppBatelMovie
//
//  Created by Ricardo Massaki on 31/10/23.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    let screenView = RegisterScreen()
    var auth: Auth?
    var alert: Alert?
    
    override func loadView() {
        super.loadView()
        view = screenView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        alert = Alert(controller: self)
        screenView.delegate(delegate: self)
        self.navigationItem.hidesBackButton = true
        self.auth = Auth.auth()

    }
}

extension RegisterViewController: RegisterScreenDelegate {
    func tappedBackButton() {
        let viewcontroller = LoginViewController()
        self.navigationController?.popViewController(animated: true)
    }
    
    func tappedRegisterButton() {
        let email = screenView.emailTextField
        let password = screenView.passwordTextField
        
        self.auth?.createUser(withEmail: email.text ?? "", password: password.text ?? "", completion: { ( result, error) in
            
            if email.emailValidate() && password.passwordValidate() {
                self.alert?.configAlert(title: AlertTexts.succeeded.rawValue, message: AlertTexts.registerSucceeded.rawValue, secondButton: false)
                let login = LoginViewController()
                self.navigationController?.pushViewController(login, animated: true)
                print("Sucesso ao cadastrar")
            } else {
                self.alert?.configAlert(title: AlertTexts.errorTitle.rawValue, message: AlertTexts.registerError.rawValue, secondButton: false)
                let login = RegisterViewController()
                self.navigationController?.pushViewController(login, animated: true)
                print("Falha ao cadastrar: \(error?.localizedDescription ?? "")")
            }
        })
    }
}

extension UITextField {
    func emailValidate() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return validateRegex.evaluate(with: self.text)
    }
    
    func passwordValidate() -> Bool {
        let passwordRegex = ".{6,}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return validateRegex.evaluate(with: self.text)
    }
}
