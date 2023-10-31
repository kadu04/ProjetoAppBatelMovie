//
//  RegisterScreen.swift
//  ProjetoAppBatelMovie
//
//  Created by Ricardo Massaki on 31/10/23.
//

import UIKit
import FirebaseAuth

protocol RegisterScreenDelegate: AnyObject {
    func tappedBackButton()
    func tappedRegisterButton()
}

class RegisterScreen: UIView {
    
    var auth: Auth?
    var alert: Alert?
    
    private weak var delegate: RegisterScreenDelegate?
    
    public func delegate(delegate: RegisterScreenDelegate?) {
        self.delegate = delegate
    }
    
    lazy var backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "gradiente black")
        image.contentMode = .scaleAspectFill
        return image
        
    }()
    
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
    
    lazy var registerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 35)
        label.text = "Cadastro"
        return label
        
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "Nome completo"
        return label
        
    }()
    
    lazy var nameTextField: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.backgroundColor = .white
        txt.borderStyle = .roundedRect
        txt.keyboardType = .emailAddress
        txt.font = UIFont.systemFont(ofSize: 16)
        txt.textColor = .black
        txt.clipsToBounds = true
        txt.layer.cornerRadius = 10
        txt.layer.borderWidth = 1.0
        txt.layer.borderColor = UIColor.white.cgColor
        return txt
        
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "E-mail:"
        return label
        
    }()
    
    lazy var emailTextField: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.backgroundColor = .white
        txt.borderStyle = .roundedRect
        txt.keyboardType = .emailAddress
        txt.font = UIFont.systemFont(ofSize: 16)
        txt.textColor = .black
        txt.clipsToBounds = true
        txt.layer.cornerRadius = 10
        txt.layer.borderWidth = 1.0
        txt.layer.borderColor = UIColor.white.cgColor
        return txt
        
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "Senha:"
        return label
        
    }()
    
    lazy var passwordTextField: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.backgroundColor = .white
        txt.borderStyle = .roundedRect
        txt.keyboardType = .numberPad
        txt.font = UIFont.systemFont(ofSize: 16)
        txt.textColor = .black
        txt.clipsToBounds = true
        txt.layer.cornerRadius = 10
        txt.layer.borderWidth = 1.0
        txt.layer.borderColor = UIColor.white.cgColor
        return txt
        
    }()
    
    lazy var nicknameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "Apelido:"
        return label
        
    }()
    
    lazy var nicknameTextField: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.backgroundColor = .white
        txt.borderStyle = .roundedRect
        txt.keyboardType = .emailAddress
        txt.font = UIFont.systemFont(ofSize: 16)
        txt.textColor = .black
        txt.clipsToBounds = true
        txt.layer.cornerRadius = 10
        txt.layer.borderWidth = 1.0
        txt.layer.borderColor = UIColor.white.cgColor
        return txt
        
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
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
        self.addSubview(backgroundImageView)
        self.addSubview(backButton)
        self.addSubview(registerLabel)
        self.addSubview(nameLabel)
        self.addSubview(nameTextField)
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(nicknameLabel)
        self.addSubview(nicknameTextField)
        self.addSubview(registerButton)
        self.auth = Auth.auth()
        configConstraits()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraits() {
        NSLayoutConstraint.activate([
            
            self.backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: -15),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            self.registerLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15),
            self.registerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.nameLabel.topAnchor.constraint(equalTo: self.registerLabel.bottomAnchor, constant: 45),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.nameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            self.nameTextField.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 5),
            self.nameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            self.nameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            self.nameTextField.heightAnchor.constraint(equalToConstant: 35),
            
            self.emailLabel.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor, constant: 15),
            self.emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.emailLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.emailLabel.heightAnchor.constraint(equalToConstant: 30),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.emailLabel.bottomAnchor, constant: 5),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 35),
            
            self.passwordLabel.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 15),
            self.passwordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.passwordLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.passwordLabel.heightAnchor.constraint(equalToConstant: 30),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.passwordLabel.bottomAnchor, constant: 5),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 35),
            
            self.nicknameLabel.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 15),
            self.nicknameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.nicknameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.nicknameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            self.nicknameTextField.topAnchor.constraint(equalTo: self.nicknameLabel.bottomAnchor, constant: 5),
            self.nicknameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            self.nicknameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            self.nicknameTextField.heightAnchor.constraint(equalToConstant: 35),
            
            self.registerButton.topAnchor.constraint(equalTo: self.nicknameTextField.bottomAnchor, constant: 55),
            self.registerButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
            self.registerButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100),
            self.registerButton.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
}
