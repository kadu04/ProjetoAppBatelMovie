//
//  InitialView.swift
//  ProjetoAppBatelMovie
//
//  Created by Ricardo Massaki on 30/10/23.
//

import UIKit
import FirebaseAuth

protocol InitialScreenDelegate: AnyObject {
    func tappedStartButton()
    
}

class InitialView: UIView {
    
    private weak var delegate: InitialScreenDelegate?
    
    public func delegate(delegate: InitialScreenDelegate?) {
        self.delegate = delegate
    }
    
    var backGroundColorVirew: UIView {
        let view = UIView()
        view.backgroundColor = .systemTeal
        return view
        
    }
    
    lazy var backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "gradiente black")
        image.contentMode = .scaleAspectFill
        return image
        
    }()
    
    lazy var logoAppImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "batel1")
        image.contentMode = .scaleToFill
        return image
        
    }()
    
    lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Começar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 230/255, green: 0/255, blue: 127/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedStartButton), for: .touchUpInside)
        return button
        
    }()
    
    @objc func tappedStartButton() {
        delegate?.tappedStartButton()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(backGroundColorVirew)
        self.addSubview(backgroundImageView)
        self.addSubview(logoAppImageView)
        self.addSubview(startButton)
        configConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraint() {
        NSLayoutConstraint.activate([
            
            self.backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.logoAppImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            self.logoAppImageView.heightAnchor.constraint(equalToConstant: 350),
            self.logoAppImageView.widthAnchor.constraint(equalToConstant: 350),
            self.logoAppImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.startButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -145),
            self.startButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
            self.startButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100),
            self.startButton.heightAnchor.constraint(equalToConstant: 40),
        
        ])
    }
}
