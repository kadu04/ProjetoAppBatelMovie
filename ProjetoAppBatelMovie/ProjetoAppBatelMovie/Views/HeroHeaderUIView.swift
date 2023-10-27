//
//  HeroHeaderUIView.swift
//  ProjetoAppBatelMovie
//
//  Created by Ricardo Massaki on 27/10/23.
//

import UIKit

// view da HomeViewController
class HeroHeaderUIView: UIView {
    
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "posterFilme")
        imageView.clipsToBounds = true
        return imageView

    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(heroImageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
