//
//  TitlePreviewViewController.swift
//  ProjetoAppBatelMovie
//
//  Created by Ricardo Massaki on 03/11/23.
//

import UIKit
import WebKit

protocol TitlePreviewViewControllerDelegate: AnyObject {
}

class TitlePreviewViewController: UIViewController {
    
    private weak var delegate: TitlePreviewViewControllerDelegate?
    
    public func delegate(delegate: TitlePreviewViewControllerDelegate?) {
        self.delegate = delegate
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "Harry potter"
        return label
        
    }()
    
    lazy var overviewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        //Este é o melhor filme para assistir quando criança!
        label.text = "This is the best movie ever to watch as a kid!"
        return label
        
    }()
    
    lazy var downloadButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitle("Download", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
        
    }()
    
    lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(webView)
        self.view.addSubview(titleLabel)
        self.view.addSubview(overviewLabel)
        self.view.addSubview(downloadButton)
        configConstraints()

    }
    

    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            self.webView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            self.webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.webView.heightAnchor.constraint(equalToConstant: 300),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.webView.bottomAnchor, constant: 20),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            
            self.overviewLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 15),
            self.overviewLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.overviewLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            self.downloadButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.downloadButton.topAnchor.constraint(equalTo: self.overviewLabel.bottomAnchor, constant: 25),
            self.downloadButton.widthAnchor.constraint(equalToConstant: 120),
            self.downloadButton.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
    
    func configure(with model: TitlePreviewViewModel) {
        titleLabel.text = model.title
        overviewLabel.text = model.titleOverview
        
        guard let url = URL(string: "https://www.youtube.com/embed/\(model.youtubeView.id.videoId)") else {
            return
        }
        
        webView.load(URLRequest(url: url))
    }
}
