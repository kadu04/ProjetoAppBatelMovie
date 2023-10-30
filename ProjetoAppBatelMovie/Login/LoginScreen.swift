//
//  LoginScreen.swift
//  ProjetoAppBatelMovie
//
//  Created by Ricardo Massaki on 30/10/23.
//

import UIKit
import FirebaseAuth
import Firebase

protocol LoginScreenDelegate: AnyObject {
    func tappedBackButton()
    func tappedForgotPasswordButton()
    func tappedLoginButton()
    func tappedRegisterButton()
}

class LoginScreen: UIView {
    
    var auth: Auth?
    
    private weak var delegate: LoginScreenDelegate?
    
    public func delegate(delegate: LoginScreenDelegate) {
        self.delegate = delegate
    }
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "goback-button"), for: .normal)
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
        
    }()
    
    @objc func tappedBackButton() {
        delegate?.tappedBackButton()
    }
    
    lazy var backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "")
        image.contentMode = .scaleAspectFit
        return image
        
    }()
    
    lazy var logoAppImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "batel1")
        image.contentMode = .scaleAspectFit
        return image
        
    }()
    
    lazy var emailTextField: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.autocorrectionType = .no
        txt.backgroundColor = .lightGray
        txt.borderStyle = .roundedRect
        txt.keyboardType = .emailAddress
        txt.attributedPlaceholder = NSAttributedString(string: "Digite seu email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.4)])
        txt.font = UIFont.systemFont(ofSize: 14)
        txt.textColor = .white
        txt.clipsToBounds = true
        txt.layer.cornerRadius = 10
        txt.layer.borderWidth = 1.5
        txt.layer.borderColor = UIColor.white.cgColor
        return txt
        
    }()
    
    lazy var passwordTextField: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.autocorrectionType = .no
        txt.backgroundColor = .lightGray
        txt.borderStyle = .roundedRect
        txt.keyboardType = .numberPad
        txt.attributedPlaceholder = NSAttributedString(string: "Digite sua senha", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.4)])
        txt.font = UIFont.systemFont(ofSize: 14)
        txt.textColor = .white
        txt.clipsToBounds = true
        txt.layer.cornerRadius = 10
        txt.layer.borderWidth = 1.5
        txt.layer.borderColor = UIColor.white.cgColor
        return txt
        
    }()
    
    lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Esqueceu a senha?", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.setTitleColor(UIColor(red: 231/255, green: 48/255, blue: 214/255, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(tappedForgotPasswordButton), for: .touchUpInside)
        return button
        
    }()
    
    @objc func tappedForgotPasswordButton() {
        delegate?.tappedForgotPasswordButton()
    }
    
    lazy var subLoginView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "gradiente black")
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
        return image
        
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return button
        
    }()
    
    @objc func tappedLoginButton() {
        delegate?.tappedLoginButton()
    }
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastre-se", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 230/255, green: 0/255, blue: 127/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return button
        
    }()
    
    @objc func tappedRegisterButton() {
        delegate?.tappedRegisterButton()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.auth = Auth.auth()
        self.addSubview(backButton)
        self.addSubview(backgroundImageView)
        self.addSubview(logoAppImageView)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(forgotPasswordButton)
        self.addSubview(loginButton)
        self.addSubview(subLoginView)
        self.addSubview(registerButton)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            self.backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: -15),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            self.logoAppImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: -30),
            self.logoAppImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 350),
            self.logoAppImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -350),
            self.logoAppImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.logoAppImageView.bottomAnchor, constant: 10),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 35),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 10),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 35),
            
            self.forgotPasswordButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 9),
            self.forgotPasswordButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.forgotPasswordButton.heightAnchor.constraint(equalToConstant: 16),
            
            self.loginButton.topAnchor.constraint(equalTo: self.forgotPasswordButton.bottomAnchor, constant: 46),
            self.loginButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.loginButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.loginButton.heightAnchor.constraint(equalToConstant: 41),
            
            self.subLoginView.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
            self.subLoginView.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor),
            self.subLoginView.topAnchor.constraint(equalTo: loginButton.topAnchor),
            self.subLoginView.bottomAnchor.constraint(equalTo: loginButton.bottomAnchor),
            
            self.registerButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -125),
            self.registerButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
            self.registerButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100),
            self.registerButton.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
}
