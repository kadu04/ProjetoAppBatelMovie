//
//  ViewController.swift
//  ProjetoAppBatelMovie
//
//  Created by Ricardo Massaki on 26/10/23.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: UpcomingViewController())
        let vc3 = UINavigationController(rootViewController: SearchViewController())
        let vc4 = UINavigationController(rootViewController: DownloadsViewController())

        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")

        vc1.title = "Início"
        vc2.title = "Em breve"
        vc3.title = "Pesquisar"
        vc4.title = "Downloads"

        tabBar.tintColor = .label

        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }
}

