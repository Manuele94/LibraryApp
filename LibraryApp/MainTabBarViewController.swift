//
//  ViewController.swift
//  LibraryApp
//
//  Created by Emmanuele Montagna on 15/10/22.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: UpComingViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "play")

        vc1.title = "Home"
        vc2.title = "Coming Soon"
        
        tabBar.tintColor = .label

        setViewControllers([vc1,vc2], animated: true)
    }


}

