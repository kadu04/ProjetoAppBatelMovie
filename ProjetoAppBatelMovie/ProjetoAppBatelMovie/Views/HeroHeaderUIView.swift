//
//  HeroHeaderUIView.swift
//  ProjetoAppBatelMovie
//
//  Created by Ricardo Massaki on 27/10/23.
//

import UIKit

// view da HomeViewController
class HeroHeaderUIView: UIView {
    
    private let playButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Play", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 5
        return button
        
    }()
    
    private let downloadButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Download", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 5
        return button
        
    }()
    
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "posterFilme")
        imageView.clipsToBounds = true
        return imageView
        
    }()
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            //            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(heroImageView)
        self.addSubview(playButton)
        self.addSubview(downloadButton)
        addGradient()
        configConstraints()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            //            self.exitButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            //            self.exitButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            
            self.playButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 70),
            self.playButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
            self.playButton.widthAnchor.constraint(equalToConstant: 110),
            
            self.downloadButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -70),
            self.downloadButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
            self.downloadButton.widthAnchor.constraint(equalToConstant: 110),
            
            
            
            
        ])
    }
    
    
}
