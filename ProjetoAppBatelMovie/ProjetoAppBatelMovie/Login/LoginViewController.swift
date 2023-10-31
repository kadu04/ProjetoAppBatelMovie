//
//  LoginViewController.swift
//  ProjetoAppBatelMovie
//
//  Created by Ricardo Massaki on 30/10/23.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    
    let user = Auth.auth().currentUser
    var screen = LoginScreen()
    var alert: Alert?
    var auth: Auth?
    
    override func loadView() {
        super.loadView()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        alert = Alert(controller: self)
        screen.delegate(delegate: self)
        self.navigationItem.hidesBackButton = true
        self.auth = Auth.auth()
        
    }
}

extension LoginViewController: LoginScreenDelegate {
    func tappedBackButton() {
        let viewcontroller = InitialViewController()
        self.navigationController?.popViewController(animated: true)
    }
    
    func tappedForgotPasswordButton() {
        let viewcontroller = ForgotPasswordViewController()
        self.navigationController?.pushViewController(viewcontroller, animated: true)
    }
    
    func tappedLoginButton() {
        makeLogin()
    }
    
    func tappedRegisterButton() {
        let viewcontroller = RegisterViewController()
        self.navigationController?.pushViewController(viewcontroller, animated: true)
    }
    
    private func makeLogin() {
        let email = screen.emailTextField
        let password = screen.passwordTextField
        
        auth?.signIn(withEmail: email.text ?? "", password: password.text ?? "", completion: { ( usuario, error ) in
            
            if error != nil {
                self.alert?.configAlert(title: AlertTexts.errorTitle.rawValue, message: AlertTexts.emptyFields.rawValue, secondButton: false)
                print("Falha ao logar: \(error?.localizedDescription ?? "")")
            } else {
                if usuario == nil {
                    self.alert?.configAlert(title: AlertTexts.errorTitle.rawValue, message: AlertTexts.dataIncorrect.rawValue, secondButton: false)
                } else {
                    print("Sucesso Login!!!")
                    //                    let viewModel = MovieService()
                    let viewcontroller = HomeViewController()
                    self.navigationController?.pushViewController(viewcontroller, animated: true)
                }
            }
        })
    }
}




